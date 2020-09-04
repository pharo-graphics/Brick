"
I am sent when a cursor related change happened at a given text position.

It can be that a cursor was removed from this position or added at it
"
Class {
	#name : #BrTextEditorCursorChangeCommand,
	#superclass : #BrTextEditorCommand,
	#instVars : [
		'position',
		'cursor'
	],
	#category : #'Brick-Editor-Commands'
}

{ #category : #accessing }
BrTextEditorCursorChangeCommand >> cursor [
	<return: #BrTextEditorSingleCursor>

	^ cursor
]

{ #category : #accessing }
BrTextEditorCursorChangeCommand >> cursor: anObject [
	cursor := anObject
]

{ #category : #executing }
BrTextEditorCursorChangeCommand >> executeOn: aTextEditor [
	
	self telemetry
		timeSync: [ 'Process attributes' ]
		during: [ self processAttributesOn: aTextEditor ].

	aTextEditor segmentCollector
		cachedSegmentAt: self position
		ifFound: [ :aSegment |
			self telemetry
				timeSync: [ 'Enqueue cursor changed holder command {1}' format: { aSegment index to: aSegment index } ]
				during: [
					aTextEditor
						enqueueHolderCommand: self newHolderCommand
						interval: (aSegment index to: aSegment index) ] ]
		ifNotFound: [  ].
]

{ #category : #'instance creation' }
BrTextEditorCursorChangeCommand >> newHolderCommand [
	^ BrTextEditorCursorChangedHolderCommand new context: self context
]

{ #category : #accessing }
BrTextEditorCursorChangeCommand >> position [
	^ position
]

{ #category : #accessing }
BrTextEditorCursorChangeCommand >> position: anObject [
	position := anObject
]

{ #category : #printing }
BrTextEditorCursorChangeCommand >> printOn: aStream [
	aStream
		nextPutAll: 'Cursor changed at ';
		print: self position
]

{ #category : #executing }
BrTextEditorCursorChangeCommand >> processAttributesOn: aTextEditor [
	| hasCursor anEvent theEventHandlingAttributes |
	self position >= aTextEditor text size
		ifTrue: [ ^ self ].
	theEventHandlingAttributes := (aTextEditor text
		attributesAt: self position)
		select: [ :eachAttribute | eachAttribute isEventHandler ].
	theEventHandlingAttributes ifEmpty: [ ^ self ].
	hasCursor := aTextEditor cursors
		anySatisfy: [ :eachCursor | eachCursor position = self position ].
	anEvent := hasCursor
		ifTrue: [ BrTextEditorCursorAddedEvent cursor: self cursor ]
		ifFalse: [ BrTextEditorCursorRemovedEvent cursor: self cursor ].
	theEventHandlingAttributes
		do: [ :eachAttribute | 
			(eachAttribute wantsEvent: anEvent in: aTextEditor)
				ifTrue: [ eachAttribute handleEvent: anEvent in: aTextEditor on: nil ] ]
]
