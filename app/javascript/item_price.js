window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxValue = Math.floor(inputValue * 0.1);
    const profitValue = inputValue - addTaxValue;

    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = addTaxValue;

    const profitDom = document.getElementById("profit");
    profitDom.innerHTML = profitValue;
  })
});