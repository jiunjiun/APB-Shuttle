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

//= require link/modernizr.custom
//= require link/bootstrap.min

//= require nprogress
//= require nprogress-turbolinks


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

$(document).ready(initialize)
$(document).on('page:load', initialize)