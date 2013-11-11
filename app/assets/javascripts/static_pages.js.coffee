# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/



jQuery ->
  $("#toggle-panel-body").on 'click', (e)->
    $this = $(this)
    panel = $this.parent().parent().children(".panel-body")
    if panel.hasClass("hidden")
      panel.removeClass("hidden")
      $this.removeClass("glyphicon-chevron-down")
      $this.addClass("glyphicon-chevron-up")
    else
      panel.addClass("hidden")
      $this.removeClass("glyphicon-chevron-up")
      $this.addClass("glyphicon-chevron-down")


