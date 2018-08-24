Class {
	#name : #BrSimpleList,
	#superclass : #BlElement,
	#instVars : [
		'selectionModel'
	],
	#category : 'Brick-List - UI'
}

{ #category : #'api - selection' }
BrSimpleList >> deselectAll [
	"Deselect all items"

	selectionModel deselectAll
]

{ #category : #'api - scripting' }
BrSimpleList >> display: aCollectionOfValues [
	self viewModel items: aCollectionOfValues value
]

{ #category : #initialization }
BrSimpleList >> initialize [
	super initialize.

	self viewModel: (BrSimpleListModel new add: (selectionModel := BrSelectionModel new)).
	self look: BrSimpleListLook new + BrLayoutLook frame matchParent.
	
	"shortcuts only work when list has focus.
	we add an event filter on the click event to give list focus whenever users click somewhere inside"
	self
		addEventFilterOn: BlClickEvent do: [ :anEvent | anEvent currentTarget requestFocus ];
		addShortcut: (BlShortcut new
			combination: (BlKeyCombination builder key: Key arrowDown; build);
			action: [ self selectNext ] );
		addShortcut: (BlShortcut new
			combination: (BlKeyCombination builder key: Key arrowUp; build);
			action: [ self selectPrevious ] )
]

{ #category : #'api - accessing' }
BrSimpleList >> items [
	^ self viewModel items
]

{ #category : #'api - accessing' }
BrSimpleList >> items: aCollectionOfValues [
	self viewModel items: aCollectionOfValues
]

{ #category : #'api - selection' }
BrSimpleList >> selectNext [
	selectionModel selection isEmpty
		ifTrue: [ self selectOne: 1  ]
		ifFalse: [ self selectOne: ((selectionModel selection to + 1) min: self viewModel items size) ]
]

{ #category : #'api - selection' }
BrSimpleList >> selectOne: anIndex [
	selectionModel selectOne: anIndex
]

{ #category : #'api - selection' }
BrSimpleList >> selectOne: anIndex dueTo: aSourceEvent [
	selectionModel selectOne: anIndex dueTo: aSourceEvent
]

{ #category : #'api - selection' }
BrSimpleList >> selectPrevious [
	selectionModel selection isEmpty
		ifTrue: [ self selectOne: 1  ]
		ifFalse: [ self selectOne: ((selectionModel selection to - 1) max: 1) ]
]

{ #category : #'api - selection' }
BrSimpleList >> selection [
	<return: #BlSelection>

	^ selectionModel selection
]

{ #category : #'api - scripting' }
BrSimpleList >> shape: aBlock [ 
	self 
		deprecated: 'Use stencil: instead'
		on: 	'12 April 2018' 
		in: 'Pharo-6.0-60539-'.
	^ self stencil: aBlock
]

{ #category : #'api - scripting' }
BrSimpleList >> stencil: aListRowStencilBuilder [
	self look rowStencilBuilder: aListRowStencilBuilder
]
