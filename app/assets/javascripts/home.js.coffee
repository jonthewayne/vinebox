# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/


grabVines = ->
	callback = (data) ->
		processVines(data)
	$.getJSON '/markup/vinetest.json', callback

processVines = (data)->
	tweet_vine_url = data.results[0]['entities']['urls'][0]['display_url']
	vine_id = tweet_vine_url.replace "vine.co/v/", ""
	proxy_url = $('#player').data('url') + vine_id 
	#console.log proxy_url
	#$('body').append "Successfully got the page."
	#console.log data.results[0]
	data = 
		vinedata: data.results[0]
	console.log data
	$.ajax proxy_url,
		type: 'POST'
		dataType: 'json'
		data: data
		error: (jqXHR, textStatus, errorThrown) ->
			console.log jqXHR
		success: (data, textStatus, jqXHR) ->
			console.log data

$ -> 
	$("#test_link").click (e) ->
		e.preventDefault()
		grabVines()