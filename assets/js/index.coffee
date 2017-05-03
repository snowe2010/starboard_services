$.domReady () ->
  $('#product-card-container').hover (->
    $(this).addClass 'animate'
  ), ->
    $(this).removeClass 'animate'
