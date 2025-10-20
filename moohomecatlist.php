<?php
if (!defined('_PS_VERSION_')) {
    exit;
}

class Moohomecatlist extends Module
{
    public function __construct()
    {
        $this->name = 'moohomecatlist';
        $this->tab = 'front_office_features';
        $this->version = '1.0.0';
        $this->author = 'moonia';
        $this->need_instance = 0;
        $this->bootstrap = true;

        parent::__construct();

        $this->displayName = $this->l('Categories list on home page');
        $this->description = $this->l('Displays selected home categories as tiles on the homepage.');
    }

    public function install()
    {
        return parent::install() && $this->registerHook('displayHomeCategoriesExtended');
    }

    public function uninstall()
    {
        return parent::uninstall();
    }

    public function hookDisplayHomeCategoriesExtended($params)
    {
        $context = Context::getContext();
        $langId = (int)$context->language->id;

        $parentId = 2; // Home category
        $children = Category::getChildren($parentId, $langId);
        $categories = [];

        if (!empty($children) && is_array($children)) {
            $ids = array_map(function ($c) { return (int)$c['id_category']; }, $children);
            $db = Db::getInstance();
            $idsList = implode(',', $ids ?: [0]);
            $sql = 'SELECT id_category, description FROM '._DB_PREFIX_.'category_lang WHERE id_lang='.(int)$langId.' AND id_category IN ('.$idsList.')';
            $rows = $db->executeS($sql);
            $descriptions = [];
            if ($rows) { foreach ($rows as $r) { $descriptions[(int)$r['id_category']] = $r['description']; } }

            foreach ($children as $c) {
                $id = (int)$c['id_category'];
                $categories[] = [
                    'id_category' => $id,
                    'name' => $c['name'],
                    'link_rewrite' => $c['link_rewrite'],
                    'description' => isset($descriptions[$id]) ? $descriptions[$id] : '',
                ];
                if (count($categories) >= 8) { break; }
            }
        }

        $this->context->smarty->assign('moohc_categories', $categories);
        return $this->display(__FILE__, 'views/templates/hook/home_categories.tpl');
    }
}
