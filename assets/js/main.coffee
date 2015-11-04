console.log 'hello there!'

$("#button").on "click", ->
  $(this).toggleClass("hamburger-open")
