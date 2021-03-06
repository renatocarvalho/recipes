$ ->
  # colobox settings:
  $.colorbox.settings.close = "<a href='#' class=\"btn btn-small\">x</a>"
  $.colorbox.settings.previous = "<a href='#' class=\"btn\"><i class=\"icon-arrow-left\"></i></a>"
  $.colorbox.settings.next = "<a href='#' class=\"btn\"><i class=\"icon-arrow-right\"></i></a>"
  $.colorbox.settings.opacity = 0.8
  $.colorbox.settings.speed = 200

  # setup tooltips and filter out links that are a part of recipe page
  # flexslider slideshow
  $('.tooltipped').tooltip({
    placement: 'right'
  })

  $('.flexslider').flexslider
    animation: 'slide',
    slideshow: false,
    keyboardNav: false,
    prevText: '‹',
    nextText: '›',
    manualControls: '.custom-controls li',

  # flexslider will not change slides unless you click the nav
  $('#recipe_info .custom-controls li').hoverIntent(->
    $(this).trigger('click')
  , ->
      null
  )

  $('#recipe_info .slides li:not(.clone) a').colorbox
    maxWidth: '100%'

  # inline editing js plugin
  $('.best_in_place').best_in_place()

  # make boostrap 'disabled' links and such actually disabled
  $('a.disabled').click ->
    false

  # flash messages go away after a bit
  $('#container .flash').delay(4000).slideUp(500)

  # controls whether or not to show the recipe title chevron
  title = $('.recipes-show .title')
  if title.length and (title[0].scrollWidth >  title.width())
    title.find('i').show()

  $('.recipes-show .title').click ->
    $(this).toggleClass('full')
      .find('i').toggleClass('icon-chevron-down')


  # the only thing I use modernizr for so far
  Modernizr.addTest 'fileinput', ->
    elem = document.createElement('input')
    elem.type = 'file'
    return !elem.disabled
