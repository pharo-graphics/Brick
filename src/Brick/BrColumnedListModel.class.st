"
I show the given elements within a columned list.
"
Class {
	#name : #BrColumnedListModel,
	#superclass : #BrWidgetModel,
	#instVars : [
		'columns',
		'items'
	],
	#category : 'Brick-List - Model'
}

{ #category : #'private - adding' }
BrColumnedListModel >> addColumn: aBrListColumn [
	self columns add: aBrListColumn
]

{ #category : #'api - adding' }
BrColumnedListModel >> column [
	"Create and add a new column to the list, return newly created column for further configuration.
	
	Example:
	
	list column
		title: 'Key';
		stencil: #key.
	list column
		title: 'Value';
		stencil: #value.
	
	"
	<return: #BrListColumn>
	| aListColumn |
	
	aListColumn := self newColumn.
	self addColumn: aListColumn.
	^ aListColumn
]

{ #category : #'api - accessing' }
BrColumnedListModel >> columns [
	<return: #Collection of: #BrListColumn>

	^ columns
]

{ #category : #'gt-inspector-extension' }
BrColumnedListModel >> gtInspectorItemsIn: aComposite [
	<gtInspectorPresentationOrder: 2>

	^ aComposite fastTable
		title: 'Columns';
		display: [ self columns ];
		column: '' evaluated: [ '' ] width: 1;
		column: 'Title' evaluated: #title
]

{ #category : #initialization }
BrColumnedListModel >> initialize [
	super initialize.
	
	columns := OrderedCollection new.
	items := #()
]

{ #category : #'api - accessing' }
BrColumnedListModel >> itemAt: anIndex [
	^ self items at: anIndex
]

{ #category : #'api - accessing' }
BrColumnedListModel >> items [
	<return: #Collection of: #Object>
	
	^ items
]

{ #category : #'api - accessing' }
BrColumnedListModel >> items: aCollectionOfBrWidgetModel [

	items := aCollectionOfBrWidgetModel.
	self dispatchEvent: (BrListItemsChangedEvent items: self items)
]

{ #category : #'instance creation' }
BrColumnedListModel >> newColumn [
	<return: #BrListColumn>
	
	^ BrListColumn new
]

{ #category : #hooks }
BrColumnedListModel >> onAttachedTo: anElement [
	super onAttachedTo: anElement.

	"answer if somebody is interested in what items I have"
	self when: BrListItemsRequest reply: [ BrListItemsChangedEvent items: self items ].
	self when: BrListColumnsRequest reply: [ BrListColumnsChangedEvent columns: self columns ]
]
