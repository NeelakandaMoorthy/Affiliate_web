# Outfits Here — Static Affiliate Fashion Site

## Run
Open `index.html` locally, or upload the whole folder to any static host.

## Add 5 products daily
Edit `products.js` and add objects to `PRODUCTS` with:
`id, name, image, description, price, originalPrice, category, brand, affiliateUrl, dateAdded, tags, featured, trending, label`.

The homepage automatically sorts products by `dateAdded`.

## Replace affiliate URLs
The sample URLs currently point to Amazon India. Replace them with your actual affiliate URLs.

## Analytics
Every Shop Now/View Product click pushes:
`affiliate_product_click`
with product ID, product name, category and timestamp into `window.dataLayer`.
It also keeps a simple local click count in `localStorage` under `oh_clicks`.

For production analytics, connect `window.dataLayer` to Google Tag Manager/GA4 or another analytics provider.

## Important
This is a discovery/affiliate site. It has no checkout, inventory, order confirmation or fake retailer claims.
