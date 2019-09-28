Class {
	#name : #BrList,
	#superclass : #BlElement,
	#traits : 'TBrLayoutResizable + TBrSelectable',
	#classTraits : 'TBrLayoutResizable classTrait + TBrSelectable classTrait',
	#category : #'Brick-List - UI'
}

{ #category : #'api - scripting' }
BrList >> display: aCollectionOfValues [
	self items: aCollectionOfValues value
]

{ #category : #initialization }
BrList >> initialize [
	super initialize.
	
	self viewModel: (BrListModel new
		add: (selectionModel := BrSelectionModel new);
		add: (BrInteractiveModel withAll: {
			BrLayoutHorizontalResizerModel matchParent.
			BrLayoutVerticalResizerModel matchParent })).

	self initializeEventHandlers
]

{ #category : #initialization }
BrList >> initializeEventHandlers [
	"shortcuts only work when list has focus.
	click handler must not be added as a filter"
	self
		when: BlClickEvent do: [ :anEvent | anEvent currentTarget requestFocus ];
		when: BrListItemElementAttached do: [ :anEvent |
			(self isSelectedAt: anEvent rowIndex)
				ifTrue: [ self dispatchEvent: (BrListSelectedItemAttached new
					itemElement: anEvent itemElement;
					rowIndex: anEvent rowIndex;
					rowValue: anEvent rowValue) ] ];
		when: BrListItemElementDetached do: [ :anEvent |
			(self isSelectedAt: anEvent rowIndex)
				ifTrue: [ self dispatchEvent: (BrListSelectedItemDetached new
					rowIndex: anEvent rowIndex;
					rowValue: anEvent rowValue) ] ];
		addShortcut: (BlShortcut new
			combination: (BlKeyCombination builder arrowDown build);
			action: [ self selectNext ] );
		addShortcut: (BlShortcut new
			combination: (BlKeyCombination builder arrowUp build);
			action: [ self selectPrevious ] )
]

{ #category : #'api - accessing' }
BrList >> items [
	^ self viewModel items
]

{ #category : #'api - accessing' }
BrList >> items: aCollectionOfValues [
	self viewModel items: aCollectionOfValues
]

{ #category : #'api - selection' }
BrList >> maxSelectionIndex [
	<return: #Number>
	
	^ self items size
]
