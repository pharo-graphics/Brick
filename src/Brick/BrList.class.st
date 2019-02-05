Class {
	#name : #BrList,
	#superclass : #BlElement,
	#instVars : [
		'selectionModel'
	],
	#category : #'Brick-List - UI'
}

{ #category : #initialization }
BrList >> defaultListModel [
	^ self subclassResponsibility
]

{ #category : #'api - selection' }
BrList >> deselectAll [
	"Deselect all items"

	selectionModel deselectAll
]

{ #category : #'api - scripting' }
BrList >> display: aCollectionOfValues [
	self items: aCollectionOfValues value
]

{ #category : #initialization }
BrList >> initialize [
	super initialize.
	
	self viewModel: (self defaultListModel add: (selectionModel := BrSelectionModel new)).
	self initializeEventHandlers
]

{ #category : #initialization }
BrList >> initializeEventHandlers [
	"shortcuts only work when list has focus.
	click handler must not be added as a filter"
	self
		when: BlClickEvent do: [ :anEvent | anEvent currentTarget requestFocus ];
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
BrList >> selectNext [
	selectionModel selection isEmpty
		ifTrue: [ self selectOne: 1  ]
		ifFalse: [ self selectOne: ((selectionModel selection to + 1) min: self viewModel items size) ]
]

{ #category : #'api - selection' }
BrList >> selectOne: anIndex [
	selectionModel selectOne: anIndex
]

{ #category : #'api - selection' }
BrList >> selectOne: anIndex dueTo: aSourceEvent [
	selectionModel selectOne: anIndex dueTo: aSourceEvent
]

{ #category : #'api - selection' }
BrList >> selectPrevious [
	selectionModel selection isEmpty
		ifTrue: [ self selectOne: 1  ]
		ifFalse: [ self selectOne: ((selectionModel selection to - 1) max: 1) ]
]

{ #category : #'api - selection' }
BrList >> selection [
	<return: #BlSelection>

	^ selectionModel selection
]
