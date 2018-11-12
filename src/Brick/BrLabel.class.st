Class {
	#name : #BrLabel,
	#superclass : #BlElement,
	#traits : 'TBrLayoutResizable',
	#classTraits : 'TBrLayoutResizable classTrait',
	#category : #'Brick-Label - UI'
}

{ #category : #initialization }
BrLabel >> initialize [
	super initialize.

	self viewModel: (BrLabelModel new add: (BrInteractiveModel withAll: {
		BrLayoutHorizontalResizerModel fitContent.
		BrLayoutVerticalResizerModel fitContent
	}))
]

{ #category : #accessing }
BrLabel >> text [
	<return: #BlText>

	^ self viewModel text
]

{ #category : #accessing }
BrLabel >> text: aTextOrString [
	self viewModel text: aTextOrString
]
