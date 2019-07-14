"
I add support of BrTextEventHandlerAttribute - special kind of attribute that can handle events
"
Class {
	#name : #BrTextEditorLineSegmentTextListener,
	#superclass : #BlBasicEventHandler,
	#classInstVars : [
		'uniqueInstance'
	],
	#category : #'Brick-Editor-Model - Segment-Text-Line'
}

{ #category : #cleanup }
BrTextEditorLineSegmentTextListener class >> cleanUp [
	super cleanUp.
	
	uniqueInstance := nil
]

{ #category : #accessing }
BrTextEditorLineSegmentTextListener class >> uniqueInstance [
	^ uniqueInstance ifNil: [ uniqueInstance := self new ]
]

{ #category : #events }
BrTextEditorLineSegmentTextListener >> handleEvent: aBlMouseEvent [
	| aTextElement anEditorElement aLocalPosition aTextIndex anIterator theAttributes |

	aTextElement := aBlMouseEvent currentTarget.
	"If text element has no paragraph we can not find text index for mouse event"
	aTextElement paragraph
		ifNil: [ ^ self ].

	"To not create an instance of me for each tiny text element"
	anEditorElement := aTextElement
		allParentsDetect: [ :anElement | anElement isKindOf: BrEditorElement ]
		ifFound: #yourself
		ifNone: [ ^ self ].
	
	aLocalPosition := aTextElement globalPointToLocal: aBlMouseEvent position.

	aTextIndex := aTextElement paragraph indexAtPosition: aLocalPosition.

	anIterator := aTextElement text iterator: (aTextIndex max: 1) to: (aTextIndex max: 1).
	theAttributes := anIterator selectAttributes: [ :anAttribute | anAttribute isKindOf: BrTextEventHandlerAttribute ].

	theAttributes do: [ :anAttribute |
		(anAttribute wantsEvent: aBlMouseEvent in: anEditorElement editor)
			ifTrue: [ anAttribute handleEvent: aBlMouseEvent in: anEditorElement editor ] ]
]

{ #category : #events }
BrTextEditorLineSegmentTextListener >> wantsEvent: anEvent [

	^ (anEvent isKindOf: BlMouseEvent)
		and: [anEvent currentTarget isAttachedToSceneGraph
			and: [ anEvent currentTarget text isNotEmpty ] ]
]
