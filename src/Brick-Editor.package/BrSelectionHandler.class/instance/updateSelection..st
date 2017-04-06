selection
updateSelection: anElement
	| aBoundsInSpace aSelectionArea |
	
	aBoundsInSpace := anElement boundsInSpace.
	aSelectionArea := self selectionArea.
	
	"element is above selection"
	aBoundsInSpace bottom < aSelectionArea top
		ifTrue: [ ^ self ].

	"element is below selection"
	aBoundsInSpace top > aSelectionArea bottom
		ifTrue: [ ^ self ].
	
	(aBoundsInSpace right < aSelectionArea left and: [ aBoundsInSpace top < aSelectionArea top ])
		ifTrue: [ ^ self ].
	
	(aBoundsInSpace left > aSelectionArea right and: [ aBoundsInSpace bottom  > aSelectionArea bottom ])
		ifTrue: [ ^ self ].

	anElement
		dispatchEvent: (BrSelectionEvent new area: self selectionArea).

	anElement childrenDo: [ :each | self updateSelection: each ]