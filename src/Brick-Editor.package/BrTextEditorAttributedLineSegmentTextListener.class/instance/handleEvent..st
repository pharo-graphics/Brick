events
handleEvent: aBlMouseEvent
	| aTextElement aLocalPosition aTextIndex anIterator theAttributes |
	
	true ifTrue: [ ^ self ].
	aTextElement := aBlMouseEvent currentTarget.
	aLocalPosition := aTextElement globalPointToLocal: aBlMouseEvent position.

	aTextIndex := aTextElement paragraph indexAtPosition: aLocalPosition.

	anIterator := aTextElement text iterator: (aTextIndex max: 1) to: (aTextIndex max: 1).
	theAttributes := anIterator selectAttributes: [ :anAttribute | anAttribute isKindOf: BrTextEventHandlerAttribute ].

	theAttributes do: [ :anAttribute |
		(anAttribute wantsEvent: aBlMouseEvent)
			ifTrue: [ anAttribute handleEvent: aBlMouseEvent ] ]