window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxValue = inputValue * 0.1;
    const addProfitValue = inputValue - addTaxValue;

    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = (Math.floor(addTaxValue));

    const addProfitDom = document.getElementById("profit");
    addProfitDom.innerHTML = (Math.floor(addProfitValue));
  })
});