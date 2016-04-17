$ = require 'jquery'

console.log 'hello there!'

$ ->
	$('#button').click -> $(this).toggleClass 'hamburger-open'
