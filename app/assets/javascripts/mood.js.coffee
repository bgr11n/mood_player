# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

($ document).on 'ready page:load', ->

  window.MoodViewModel = ->


    @getTracks = ->
      data = event.currentTarget
      mood = data.dataset.mood

      headers = {'x-api-auth': gon.api_key, 'Content-Type': 'application/json'}

      $.ajax
        url: '/load_tracks'
        type: 'GET'
        data: { 'mood': mood }
        complete: (response) =>
            console.log response

    return

  ko.applyBindings new MoodViewModel()
