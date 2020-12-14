function items (){
  const price = document.getElementById("item-price");
  price.addEventListener("input", () => {
    //inputがイベント
    const inputValue = price.value;
    //valueフォームの入力欄の中身取得
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML =  Math.floor(inputValue / 10);

    const addDom = document.getElementById("profit");
    addDom.innerHTML =  (inputValue - addTaxDom.innerHTML)
  })
}
window.addEventListener("load", items);