$ ->
  # Menu settings
  $("#menuToggle, .menu-close").on "click", ->
    $("#menuToggle").toggleClass "active"
    $("body").toggleClass "body-push-toleft"
    $("#theMenu").toggleClass "menu-open"
    return