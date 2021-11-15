const searchBarSticky = () => {
  const searchBar = document.getElementById('search-bar-container');
  if (searchBar) {
    // When the user scrolls the page, execute myFunction
    window.onscroll = () => { myFunction() };

    // Get the offset position of the navbar
    const sticky = searchBar.offsetTop;

    // Add the sticky class to the navbar when you reach its scroll position. Remove "sticky" when you leave the scroll position
    function myFunction() {
      if (window.pageYOffset >= sticky) {
        searchBar.classList.remove("container")
      } else {
        navbar.classList.add("container");
      }
    }
  }
}

  export { searchBarSticky };
