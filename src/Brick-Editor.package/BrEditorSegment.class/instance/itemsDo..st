items - enumeration
itemsDo: aBlock

	items keysAndValuesDo: [ :aBuilder :theItems |
		theItems value do: [ :anItem | aBlock cull: anItem cull: aBuilder cull: theItems key ] ]