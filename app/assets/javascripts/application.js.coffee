//= require jquery
//= require jquery_ujs
//= require knockout
//= require turbolinks
//= require jplayer.min
//= require jplayer.playlist.min
//= require_tree .

$(document).on 'ready page:load' , ->

  myPlaylist = new jPlayerPlaylist
    jPlayer: "#jquery_jplayer_1"
    cssSelectorAncestor: "#jp_container_1"
    []
    swfPath: "../dist/jplayer"
    supplied: "oga, mp3"
    wmode: "window"
    useStateClassSkin: true
    autoBlur: false
    smoothPlayBar: true
    keyEnabled: true

  window.openApiViewModel = ->
    self = this
    self.playlist = ko.observableArray []
    self.hasPlaylist = ko.observable false

    self.loadPlaylistToPlayer = ->
      mood = event.srcElement.dataset['mood']

      $.getJSON '/load_tracks', { mood: mood }, (data) ->
        self.hasPlaylist true
        self.createJPlayerPlaylist data

      return

    self.createJPlayerPlaylist = (playlist) ->
      myPlaylist.setPlaylist playlist

      return

    return

  ko.applyBindings new openApiViewModel()
