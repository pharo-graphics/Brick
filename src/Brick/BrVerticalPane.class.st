"
I arrange my children in one vertical column, one by one
"
Class {
	#name : #BrVerticalPane,
	#superclass : #BlElement,
	#traits : 'TBrLayoutAlignable + TBrLayoutResizable',
	#classTraits : 'TBrLayoutAlignable classTrait + TBrLayoutResizable classTrait',
	#category : #'Brick-Layout Widgets'
}

{ #category : #initialization }
BrVerticalPane >> initialize [
	super initialize.
	
	self viewModel: (BrInteractiveModel new addStates: {
		BrLayoutAlignmentModel new.
		BrLayoutHorizontalResizerModel exact: 50.
		BrLayoutVerticalResizerModel exact: 50.
	}).

	self look: BrLayoutResizerLook inherit + BrLayoutAlignmentLook forVerticalLinearLayout
]
