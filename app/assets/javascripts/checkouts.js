$(document).ready(function() {
  if($("#checkout-form-container .payment-form-frame").length > 0) {
    $("#cc_card_number").makeCreditCardField()
  }
})
