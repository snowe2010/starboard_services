$.domReady(() ->

  $('#product-card').hover (->
    $(this).addClass 'animate'
    $('div.carouselNext, div.carouselPrev').addClass 'visible'
    return
  ), ->
    $(this).removeClass 'animate'
    $('div.carouselNext, div.carouselPrev').removeClass 'visible'
    return
# Flip card to the back side
  $('#view_details').click ->
    $('div.carouselNext, div.carouselPrev').removeClass 'visible'
    $('#product-card').addClass 'flip-10'
    setTimeout (->
      $('#product-card').removeClass('flip-10').addClass('flip90').find('div.shadow').show().fadeTo 80, 1, ->
        $('#product-front, #product-front div.shadow').hide()
        return
      return
    ), 50
    setTimeout (->
      $('#product-card').removeClass('flip90').addClass 'flip190'
      $('#product-back').show().find('div.shadow').show().fadeTo 90, 0
      setTimeout (->
        $('#product-card').removeClass('flip190').addClass('flip180').find('div.shadow').hide()
        setTimeout (->
          $('#product-card').css 'transition', '100ms ease-out'
          $('#cx, #cy').addClass 's1'
          setTimeout (->
            $('#cx, #cy').addClass 's2'
            return
          ), 100
          setTimeout (->
            $('#cx, #cy').addClass 's3'
            return
          ), 200
          $('div.carouselNext, div.carouselPrev').addClass 'visible'
          return
        ), 100
        return
      ), 100
      return
    ), 150
    return
)