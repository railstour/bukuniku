$(document).ready(function() {
  if($("#checkout-form-container .payment-form-frame").length > 0) {
    $("#cc_card_number").makeCreditCardField()

    Veritrans.client_key = window.veritransClientKey
    Veritrans.url = window.veritransBaseUrl + "/token"

    var card = function() { return {
      'card_number': $("#cc_card_number").val(),
      'card_exp_month': $("#cc_card_exp_month").val(),
      'card_exp_year': $("#cc_card_exp_year").val(),
      'card_cvv': $("#cc_card_cvv").val()
    }}

    getAllFormFields = function(targetForm) {
      fields = {}
      targetForm.find("input[name], textarea").each(function(i,elm){
        elm = $(elm)

        fieldName = elm.attr("name")

        // do not include credit card data, it's sensitive!
        if (!(fieldName.indexOf("direct") == 0)) {
          fields[fieldName] = elm.val()
        }
      })
      return fields
    }
  }
})
