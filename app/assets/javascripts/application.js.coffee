# // This is a manifest file that'll be compiled into application.js, which will include all the files
# // listed below.
# //
# // Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
# // or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
# //
# // It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
# // compiled file.
# //
# // Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
# // about supported directives.
# //
//= require jquery
//= require jquery_ujs
//= require turbolinks

//= require nprogress
//= require nprogress-turbolinks

//= require Slidebars/slidebars.min
//= require touchSwipe/jquery.touchSwipe.min
//= require bootstrap
//= require materialize-sprockets


NProgress.configure
  showSpinner: false
  ease: "ease"
  speed: 500

switchAnim = (x) ->
  $("#info").removeClass().addClass(x + " animated").one "webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend", ->
    $(this).removeClass()
    return

initialize = () ->
  $("#menuToggle, .menu-close").on "click", ->
    $("#menuToggle").toggleClass "active"
    $("body").toggleClass "body-push-toleft"
    $("#theMenu").toggleClass "menu-open"
    return

  $("#info").click (e) ->
    e.preventDefault()
    switchAnim 'bounceIn'
    return

  $("html#index #wrapper").swipe
    swipe: (event, direction, distance, duration, fingerCount, fingerData) ->
      switch direction
        when 'left'
          $('.next a')[0].click()
        when 'right'
          $('.previous a')[0].click() if $('.previous a').length > 0
      return
    threshold: 0

  $('.sb-toggle-right').click ->
    mySlidebars = new $.slidebars()
    mySlidebars.slidebars.open('right')


  detect_device = ->
    userAgent = navigator.userAgent
    if /Android/i.test(userAgent)
      $('#nav_tab a:last').tab('show')
    else if /iPhone|iPad/i.test(userAgent)
      $('#nav_tab a:first').tab('show')

  detect_device() if location.pathname is '/doc'

  $.simpleWeather
    location: 'Taoyuan, Taiwan'
    woeid: ''
    unit: 'c'
    success: (weather) ->
      $('#add-ons .weather i').addClass("icon-#{weather.code}")
      $('#add-ons .weather').attr('data-tooltip', "桃園: #{weather.temp}℃ (#{weather.high}-#{weather.low})")
      $('.tooltipped').tooltip({delay: 50})

      return
    error: (error) ->
      return
  true

$(document).on('page:load', initialize)
$(document).ready(initialize)


console.log "江威龍是帥哥唷!! FB: http://fb.com/weilung.chiangwen"
