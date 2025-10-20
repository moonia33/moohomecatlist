{if !empty($moohc_categories)}
<section class="container">
  <div class="row">
      <div class="col-lg-3 g-0 border bg-white">
            <div class="row align-items-center h-100 g-0">
              <div class="content-body p-3">
                <header class="section-heading">
                  <h3 class="section-title">{l s='Browse Categories' mod='moohomecatlist'}</h3>
                  <p>{l s='Browse our catalog' mod='moohomecatlist'}</p>
                </header>
                <div class="d-flex mt-5  justify-content-center">
                <div class="bg-primary lh-1 p-1 rounded-circle">
                  <i class="icon chevrons-right bg-white"></i>
                  </div>
                </div>
              </div>
            </div>
      </div>
      <div class="col-lg-9">
        <div class="row ">    
          {foreach from=$moohc_categories item=category}
            {assign var=cat_img_file value=$smarty.const._PS_CAT_IMG_DIR_|cat:$category.id_category|cat:'_thumb-category_default.jpg'}
            {assign var=cat_img_url value=$link->getMediaLink($smarty.const._THEME_CAT_DIR_|cat:$category.id_category|cat:'_thumb-category_default.jpg')}
            <div class="col-6 col-md-4 col-lg-3 col-sm-6 g-0 border bg-white justify-content-space-around align-items-stretch d-flex">
              <figure class="card-product-grid card-sm d-flex flex-wrap justify-content-center m-0 flex-column w-100">
                <a href="{$link->getCategoryLink($category.id_category)}" class="img-wrap w-100 p-4">
                  {if file_exists($cat_img_file)}
                    <img src="{$cat_img_url}" class="img-fluid w-100 rounded-5 border" alt="{$category.name|escape:'htmlall':'UTF-8'}" loading="lazy">
                  {else}
                    <img src="{$urls.no_picture_image.small.url}" class="img-fluid rounded-5 border" alt="{$category.name|escape:'html':'UTF-8'}" loading="lazy">
                  {/if}
                </a>
                <div class="pb-3 px-4">
                  <div class="text-wrap">
                    <a href="{$link->getCategoryLink($category.id_category)}" class="title">{$category.name|escape:'htmlall':'UTF-8'}</a>
                  </div>
                </div>
              </figure>
            </div>
          {/foreach}
        </div>
      </div>
  </div>
</section>
{/if}