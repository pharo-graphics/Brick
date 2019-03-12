Class {
	#name : #BrTree,
	#superclass : #BlElement,
	#traits : 'TBrLayoutResizable + TBrSelectable',
	#classTraits : 'TBrLayoutResizable classTrait + TBrSelectable classTrait',
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

	self initializeEventHandlers
]

{ #category : #initialization }
BrTree >> initializeEventHandlers [
	"shortcuts only work when tree has focus.
	click handler must not be added as a filter"
	self
		when: BlClickEvent do: [ :anEvent | anEvent currentTarget requestFocus ];
		addShortcut: (BlShortcut new
			combination: (BlKeyCombination arrowDown);
			action: [ self selectNext ] );
		addShortcut: (BlShortcut new
			combination: (BlKeyCombination arrowUp);
			action: [ self selectPrevious ] );
		addShortcut: (BlShortcut new
			combination: (BlKeyCombination return);
			action: [ self toggleSelected ] )
]

{ #category : #accessing }
BrTree >> items: aCollectionOfItems children: aBlockOrValuable [
	"Set the root itemss and a computation block applied on each child recursively"

	self viewModel items: aCollectionOfItems children: aBlockOrValuable
]

{ #category : #'api - selection' }
BrTree >> maxSelectionIndex [
	<return: #Number>

	^ self viewModel root size
]

{ #category : #'api - selection' }
BrTree >> toggleSelected [
	selectionModel selection isEmpty
		ifTrue: [ ^ self ].
	
	(self selection from between: 1 and: self viewModel itemCount)
		ifFalse: [ ^ self ].
	
	(self viewModel itemAt: self selection from) toggle
]
