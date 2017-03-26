event handling
handleCursorRightBoundReached: anEvent
	| aTextEditElement aTextEditIndex |

	aTextEditElement := anEvent target.
	aTextEditElement removeCursor: anEvent cursorElement.
	
	aTextEditIndex := aTextEditElement parent children indexOf: aTextEditElement.
	
	(aTextEditIndex + 1 to: aTextEditElement parent childrenCount)
		detect: [ :anElementIndex | (aTextEditElement parent children at: anElementIndex) hasFocusable ]
		ifFound: [ :anElementIndex |
			| aNextElement |
			aNextElement := aTextEditElement parent children at: anElementIndex.
			aNextElement dispatchEvent: (BlTextCursorEntersFromLeftBound new) ]