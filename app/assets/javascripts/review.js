$(document).ready(function() {
  if ($(".book-detail #book-reviews").length > 0) {
    // create the rating widget
    $(".book-rating-widget").rateYo({
      rating: 1.5,
      numStars: 5,
      halfStar: true,
      minValue: 0,
      maxValue: 5,
      starWidth: "16px",
      spacing: "5px"
    }).on("rateyo.set", function(e, data){
    })

    // prevent form from submitting when submit button is clicked
    $(".review-form input[type='submit']").click(function(evt){
      evt.preventDefault()
    })
  }
})
