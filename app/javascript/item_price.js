window.addEventListener('load', () => {

  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input",() => {
   const inputValue = priceInput.value;
   console.log(inputValue);
   const addTaxDom = document.getElementById("add-tax-price");
   addTaxDom.innerHTML = (Math.floor(inputValue * 0.1 ));
    console.log(addTaxDom);
    const addPofitDom = document.getElementById("profit")
    addPofitDom.innerHTML = Math.floor(priceInput.value - Math.round(priceInput.value * 0.1));
      console.log(addPofitDom);
  })
});   
   