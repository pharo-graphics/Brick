"
I arrange my children on top of each other based on they own alignment
"
Class {
	#name : #BrFrame,
	#superclass : #BlElement,
	#traits : 'TBrLayoutResizable',
	#classTraits : 'TBrLayoutResizable classTrait',
	#category : #'Brick-Layout Widgets'
}

{ #category : #initialization }
BrFrame >> initialize [
	super initialize.
	
	self viewModel: (BrInteractiveModel new addStates: {
		BrLayoutAlignmentModel new.
		BrLayoutHorizontalResizerModel exact: 50.
		BrLayoutVerticalResizerModel exact: 50.
	}).

	self look: BrLayoutResizerLook inherit + BrLayoutAlignmentLook forFrameLayout
]
