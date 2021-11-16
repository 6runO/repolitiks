const onSelectChange = () => {
  const selectElement = document.getElementById('estado');
  if (selectElement) {
    selectElement.addEventListener('change', () => {
      if (selectElement.value !== '') {
        selectElement.classList.remove('select-gray');
      } else {
        selectElement.classList.add('select-gray');
      };
    });
  };

  const selectElement2 = document.getElementById('eleito');
  if (selectElement2) {
    selectElement2.addEventListener('change', () => {
      if (selectElement2.value !== '') {
        selectElement2.classList.remove('select-gray');
      } else {
        selectElement2.classList.add('select-gray');
      };
    });
  };
};

export { onSelectChange };
