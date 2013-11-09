displayed = []


$(document).ready -> 
	
	chrome.history.search( text: "", (results) ->    # results is an array of HistoryItems, See below

		for result in results

			if visible(result.id) or isOpen(result)

				chrome.history.getVisits( 'url': result.url, (item) ->   # item is a VisitItem. See below. 
					
					display(result, item.id, item.referringVisitId) 	

				)	

	)


visible = (id) -> displayed.indexOf(id) isnt -1
isOpen = (id) -> true # fix this

display = (HistoryItem, id, referrer) -> 

	unless HistoryItem.id is id

		$("<div/>", class: 'link', id: id)





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
