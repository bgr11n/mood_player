//= require jquery
//= require jquery_ujs
//= require knockout
//= require turbolinks
//= require jplayer.min
//= require jplayer.playlist.min
//= require_tree .

$(document).on 'ready page:load' , ->

  new jPlayerPlaylist
    jPlayer: "#jquery_jplayer_1",
    cssSelectorAncestor: "#jp_container_1",
    [{
      title: 'asd',
      mp3: 'asd'
    }],
    swfPath: "../dist/jplayer",
    supplied: "oga, mp3",
    wmode: "window",
    useStateClassSkin: true,
    autoBlur: false,
    smoothPlayBar: true,
    keyEnabled: true
