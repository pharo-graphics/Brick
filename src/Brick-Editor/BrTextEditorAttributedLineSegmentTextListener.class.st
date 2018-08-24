"
I add support of BrTextEventHandlerAttribute - special kind of attribute that can handle events
"
Class {
	#name : #BrTextEditorAttributedLineSegmentTextListener,
	#superclass : #BlBasicEventHandler,
	#category : 'Brick-Editor-Model - Segment-Text-Line-Attributed'
}

{ #category : #events }
BrTextEditorAttributedLineSegmentTextListener >> handleEvent: aBlMouseEvent [
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
		(anAttribute wantsEvent: aBlMouseEvent)
			ifTrue: [ anAttribute handleEvent: aBlMouseEvent ] ]
]

{ #category : #events }
BrTextEditorAttributedLineSegmentTextListener >> wantsEvent: anEvent [

	^ (anEvent isKindOf: BlMouseEvent)
		and: [anEvent currentTarget isAttachedToSceneGraph
			and: [ anEvent currentTarget text isNotEmpty ] ]
]
