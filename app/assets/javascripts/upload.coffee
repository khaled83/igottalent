# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
source_urls =
  vimeo: 'https://vimeo.com/152986821'
  youtube: 'https://www.youtube.com/watch?v=YykjpeuMNEk'
  internet: 'http://some-url'
  mycomputer: 'Browse for file on your hardrive'

$(document).ready ->
  $('#dropdownVideoSource ul li a').click (event), ->
    video_source = $(event.target).data('video-source')
    $('#video-url').attr('placeholder', source_urls[video_source] )