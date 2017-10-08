# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $("a[data-remote]").filter(".like, .liked").on "ajax:success", (e, data, status, xhr) ->
    a = e.currentTarget
    $(a).toggleClass( "like" )
    $(a).toggleClass( "liked" )
    $(a).toggleClass( "btn-default" )
    $(a).toggleClass( "btn-success" )
    $('span#likeCount').fadeOut( "slow")
    # TODO: increase/decrease like count
    # ...