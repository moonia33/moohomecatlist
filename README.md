# Categories list on home page (moohomecatlist)

<a href="https://github.com/moonia33/moohomecatlist/releases/latest/download/moohomecatlist.zip">
  <img alt="Download moohomecatlist.zip" src="https://img.shields.io/badge/download-moohomecatlist.zip-blue?style=for-the-badge">
</a>

Lightweight PrestaShop module that displays selected home categories as tiles on the homepage.

## Features
- Uses a dedicated hook `displayHomeCategoriesExtended`
- Lists up to 8 child categories of the Home category (id 2)
- Shows category image (or fallback no-picture), name, and link
- Simple markup compatible with most PS 1.7/9 themes

## Compatibility
- Tested with PS 9.x, expected to work with 1.7.8+

## Installation
1. Copy `moohomecatlist` to `modules/`
2. Install from BO > Modules > Module Manager
3. Ensure your theme or layout places the hook `displayHomeCategoriesExtended` in the homepage

## How it works
- Fetches direct children of the Home category (id 2) for the current language
- Queries category descriptions in a single SQL to avoid N+1 where useful
- Assigns `moohc_categories` to the Smarty template `views/templates/hook/home_categories.tpl`

## Author
- moonia — ramunas@inultimo.lt

---

# LT (Lietuviškai)

Lengvas modulis, rodantis namų (Home) kategorijos vaikus kaip korteles pagrindiniame puslapyje.

## Funkcionalumas
- Naudoja atskirą hook’ą `displayHomeCategoriesExtended`
- Rodo iki 8 tiesioginių Home (id 2) vaikų kategorijų
- Rodo kategorijos paveikslėlį (arba no-picture), pavadinimą ir nuorodą
- Paprastas šablonas, paprastai suderinamas su 1.7/9 temomis

## Suderinamumas
- Testuota su PS 9.x, turėtų veikti ir su 1.7.8+

## Diegimas
1. Nukopijuokite `moohomecatlist` į `modules/`
2. Įdiekite per BO > Modules > Module Manager
3. Įsitikinkite, kad jūsų tema arba išdėstymas įtraukia hook’ą `displayHomeCategoriesExtended` pagrindiniame puslapyje

## Kaip veikia
- Užklausia Home (id 2) tiesiogines vaikų kategorijas einamai kalbai
- Papildomai pasiima aprašymus vienu SQL (jei reikės ateityje išvesti)
- Į šabloną perduoda `moohc_categories` masyvą (`views/templates/hook/home_categories.tpl`)
