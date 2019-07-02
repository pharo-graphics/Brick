Class {
	#name : #BrLabel,
	#superclass : #BlElement,
	#traits : 'TBrLayoutResizable + TBrLayoutAlignable',
	#classTraits : 'TBrLayoutResizable classTrait + TBrLayoutAlignable classTrait',
	#category : #'Brick-Label - UI'
}

{ #category : #printing }
BrLabel >> gtDisplayString [ 

	^self text asString
]

{ #category : #initialization }
BrLabel >> initialize [
	super initialize.

	self viewModel: (BrLabelModel new add: (BrInteractiveModel withAll: {
		BrLayoutHorizontalResizerModel fitContent.
		BrLayoutVerticalResizerModel fitContent.
		BrLayoutAlignmentModel new centerLeft
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
