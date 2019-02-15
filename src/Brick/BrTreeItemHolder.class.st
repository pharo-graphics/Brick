Class {
	#name : #BrTreeItemHolder,
	#superclass : #BlInfiniteHolder,
	#instVars : [
		'rowStencilBuilder',
		'listElement',
		'rowValue'
	],
	#category : #'Brick-List - Support'
}

{ #category : #initialization }
BrTreeItemHolder >> initialize [
	super initialize.
	
	"must be set by the data source"
	rowStencilBuilder := nil.
]

{ #category : #accessing }
BrTreeItemHolder >> listElement [
	^ listElement
]

{ #category : #accessing }
BrTreeItemHolder >> listElement: aListWidgetElement [
	self 
		assert: [ aListWidgetElement isNotNil ]
		description: [ 'List must not be nil' ].

	listElement := aListWidgetElement
]

{ #category : #accessing }
BrTreeItemHolder >> rowStencilBuilder [
	<return: #BrListRowStencilBuilder>

	^ rowStencilBuilder
]

{ #category : #accessing }
BrTreeItemHolder >> rowStencilBuilder: aBrListRowStencil [
	rowStencilBuilder := aBrListRowStencil
]

{ #category : #accessing }
BrTreeItemHolder >> rowValue [
	^ rowValue
]

{ #category : #'api - binding' }
BrTreeItemHolder >> rowValue: anObject at: aRowIndex level: aLevelIndex [
	"aLevelIndex represents how deep in the tree a node is located"

	self subclassResponsibility
]
