const pay = () => {
  console.log("OK") 
  Payjp.setPublicKey("pk_test_2dfe51b04858139e9f0ba35a");
  const submit = document.getElementById("button");
  submit.addEventListener("click", (e) => {
    e.preventDefault();
    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("address[number]"),
      cvc: formData.get("address[cvc]"),
      exp_month: formData.get("address[exp_month]"),
      exp_year: `20${formData.get("address[exp_year]")}`,
    };
    console.log(card);

    Payjp.createToken(card, (status, response) => {
      if (status == 200) {        
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type="hidden"> `;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }
      
      
      document.getElementById("card-number").removeAttribute("name");
      document.getElementById("card-cvc").removeAttribute("name");
      document.getElementById("card-exp-month").removeAttribute("name");
      document.getElementById("card-exp-year").removeAttribute("name");

      document.getElementById("charge-form").submit();

    });
  });
};

window.addEventListener("load", pay);