const priceInput = document.getElementById("item-price");
priceInput.addEventListener("input", () => {
   const inputValue = parseFloat(priceInput.value);

   const taxAmount = Math.floor(inputValue * 0.1); 
   const taxedPrice = inputValue - taxAmount; 

   const addTaxDom = document.getElementById("add-tax-price");
   const total = document.getElementById("profit");

   addTaxDom.innerHTML =  taxAmount;
   total.innerHTML =  taxedPrice;
});
