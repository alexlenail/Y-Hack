all = {text: ""}
graph = {}
vectors = []
overlay = null

window.getOverlay = () -> return overlay

$(document).ready -> 
	$overlay = $("#overlay")
	overlay = Raphael($overlay.get(0))

	build = (graph) ->

		for id, vertex of graph when graph["#{vertex.parent}"]? and vertex.parent isnt '0'
			graph["#{vertex.parent}"].children.push(id)

		chrome.tabs.query({}, (tabs) -> 
			for tab in tabs
				current = {time: 0}
				for key, vertex of graph when vertex.url is tab.url
					if vertex.time > current["time"]
						current = vertex
						current.id = key
						current.title = tab.title

				CreateVector(current)
		)

	initialize = (history) ->
		graph = {}
		makeGraph = (visits, link) ->
			for visit in visits
				graph[visit.visitId] = {
					url: link.url
					title: link.title
					time: link.lastVisitTime
					parent: visit.referringVisitId
					children: []
				}

		visit = (history) ->
			async.map(history, ((link, callback) ->
				chrome.history.getVisits({'url': link.url}, (visits) ->
					makeGraph(visits, link)
					callback(null, true)
				)),
				(err, results) -> build graph
			)

		visit(history)
		

	chrome.history.search(all, (history) -> initialize history)


window.CreateVector = (vertex) -> 

	left = vectors.length * 211;
	
	if $(document).width() < left + 211 then $("header").width("#{left + 211}px") else $("header").width("100%")
	
	$vector = $("<div/>", class: 'vector', style:"left: "+left+"px; top:54px;")
	$("#overlay").append($vector)
	
	recurse = (vertex) -> 

		$vector.append(BuildDiv(vertex.time, vertex.title, vertex.url, vertex.id))
		$parent = $("##{vertex.id}")
		buildArrow($parent, $child = $("##{graph[child]}")) for child in vertex.children

		if graph[vertex.parent]? and vertex.parent isnt '0'
			recurse(graph[vertex.parent])
	
	recurse(vertex)

	vectors.push($vector)


window.BuildDiv = (bottomTime, title, url, id) -> 

	console.log "title:", title

	$div = $("<div/>", class: "fading link", id: id, text: title)
	$a = $("<a/>", href: url).append($div)
	

buildArrow = (from, to) -> 

	console.log "from", from
	console.log "to", to

	raph = window.getOverlay()

	raph.path("M#{from.position().left},#{from.position().top}L#{to.position().left},#{to.position().top}")

