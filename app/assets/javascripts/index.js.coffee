# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

switchAnim = (x) ->
  $("#info").removeClass().addClass(x + " animated").one "webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend", ->
    $(this).removeClass()
    return
$ ->
  $(document).ready ->
    $("#info").click (e) ->
      e.preventDefault()
      switchAnim 'bounceIn'
      return
    return