Class {
	#name : #BrTextEditorSelectionHandler,
	#superclass : #BlEventListener,
	#instVars : [
		'startIndex'
	],
	#category : #'Brick-Editor-UI - Handlers'
}

{ #category : #'dnd handlers' }
BrTextEditorSelectionHandler >> dragEvent: anEvent [
	| anEditor currentIndex |
	super dragEvent: anEvent.
	
	anEvent consumed: true.

	anEditor := anEvent currentTarget editor.

	currentIndex := anEditor navigator
		findTextIndexAtScreenPosition: anEvent localPosition
		ifAbsent: [ ^ self ].
		
	self
		assert: [ currentIndex between: 0 and: anEditor text size ]
		description: [ 'Text index ({1}) must be within text bounds {2}'
			format: { currentIndex . 0 to: anEditor text size } ].
	
	startIndex ifNil: [ startIndex := currentIndex ].
	
	anEditor selecter
		overwrite;
		from: (startIndex min: currentIndex)
			to: (startIndex max: currentIndex);
		select
]

{ #category : #'dnd handlers' }
BrTextEditorSelectionHandler >> dragStartEvent: anEvent [
	| anEditor |
	super dragStartEvent: anEvent.
	
	anEvent consumed: true.

	anEditor := anEvent currentTarget editor.
	anEditor deselecter all deselect.
	
	startIndex := anEditor navigator
		findTextIndexAtScreenPosition: anEvent localPosition
		ifAbsent: [ nil ].
]
