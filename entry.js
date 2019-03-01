// jQuery gives useful methods for working with HTML
var $ = require("jquery");

// Load the css
import css from './style.css'

// Load the subpages HTML as strings
import Header from "./pages/header.html"
import Footer from "./pages/footer.html"
import RootPage from "./pages/root.html"
import Page1 from "./pages/page1.html"
import Page2 from "./pages/page2.html"
import Page3 from "./pages/page3.html"

// Add them to a dictionary for easy lookup
window.pages = {
  root: RootPage,
  page1: Page1,
  page2: Page2,
  page3: Page3
};

// Special function called when the page is ready
$(function(){

  $("#header").html(Header);
  $("#footer").html(Footer);

  // The container for the current page
  var $currentPage = $("#current-page");

  // custom handler when header links are clicked
  $(".header-link").on("click", function (event) {

    // Stop the event from firing as normal
    event.preventDefault();

    // Identify the link that was clicked
    var $link = $(event.currentTarget)

    // removes the '#' from the start of the href
    var pageName = $link.attr("href").slice(1)

    // fills in the current page container
    $currentPage.html(pages[pageName]);

  });

  // Start the page off on the root page.
  $currentPage.html(pages.root);
});