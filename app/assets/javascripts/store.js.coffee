# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ -> $('.store .entry > img').click -> $(this).parent().find(':submit').click()

$ -> $('.store .entry .btn').click -> $(this).parent().parent().parent().parent().find('img').animate_from_to('#current_item')

$ -> $('#my-carousel').carousel()
