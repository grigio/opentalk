# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->

    $(".toggle_vote").live "ajax:success", (data, textStatus, jqXHR) ->
      $(this).hide()
      alert 'Voto registrato'

    $(".set_visible").live "ajax:success", (data, textStatus, jqXHR) ->
      $('.talk').removeClass('talk-hidden')

    $(".set_hidden").live "ajax:success", (data, textStatus, jqXHR) ->
      $('.talk').addClass('talk-hidden')

    $('.user-profile').popover( { delay: { show: 500, hide: 1500 } })

    #$('#talk-more').live "ajax:success", (data, textStatus, jqXHR) ->
    #  $(this).hide()