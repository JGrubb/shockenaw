# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ($) ->
  $('.dude .edit-button').on 'click', (e) ->
    $(this).next('.modal-edit').load '/items/new'
