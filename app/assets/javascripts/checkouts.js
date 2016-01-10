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

    $("#checkout-form-container .form-checkout input[type='submit']")
      .on("click", function(event) {
        event.preventDefault()

        formFields = getAllFormFields($(this).parent("form"))

        Veritrans.token(card, function callback(response) {
          if (response.status_code == '200') {
            formFields['credit_card[token]'] = response.token_id 
            $.ajax({
              type: 'POST',
              url: $("#checkout-form-container .form-checkout").attr("action"),
              data: formFields,
              beforeSend: function() {
                console.log("Before send")
              },
              complete: function(e) {
                console.log("Complete")
                response = e.responseJSON
                if (response.ok) {
                  window.location = '/'
                } else {
                  alert("There is an error in checking out. Contact Admin")
                }
              }
            })
          } else {
            alert("Error while processing payment")
            console.log(JSON.stringify(response))
          }
        })
      })
  }
})
