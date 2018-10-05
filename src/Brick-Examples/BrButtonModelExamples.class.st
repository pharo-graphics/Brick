"
See ${class:BrButtonModel}$
"
Class {
	#name : #BrButtonModelExamples,
	#superclass : #Object,
	#category : #'Brick-Examples-Button'
}

{ #category : #'examples - model' }
BrButtonModelExamples >> buttonModel [
	<gtExample>

	^ BrButtonModel new
		action: [ :aButtonElement :aButtonModel |
			aButtonModel model: #clicked.
			self inform: 'clicked' ]
]

{ #category : #'examples - model' }
BrButtonModelExamples >> clickOnElementWithButtonModel [
	<gtExample>
	| anElement |

	anElement := self elementWithButtonModel.
	BlSpace simulateClickOn: anElement.

	self assert: anElement viewModel model equals: #clicked.

	^ anElement
]

{ #category : #'examples - model' }
BrButtonModelExamples >> elementWithButtonModel [
	<gtExample>

	^ BlElement new
		viewModel: self buttonModel;
		size: 60@30;
		background: Color veryLightGray
]
