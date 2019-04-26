Class {
	#name : #BrColumnedModel,
	#superclass : #BrWidgetModel,
	#instVars : [
		'columns'
	],
	#category : #'Brick-Column - Model'
}

{ #category : #'private - adding' }
BrColumnedModel >> addColumn: aBrColumn [
	self columns add: aBrColumn.

	self dispatchEvent: (BrColumnsChanged new columns: self columns)
]

{ #category : #'api - adding' }
BrColumnedModel >> column [
	"Create and add a new column to the list, return newly created column for further configuration.
	
	Example:
	
	model column
		title: 'Key';
		stencil: #key.
	model column
		title: 'Value';
		stencil: #value.
	
	"
	<return: #BrColumn>
	| aColumn |
	
	aColumn := self newColumn.
	self addColumn: aColumn.
	^ aColumn
]

{ #category : #'api - accessing' }
BrColumnedModel >> columns [
	<return: #Collection of: #BrColumn>

	^ columns
]

{ #category : #'gt-inspector-extension' }
BrColumnedModel >> gtInspectorColumnsIn: aComposite [
	<gtInspectorPresentationOrder: 2>

	^ aComposite fastTable
		title: 'Columns';
		display: [ self columns ];
		column: '' evaluated: [ '' ] width: 1;
		column: 'Title' evaluated: #title
]

{ #category : #initialization }
BrColumnedModel >> initialize [
	super initialize.

	columns := OrderedCollection new
]

{ #category : #initialization }
BrColumnedModel >> newColumn [
	<return: #BrColumn>
	
	^ BrColumn new
]

{ #category : #hooks }
BrColumnedModel >> onAttachedTo: anElement [
	super onAttachedTo: anElement.

	self when: BrColumnsRequest reply: [ :aResponse | aResponse columns: self columns ]
]
