# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  voteClickEvent = (e) ->
    targetElement = $(this);

    # Return if association has already been voted for
    if (targetElement.hasClass("active") || targetElement.hasClass("inactive"))
      return

    itemId = Number(targetElement.data("item-id"))
    associationId = Number(targetElement.data("association-id"))

    if (targetElement.hasClass("up-vote"))
      oppositeButtonClass = "down-vote"
      apiMethod = "increase_ranking"
    else
      oppositeButtonClass = "up-vote"
      apiMethod = "decrease_ranking"

    $.ajax(
      url: "/items/" + itemId + "/associations/" + associationId + "/" + apiMethod,
      type: 'POST',
      beforeSend: $.rails.CSRFProtection
    )

    targetElement.addClass("active")
    targetElement.removeClass("inactive")

    oppositeButton = $('.' + oppositeButtonClass + '[data-association-id="' + associationId + '"]')
    oppositeButton.addClass("inactive")
    oppositeButton.removeClass("active")

  associationClickEvent = (e) ->
    targetElement = $(this);
    associationName = String(targetElement.data("association-name"))

    $.ajax(
      url: "/welcome/search_related_image",
      data: {
        association_name: associationName
      },
      type: 'POST',
      beforeSend: $.rails.CSRFProtection
    )

  voteButtons = $('.vote-column i')
  voteButtons.click voteClickEvent

  association = $('.association-result')
  association.click associationClickEvent
