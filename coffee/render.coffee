
$(document).ready -> window.paper = Snap("#overlay")


window.display = (HistoryItem, pointsTo) -> null

#	if window.displayed[HistoryItem.id] # then make sure I point to whatever pointsTo is

#	else null





###
	console.log "the id was #{id}"
	console.log "the HistoryItem id was #{HistoryItem.id}"
#	console.log "so render failed"
	console.log ""

###

window.BuildRectangle = (bottomTime, topTime, title, url) -> 

	window.paper.circle(150, 150, 100)



BuildLink = () -> 


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

