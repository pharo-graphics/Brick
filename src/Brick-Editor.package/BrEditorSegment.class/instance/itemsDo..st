items - enumeration
itemsDo: aBlock

	items keysAndValuesDo: [ :aBuilder :theItems |
		theItems do: [ :anItem | aBlock cull: anItem cull: aBuilder ] ]