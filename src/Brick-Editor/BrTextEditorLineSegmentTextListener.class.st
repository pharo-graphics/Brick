"
I add support of BrTextEventHandlerAttribute - special kind of attribute that can handle events
"
Class {
	#name : #BrTextEditorLineSegmentTextListener,
	#superclass : #BlBasicEventHandler,
	#instVars : [
		'editorElement'
	],
	#category : #'Brick-Editor-Model - Segment-Text-Line'
}

{ #category : #accessing }
BrTextEditorLineSegmentTextListener >> editorElement [
	^ editorElement
]

{ #category : #accessing }
BrTextEditorLineSegmentTextListener >> editorElement: anEditorElement [
	editorElement := anEditorElement
]

{ #category : #events }
BrTextEditorLineSegmentTextListener >> handleEvent: aBlMouseEvent [
	| aTextElement aLocalPosition aTextIndex anIterator theAttributes |

	aTextElement := aBlMouseEvent currentTarget.
	"If text element has no paragraph we can not find text index for mouse event"
	aTextElement paragraph
		ifNil: [ ^ self ].
	
	aLocalPosition := aTextElement globalPointToLocal: aBlMouseEvent position.

	aTextIndex := aTextElement paragraph indexAtPosition: aLocalPosition.

	anIterator := aTextElement text iterator: (aTextIndex max: 1) to: (aTextIndex max: 1).
	theAttributes := anIterator selectAttributes: [ :anAttribute | anAttribute isKindOf: BrTextEventHandlerAttribute ].

	theAttributes do: [ :anAttribute |
		(anAttribute wantsEvent: aBlMouseEvent in: self editorElement)
			ifTrue: [ anAttribute handleEvent: aBlMouseEvent in: self editorElement ] ]
]

{ #category : #events }
BrTextEditorLineSegmentTextListener >> wantsEvent: anEvent [

	^ (anEvent isKindOf: BlMouseEvent)
		and: [anEvent currentTarget isAttachedToSceneGraph
			and: [ anEvent currentTarget text isNotEmpty ] ]
]
