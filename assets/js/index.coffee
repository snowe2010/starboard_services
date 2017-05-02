document.write("It works.")
#
#qwery = require('qwery')
#bonzo = require('bonzo')
domready = require('domready')
#bean = require('bean')

#$ = (selector) ->
#   bonzo(qwery(selector))
#import * as $ from 'ender.js'

domready(() ->
  console.log "hi"

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
# Flip card back to the front side
  $('#flip-back').click ->
    $('#product-card').removeClass('flip180').addClass 'flip190'
    setTimeout (->
      $('#product-card').removeClass('flip190').addClass 'flip90'
      $('#product-back div.shadow').css('opacity', 0).fadeTo 100, 1, ->
        $('#product-back, #product-back div.shadow').hide()
        $('#product-front, #product-front div.shadow').show()
        return
      return
    ), 50
    setTimeout (->
      $('#product-card').removeClass('flip90').addClass 'flip-10'
      $('#product-front div.shadow').show().fadeTo 100, 0
      setTimeout (->
        $('#product-front div.shadow').hide()
        $('#product-card').removeClass('flip-10').css 'transition', '100ms ease-out'
        $('#cx, #cy').removeClass 's1 s2 s3'
        return
      ), 100
      return
    ), 150
    return

  ### ----  Image Gallery Carousel   ---- ###

  carousel = $('#carousel ul')
  carouselSlideWidth = 335
  carouselWidth = 0
  isAnimating = false
# building the width of the casousel
  $('#carousel li').each ->
    carouselWidth += carouselSlideWidth
    return
  $(carousel).css 'width', carouselWidth
# Load Next Image
  $('div.carouselNext').on 'click', ->
    currentLeft = Math.abs(parseInt($(carousel).css('left')))
    newLeft = currentLeft + carouselSlideWidth
    if newLeft == carouselWidth or isAnimating == true
      return
    $('#carousel ul').css
      'left': '-' + newLeft + 'px'
      'transition': '300ms ease-out'
    isAnimating = true
    setTimeout (->
      isAnimating = false
      return
    ), 300
    return
# Load Previous Image
  $('div.carouselPrev').on 'click', ->
    currentLeft = Math.abs(parseInt($(carousel).css('left')))
    newLeft = currentLeft - carouselSlideWidth
    if newLeft < 0 or isAnimating == true
      return
    $('#carousel ul').css
      'left': '-' + newLeft + 'px'
      'transition': '300ms ease-out'
    isAnimating = true
    setTimeout (->
      isAnimating = false
      return
    ), 300
    return
)