Class {
	#name : #BrTree,
	#superclass : #BlElement,
	#traits : 'TBrLayoutResizable',
	#classTraits : 'TBrLayoutResizable classTrait',
	#instVars : [
		'selectionModel'
	],
	#category : #'Brick-Tree - UI'
}

{ #category : #initialization }
BrTree >> defaultTreeModel [
	^ self subclassResponsibility
]

{ #category : #initialization }
BrTree >> initialize [
	super initialize.

	self viewModel: (self defaultTreeModel
		add: (selectionModel := BrSelectionModel new);
		add: (BrInteractiveModel withAll: {
			BrLayoutHorizontalResizerModel matchParent.
			BrLayoutVerticalResizerModel matchParent })).
]
