Class {
	#name : #BrList,
	#superclass : #BlElement,
	#traits : 'TBrLayoutResizable + TBrSelectable + TBrScrollable',
	#classTraits : 'TBrLayoutResizable classTrait + TBrSelectable classTrait + TBrScrollable classTrait',
	#category : #'Brick-List - UI'
}

{ #category : #initialization }
BrList >> defaultListModel [
	^ BrAbstractListModel new
]

{ #category : #'api - scripting' }
BrList >> display: aCollectionOfValues [
	self
		deprecated: 'Please use items: method instead.'
		transformWith:
			'`@receiver display: `@statements1'
				-> '`@receiver items: `@statements1'.

	self items: aCollectionOfValues value
]

{ #category : #initialization }
BrList >> initialize [
	super initialize.
	
	self matchParent.
	
	self viewModel: (self defaultListModel
		add: (selectionModel := BrSelectionModel new)).

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
		addShortcut: (BlShortcutWithAction new
			combination: (BlKeyCombination builder arrowDown build);
			action: [ self selectNext ] );
		addShortcut: (BlShortcutWithAction new
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

{ #category : #'api - scrolling' }
BrList >> scrollToItem: anObject [
	"Request a scrollable widget to scroll to a given item"

	self viewModel items withIndexDo: [ :anItem :anIndex | 
		anObject = anItem 
			ifTrue: [ self scrollToIndex: anIndex ] ]
]
