Class {
	#name : #BrTextEditorOperator,
	#superclass : #Object,
	#instVars : [
		'editor',
		'subscriptions'
	],
	#category : #'Brick-Editor-Model - Operators'
}

{ #category : #accessing }
BrTextEditorOperator >> cursor [
	^ self cursors
]

{ #category : #accessing }
BrTextEditorOperator >> cursors [
	^ self editor cursors
]

{ #category : #accessing }
BrTextEditorOperator >> editor [
	^ editor
]

{ #category : #accessing }
BrTextEditorOperator >> editor: aBrTextEditor [
	editor := aBrTextEditor
]

{ #category : #private }
BrTextEditorOperator >> findLineEndAfter: aTextIndex [
	<return: #Number>
	| aText aTextIterator foundLineBreak |

	aText := self text.
	aTextIterator := aText iterator: aTextIndex to: aText size.

	"if we have a line break after cursor - do nothing"
	(aTextIterator hasNext and: [ aTextIterator peek isLineBreak ])
		ifTrue: [ ^ aTextIndex ].

	foundLineBreak := false.
	[ aTextIterator hasNext and: [ (foundLineBreak := aTextIterator next isLineBreak) not ] ] whileTrue.

	^ aTextIterator position - foundLineBreak asBit
]

{ #category : #private }
BrTextEditorOperator >> findLineStartBefore: aTextIndex [
	<return: #Number>
	| aText aTextIterator foundLineBreak |

	aText := self text.
	aTextIterator := aText iterator: (1 min: aText size) to: aTextIndex.
	aTextIterator skip: ((aTextIndex - 1) max: 0).

	"if we have a line break before aTextIndex"
	(aTextIterator hasPrevious and: [ aTextIterator peer isLineBreak ])
		ifTrue: [ ^ aTextIndex - 1 ].

	foundLineBreak := false.
	[ aTextIterator hasPrevious and: [ (foundLineBreak := aTextIterator previous isLineBreak) not ] ] whileTrue.

	^ aTextIterator position + foundLineBreak asBit
]

{ #category : #private }
BrTextEditorOperator >> findLineStartsBetween: aTextStart and: aTextEnd [
	<return: #Number>
	| aText aTextIterator |

	aText := self text.
	aTextIterator := aText iterator: aTextStart to: aTextEnd.
	
	^ Array streamContents: [ :aStream |
		[ aTextIterator hasNext ] whileTrue: [
			aTextIterator next isLineBreak
				ifTrue: [ aStream nextPut: aTextIterator position ] ] ]
]

{ #category : #'api - utility' }
BrTextEditorOperator >> findTextIndexAboveCursor: aCursor ifAbsent: anExceptionBlock [
	"Find a text index one line above the given cursor"
	<return: #Number>
	| aTransformation aGlobalTextIndex |
	
	aGlobalTextIndex := nil.

	aTransformation := BrTextEditorRelativeScreenToCursorTransformation new
		cursor: aCursor;
		beUp;
		whenTransformed: [ :aTextIndex | aGlobalTextIndex := aTextIndex ].
	
	self editor enqueueCommand: (BrTextEditorScreenToCursorCommand new transformation: aTransformation).
	
	aGlobalTextIndex
		ifNotNil: [ ^ aGlobalTextIndex ]
		ifNil: [ self flag: 'Until I figure out why it can be nil'. ^ anExceptionBlock value ].
	
	"could not find a text index for a given screen position"
	self
		assert: [ aGlobalTextIndex isNotNil ]
		description: [ 'There must always be some text index found' ].
		
	^ aGlobalTextIndex
]

{ #category : #'api - utility' }
BrTextEditorOperator >> findTextIndexAtScreenPosition: aScreenPosition [
	"Convert screen position to a text index"
	<return: #Number>
	| aTransformation aGlobalTextIndex |
	
	aGlobalTextIndex := nil.

	aTransformation := BrTextEditorExplicitScreenToCursorTransformation new screenPosition: aScreenPosition.
	aTransformation whenTransformed: [ :aTextIndex | aGlobalTextIndex := aTextIndex ].
	
	self editor enqueueCommand: (BrTextEditorScreenToCursorCommand new transformation: aTransformation).
	
	"could not find a text index for a given screen position"
	self
		assert: [ aGlobalTextIndex isNotNil ]
		description: [ 'There must always be some text index found' ].
		
	^ aGlobalTextIndex
]

{ #category : #'api - utility' }
BrTextEditorOperator >> findTextIndexAtScreenPosition: aScreenPosition ifAbsent: anExceptionBlock [
	"Convert screen position to a text index"
	<return: #Number>
	| aTransformation aGlobalTextIndex |
	
	aGlobalTextIndex := nil.

	aTransformation := BrTextEditorExplicitScreenToCursorTransformation new screenPosition: aScreenPosition.
	aTransformation whenTransformed: [ :aTextIndex | aGlobalTextIndex := aTextIndex ].
	
	self editor enqueueCommand: (BrTextEditorScreenToCursorCommand new transformation: aTransformation).
	
	aGlobalTextIndex
		ifNotNil: [ ^ aGlobalTextIndex ]
		ifNil: [ self flag: 'Until I figure out why it can be nil'. ^ anExceptionBlock value ].
	
	"could not find a text index for a given screen position"
	self
		assert: [ aGlobalTextIndex isNotNil ]
		description: [ 'There must always be some text index found' ].
		
	^ aGlobalTextIndex
]

{ #category : #'api - utility' }
BrTextEditorOperator >> findTextIndexBelowCursor: aCursor ifAbsent: anExceptionBlock [
	"Find a text index one line below the given cursor"
	<return: #Number>
	| aTransformation aGlobalTextIndex |
	
	aGlobalTextIndex := nil.

	aTransformation := BrTextEditorRelativeScreenToCursorTransformation new
		cursor: aCursor;
		beDown;
		whenTransformed: [ :aTextIndex | aGlobalTextIndex := aTextIndex ].
	
	self editor enqueueCommand: (BrTextEditorScreenToCursorCommand new transformation: aTransformation).
	
	aGlobalTextIndex
		ifNotNil: [ ^ aGlobalTextIndex ]
		ifNil: [ self flag: 'Until I figure out why it can be nil'. ^ anExceptionBlock value ].
	
	"could not find a text index for a given screen position"
	self
		assert: [ aGlobalTextIndex isNotNil ]
		description: [ 'There must always be some text index found' ].
		
	^ aGlobalTextIndex
]

{ #category : #initialization }
BrTextEditorOperator >> initialize [
	super initialize.

	subscriptions := OrderedCollection new
]

{ #category : #accessing }
BrTextEditorOperator >> selection [
	^ self editor selection
]

{ #category : #'api - event' }
BrTextEditorOperator >> subscribe: anEventHandler [
	self editor addEventHandler: anEventHandler.
	subscriptions add: anEventHandler.
	^ anEventHandler
]

{ #category : #accessing }
BrTextEditorOperator >> text [
	^ self editor text
]

{ #category : #'api - event' }
BrTextEditorOperator >> unsubscribe [
	subscriptions do: [ :anEventHandler | self editor removeEventHandler: anEventHandler ]
]

{ #category : #'api - event' }
BrTextEditorOperator >> when: anEventClass do: aBlock [
	^ self subscribe: (BlEventHandler on: anEventClass do: aBlock)
]
