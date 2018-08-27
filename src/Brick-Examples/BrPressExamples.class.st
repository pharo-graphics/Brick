Class {
	#name : #BrPressExamples,
	#superclass : #Object,
	#category : #'Brick-Examples-Press'
}

{ #category : #'examples - mouse events' }
BrPressExamples >> mouseDownOnPressableElement [
	<gtExample>
	| anElement aModel aPressEventHandler aPressCounter aPressStateFromEvent |

	anElement := self pressableElement.
	aModel := anElement viewModel.

	aPressCounter := 0.
	aPressStateFromEvent := nil.
	aPressEventHandler := BlEventHandler on: BrPressedChanged do: [ :anEvent |
		aPressCounter := aPressCounter + 1.
		aPressStateFromEvent := anEvent isPressed ].

	aModel addEventHandler: aPressEventHandler.

	aModel dispatchEvent: (BlMouseDownEvent primary position: anElement bounds center).

	aModel removeEventHandler: aPressEventHandler.

	self assert: aPressCounter equals: 1.
	self assert: aPressStateFromEvent.
	self assert: aModel isPressed.

	^ anElement
]

{ #category : #'examples - mouse events' }
BrPressExamples >> mouseUpOnPressableElement [
	<gtExample>
	| anElement aModel aPressEventHandler aPressCounter aPressStateFromEvent |

	anElement := self mouseDownOnPressableElement.
	aModel := anElement viewModel.

	aPressCounter := 0.
	aPressStateFromEvent := nil.
	aPressEventHandler := BlEventHandler on: BrPressedChanged do: [ :anEvent |
		aPressCounter := aPressCounter + 1.
		aPressStateFromEvent := anEvent isPressed ].

	aModel addEventHandler: aPressEventHandler.

	aModel dispatchEvent: (BlMouseUpEvent primary position: anElement bounds center).

	aModel removeEventHandler: aPressEventHandler.

	self assert: aPressCounter equals: 1.
	self assert: aPressStateFromEvent not.
	self assert: aModel isPressed not.

	^ anElement
]

{ #category : #'examples - instance creation' }
BrPressExamples >> pressModel [
	<gtExample>
	| aModel |
	
	aModel := BrPressModel new.
	self assert: aModel isPressed not.
	
	^ aModel
]

{ #category : #'examples - instance creation' }
BrPressExamples >> pressableElement [
	<gtExample>
	
	^ BlElement new
		size: 300@200;
		background: Color veryLightGray;
		border: (BlBorder paint: Color gray width: 10);
		viewModel: self pressModel;
		yourself
]

{ #category : #'examples - requests' }
BrPressExamples >> requestPressedState [
	<gtExample>
	| anElement aModel aResponse |
	
	anElement := self mouseDownOnPressableElement.
	aModel := anElement viewModel.
	
	aResponse := aModel request: BrPressedRequest new.
	self assert: aResponse pressed.
	self assert: aResponse isPressed.
	
	^ aModel
]

{ #category : #'examples - requests' }
BrPressExamples >> requestUnpressedState [
	<gtExample>
	| anElement aModel aResponse |
	
	anElement := self mouseUpOnPressableElement.
	aModel := anElement viewModel.
	
	aResponse := aModel request: BrPressedRequest new.
	self assert: aResponse pressed not.
	self assert: aResponse isPressed not.
	
	^ aModel
]
