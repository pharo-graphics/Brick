Class {
	#name : #BrColumnedList,
	#superclass : #BlElement,
	#instVars : [
		'selectionModel'
	],
	#category : 'Brick-List - UI'
}

{ #category : #'api - scripting' }
BrColumnedList >> column [
	<return: #BlListColumn>

	^ self viewModel column
]

{ #category : #'api - selection' }
BrColumnedList >> deselectAll [
	"Deselect all items"

	selectionModel deselectAll
]

{ #category : #'api - scripting' }
BrColumnedList >> display: aCollectionOfValues [
	self viewModel items: aCollectionOfValues value
]

{ #category : #initialization }
BrColumnedList >> initialize [
	super initialize.

	self viewModel: (BrColumnedListModel new add: (selectionModel := BrSelectionModel new)).
	self look: BrColumnedListLook new + BrLayoutLook frame matchParent.
	self rowStencil: BrListClickableRowStencilBuilder new.
	
	"shortcuts only work when list has focus.
	we add an event filter on the click event to give list focus whenever users click somewhere inside"
	self
		addEventFilterOn: BlClickEvent do: [ :anEvent | anEvent currentTarget requestFocus ];
		when: BrListItemElementAttached do: [ :anEvent |
			(selectionModel contains: anEvent rowIndex)
				ifTrue: [ self dispatchEvent: (BrListSelectedItemAttached new
					itemElement: anEvent itemElement;
					rowIndex: anEvent rowIndex;
					rowValue: anEvent rowValue) ] ];
		when: BrListItemElementDetached do: [ :anEvent |
			(selectionModel contains: anEvent rowIndex)
				ifTrue: [ self dispatchEvent: (BrListSelectedItemDetached new
					rowIndex: anEvent rowIndex;
					rowValue: anEvent rowValue) ] ];
		addShortcut: (BlShortcut new
			combination: (BlKeyCombination builder key: Key arrowDown; build);
			action: [ self selectNext ] );
		addShortcut: (BlShortcut new
			combination: (BlKeyCombination builder key: Key arrowUp; build);
			action: [ self selectPrevious ] )
]

{ #category : #'api - scripting' }
BrColumnedList >> rowStencil: aRowStencil [
	self look rowStencilBuilder: aRowStencil
]

{ #category : #'api - selection' }
BrColumnedList >> selectNext [
	selectionModel selection isEmpty
		ifTrue: [ self selectOne: 1  ]
		ifFalse: [ self selectOne: ((selectionModel selection to + 1) min: self viewModel items size) ]
]

{ #category : #'api - selection' }
BrColumnedList >> selectOne: anIndex [
	selectionModel selectOne: anIndex
]

{ #category : #'api - selection' }
BrColumnedList >> selectOne: anIndex dueTo: aSourceEvent [
	selectionModel selectOne: anIndex dueTo: aSourceEvent
]

{ #category : #'api - selection' }
BrColumnedList >> selectPrevious [
	selectionModel selection isEmpty
		ifTrue: [ self selectOne: 1  ]
		ifFalse: [ self selectOne: ((selectionModel selection to - 1) max: 1) ]
]

{ #category : #'api - selection' }
BrColumnedList >> selection [
	<return: #BlSelection>

	^ selectionModel selection
]
