const searchBarSticky = () => {
  const searchBar = document.getElementById('search-bar-container');
  if (searchBar) {

    // Get the offset position of the navbar
    const sticky = searchBar.offsetTop;

    const bar = document.getElementById('search-bar');

    // Add the sticky class to the navbar when you reach its scroll position. Remove "sticky" when you leave the scroll position
    const myFunction = () => {
      if (window.pageYOffset >= sticky) {
        bar.classList.add("w-100")
      } else {
        bar.classList.remove("w-100");
      }
    }

    // When the user scrolls the page, execute myFunction
    window.onscroll = () => { myFunction() };
  }
}

export { searchBarSticky };
