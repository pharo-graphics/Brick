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
BrTree >> initialize [
	super initialize.

	self viewModel: (BrTreeModel new
		add: (selectionModel := BrSelectionModel new);
		add: (BrInteractiveModel withAll: {
			BrLayoutHorizontalResizerModel matchParent.
			BrLayoutVerticalResizerModel matchParent })).
]

{ #category : #accessing }
BrTree >> items: aCollectionOfItems children: aBlockOrValuable [
	"Set the root itemss and a computation block applied on each child recursively"

	self viewModel items: aCollectionOfItems children: aBlockOrValuable
]

{ #category : #'api - selection' }
BrTree >> selectOne: anIndex dueTo: aSourceEvent [
	selectionModel selectOne: anIndex dueTo: aSourceEvent
]
