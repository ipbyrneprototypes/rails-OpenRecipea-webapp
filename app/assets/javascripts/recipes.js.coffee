# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $('#recipesmasonryindex').imagesLoaded ->
    $('#recipesmasonryindex').masonry
      itemSelector: '.box'
      isFitWidth: true

$ ->
  $('#recipesmasonry').imagesLoaded ->
    $('#recipesmasonry').masonry
      itemSelector: '.box'
      isFitWidth: true

$ ->
  $('#recipesmasonry2').imagesLoaded ->
    $('#recipesmasonry2').masonry
      itemSelector: '.box'
      isFitWidth: true