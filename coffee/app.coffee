window.displayed = []


$(document).ready -> 
	
	chrome.history.search({}, (results) ->    # results is an array of HistoryItems, See below

		chrome.tabs.query({}, (tabs) ->

			for tab in tabs

				index = results.indexOf(tab.id)
				result = results[index]
				if index is -1
					console.log "FAILURE"
				else
					window.display(result)
					window.displayed.push(result.id)

					chrome.history.getVisits( 'url': result.url, (visits) ->   # item is a VisitItem. See below. 

						for visit in visits

							if visit.id is 

								referrer = results[]

								window.display(result, item.id, item.referringVisitId) 	

					)

		)

	)



visible = (id) -> window.displayed.indexOf(id) isnt -1



###

	HistoryItem

	id ( string )
		The unique identifier for the item.
	url ( optional string )
		The URL navigated to by a user.
	title ( optional string )
		The title of the page when it was last loaded.
	lastVisitTime ( optional double )
		When this page was last loaded, represented in milliseconds since the epoch.
	visitCount ( optional integer )
		The number of times the user has navigated to this page.
	typedCount ( optional integer )
		The number of times the user has navigated to this page by typing in the address.

	VisitItem

	id ( string )
		The unique identifier for the item.
	visitId ( string )
		The unique identifier for this visit.
	visitTime ( optional double )
		When this visit occurred, represented in milliseconds since the epoch.
	referringVisitId ( string )
		The visit ID of the referrer.

###
