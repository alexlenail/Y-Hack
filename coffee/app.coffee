window.displayed = {}


$(document).ready -> 
	
	chrome.history.search({}, (history) ->    # results is an array of HistoryItems, See below

		chrome.tabs.query({}, (tabs) ->

			for tab in tabs when history.indexOf(tab.id) isnt -1

				link = history."#{tab.id}"
				window.display(link)
				window.displayed."#{link.id}" = true

				chrome.history.getVisits({'url': link.url}, (visits) ->   # item is a VisitItem. See below. 

					for visit in visits when visit.visitId is link.id

						window.display(history."#{visit.referringVisitId}", link.id)
						window.displayed."#{visit.referringVisitId}" = true

				)

		)

	)






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
