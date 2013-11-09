


$(document).ready -> 
	
	chrome.history.search( text: "", (results) -> 

		for result in results
			# if it is currently displayed
				chrome.history.getVisits(object details, function callback)


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

###







	)
