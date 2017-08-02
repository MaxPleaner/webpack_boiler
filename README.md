This provides a starting point for a webpack application.

It includes the following compilation setup:

1. .coffee files are run through a [coffeescript 2](http://coffeescript.org/v2/)
   processor. Since it can output JSX and ES6, it's then fed through Babel loaders
   to produce browser-suitable ES5.
2. .slim templates can be loaded into html strings via require.
   To do so: `template_html = require 'html-loader!./page.slim'`.
   This uses the [slim-loader](http://github.com/maxpleaner/slim-lang-loader) I authored.
3. .sass paths can be passed to `require` and they will be automatically
   appended to the page
4. gifs can be manipulated and transformed to webm using the
   [animation-loader](http://github.com/maxpleaner/animation-loader) I authored.
   See that readme for more info.

---

To use:

1. clone
2. npm install
3. npm run dev
4. localhost:8080

to get ready for production

1. npm run deploy
2. push dist folder to a static host
