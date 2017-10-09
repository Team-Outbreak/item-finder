# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  searchBox = $('input[name="search"]')
  clearInputButton = $("i.clear-input")

  updateClearVisibility =  ->
    if(searchBox.val())
      clearInputButton.css("display", "block")
    else
      clearInputButton.css("display", "")

  searchBox.keyup updateClearVisibility

  clearInputButton.click (e) ->
    searchBox.val("")
    updateClearVisibility()
    searchBox.focus()

  updateClearVisibility()
