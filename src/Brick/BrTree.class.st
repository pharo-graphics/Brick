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

{ #category : #'api - tree' }
BrTree >> expandRoot [
	self viewModel expandRoot
]

{ #category : #initialization }
BrTree >> initialize [
	super initialize.

	self viewModel: (BrTreeModel new
		add: (selectionModel := BrSelectionModel new);
		add: (BrInteractiveModel withAll: {
			BrLayoutHorizontalResizerModel matchParent.
			BrLayoutVerticalResizerModel matchParent })).
]

{ #category : #accessing }
BrTree >> root: anObject computed: aComputationBlock [
	"Set the root object and a computation block applied on each child recursively"

	self viewModel root: anObject computed: aComputationBlock
]

{ #category : #'api - selection' }
BrTree >> selectOne: anIndex dueTo: aSourceEvent [
	selectionModel selectOne: anIndex dueTo: aSourceEvent
]
