Class {
	#name : #BrLabel,
	#superclass : #BlElement,
	#traits : 'TBrLayoutResizable + TBrLayoutAlignable + TBrSizeAdjustable',
	#classTraits : 'TBrLayoutResizable classTrait + TBrLayoutAlignable classTrait + TBrSizeAdjustable classTrait',
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
		BrLayoutAlignmentModel new centerLeft.
		BrSizeAdjustmentModel new.
		BrHoverModel new
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
