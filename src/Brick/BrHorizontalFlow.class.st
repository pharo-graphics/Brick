"
I arrange my children horizontally in a flow layout
"
Class {
	#name : #BrHorizontalFlow,
	#superclass : #BlElement,
	#traits : 'TBrLayoutAlignable + TBrLayoutResizable',
	#classTraits : 'TBrLayoutAlignable classTrait + TBrLayoutResizable classTrait',
	#category : #'Brick-Layout Widgets'
}

{ #category : #initialization }
BrHorizontalFlow >> initialize [
	super initialize.
	
	self viewModel: (BrInteractiveModel new addStates: {
		BrLayoutAlignmentModel new.
		BrLayoutHorizontalResizerModel exact: 50.
		BrLayoutVerticalResizerModel exact: 50.
	}).

	self look: BrLayoutResizerLook inherit + BrLayoutAlignmentLook forHorizontalFlowLayout
]
