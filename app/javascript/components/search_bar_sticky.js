const searchBarSticky = () => {
  const searchBarContainer = document.getElementById('search-bar-container');
  if (searchBarContainer) {

    // Get the offset position of the navbar
    // const sticky = searchBarContainer.offsetTop;

    const searchBar = document.getElementById('search-bar');

    window.addEventListener('scroll', () => {
      if (window.scrollY >= window.innerHeight) {
        searchBarContainer.classList.add("sticky");
        searchBar.classList.add("w-100");
      } else {
        searchBarContainer.classList.remove("sticky");
        searchBar.classList.remove("w-100");
      }
    });

    // Add the sticky class to the navbar when you reach its scroll position. Remove "sticky" when you leave the scroll position
    // const myFunction = () => {
    //   if (window.pageYOffset >= sticky) {
    //     searchBarContainer.classList.add("sticky");
    //     searchBar.classList.add("w-100");
    //     // searchBar.classList.add("bg-dark");
    //   } else {
    //     searchBarContainer.classList.remove("sticky");
    //     searchBar.classList.remove("w-100");
    //     // searchBar.classList.remove("bg-dark");
    //   }
    // }

    // When the user scrolls the page, execute myFunction
    // window.onscroll = () => { myFunction() };
  }
}

export { searchBarSticky };
