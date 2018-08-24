"
I am a special selection handler designed for multi-line text editor in order to take text nature into account.

I select element on on the whole line between origin and corner of selection area
"
Class {
	#name : #BrTextEditorSelectionHandler,
	#superclass : #BlSelectionHandler,
	#category : 'Brick-Editor-UI-Handlers'
}

{ #category : #'private - bounds' }
BrTextEditorSelectionHandler >> bottom: aBoundsInLocal in: aSelectionBounds ifNone: aNoneBlock [
	"Assuming that user selects in *BOTTOM direction* return intersection of selection bounds
	and provided local element bounds.
	Note: Both are given in the same coordinate system!"
	<return: #BlBounds>
	
	"to the right from the origin"
	(aBoundsInLocal top <= aSelectionBounds top and: [ aBoundsInLocal bottom <= aSelectionBounds bottom ])
		ifTrue: [
			^ aBoundsInLocal
				intersect: (BlBounds origin: aSelectionBounds origin corner: aBoundsInLocal corner) encompass
				ifNone: aNoneBlock ].
			
	"to the left from the corner"
	(aBoundsInLocal top >= aSelectionBounds top and: [ aBoundsInLocal bottom >= aSelectionBounds bottom ])
		ifTrue: [	
			^ aBoundsInLocal
				intersect: (BlBounds origin: 0@0 corner: aSelectionBounds corner) encompass
				ifNone: aNoneBlock ].

	"on the same line"
	^ aBoundsInLocal
		intersect: aSelectionBounds copy encompass
		ifNone: aNoneBlock
]

{ #category : #geometry }
BrTextEditorSelectionHandler >> computeSelectionArea [
	area origin: origin corner: corner
]

{ #category : #'dnd handlers' }
BrTextEditorSelectionHandler >> dragEndEvent: anEvent [
	super dragEndEvent: anEvent.

	anEvent currentTarget editor commitSelection.
	anEvent currentTarget requestFocus.
]

{ #category : #'dnd handlers' }
BrTextEditorSelectionHandler >> dragStartEvent: anEvent [
	super dragStartEvent: anEvent.
	
	anEvent currentTarget editor prepareSelection
]

{ #category : #selection }
BrTextEditorSelectionHandler >> intersect: aChildElement in: aSelectionBounds ifNone: aNoneBlock [
	"Return selection intersection bounds of a given element and provided
	selection bounds in local child cordinates if intersection exists
	or evaluate a none block otherwise"
	<return: #BlBounds>
	| boundsInLocal aSelection |
	
	aSelection := aSelectionBounds copy encompass.
	boundsInLocal := BlBounds fromRectangle: aChildElement boundsInLocal.
	
	"element is above selection"
	boundsInLocal bottom < aSelection top
		ifTrue: [ ^ aNoneBlock value ].

	"element is below selection"
	boundsInLocal top > aSelection bottom
		ifTrue: [ ^ aNoneBlock value ].

	(boundsInLocal right < aSelection left and: [ boundsInLocal top < aSelection top ])
		ifTrue: [ ^ aNoneBlock value ].
	
	(boundsInLocal left > aSelection right and: [ boundsInLocal bottom  > aSelection bottom ])
		ifTrue: [ ^ aNoneBlock value ].

	"select evertyhing in the middle"
	(boundsInLocal top > aSelection top and: [ boundsInLocal bottom < aSelection bottom ])
		ifTrue: [ ^ boundsInLocal ].

	"corner cases:"
	(aSelectionBounds origin y < aSelectionBounds corner y)
		ifTrue: [ ^ self bottom: boundsInLocal in: aSelectionBounds ifNone: aNoneBlock ].

	(aSelectionBounds origin y > aSelectionBounds corner y)
		ifTrue: [ ^ self top: boundsInLocal in: aSelectionBounds ifNone: aNoneBlock ].

	^ aSelection
		intersect: boundsInLocal
		ifNone: aNoneBlock
]

{ #category : #'private - bounds' }
BrTextEditorSelectionHandler >> top: aBoundsInLocal in: aSelectionBounds ifNone: aNoneBlock [
	"Assuming that user selects in *TOP direction* return intersection of selection bounds
	and provided local element bounds.
	Note: Both are given in the same coordinate system!"
	<return: #BlBounds>

	"to the right from the corner"
	(aBoundsInLocal top <= aSelectionBounds bottom and: [ aBoundsInLocal bottom <= aSelectionBounds top ])
		ifTrue: [	
			^ aBoundsInLocal
				intersect: (BlBounds origin: aSelectionBounds corner corner: aBoundsInLocal corner) encompass
				ifNone: aNoneBlock ].

	"to the left from the origin"
	(aBoundsInLocal top >= aSelectionBounds bottom and: [ aBoundsInLocal bottom >= aSelectionBounds top ])
		ifTrue: [
			^ aBoundsInLocal
				intersect: (BlBounds origin: 0@0 corner: aSelectionBounds origin) encompass
				ifNone: aNoneBlock ].	

	"on the same line"
	^ aBoundsInLocal
		intersect: aSelectionBounds copy encompass
		ifNone: aNoneBlock
]
