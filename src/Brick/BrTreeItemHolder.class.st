Class {
	#name : #BrTreeItemHolder,
	#superclass : #BlInfiniteHolder,
	#instVars : [
		'rowStencilBuilder',
		'rowValue',
		'treeElement'
	],
	#category : #'Brick-Tree - Support'
}

{ #category : #initialization }
BrTreeItemHolder >> initialize [
	super initialize.
	
	"must be set by the data source"
	rowStencilBuilder := nil.
]

{ #category : #accessing }
BrTreeItemHolder >> rowStencilBuilder [
	<return: #BrTreeRowStencilBuilder>

	^ rowStencilBuilder
]

{ #category : #accessing }
BrTreeItemHolder >> rowStencilBuilder: aBrTreeRowStencilBuilder [
	rowStencilBuilder := aBrTreeRowStencilBuilder
]

{ #category : #accessing }
BrTreeItemHolder >> rowValue [
	^ rowValue
]

{ #category : #'api - binding' }
BrTreeItemHolder >> rowValue: aTreeNode at: aRowIndex [
	self subclassResponsibility
]

{ #category : #accessing }
BrTreeItemHolder >> treeElement [
	^ treeElement
]

{ #category : #accessing }
BrTreeItemHolder >> treeElement: aTreeWidgetElement [
	self 
		assert: [ aTreeWidgetElement isNotNil ]
		description: [ 'Tree must not be nil' ].

	treeElement := aTreeWidgetElement
]
