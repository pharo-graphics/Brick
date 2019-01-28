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
