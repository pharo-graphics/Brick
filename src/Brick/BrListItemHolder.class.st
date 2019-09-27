Class {
	#name : #BrListItemHolder,
	#superclass : #BlInfiniteHolder,
	#instVars : [
		'rowStencilBuilder',
		'listElement',
		'rowValue'
	],
	#category : 'Brick-List - Support'
}

{ #category : #initialization }
BrListItemHolder >> initialize [
	super initialize.
	
	"must be set by the data source"
	rowStencilBuilder := nil.
]

{ #category : #accessing }
BrListItemHolder >> listElement [
	^ listElement
]

{ #category : #accessing }
BrListItemHolder >> listElement: aListWidgetElement [
	self 
		assert: [ aListWidgetElement isNotNil ]
		description: [ 'List must not be nil' ].

	listElement := aListWidgetElement
]

{ #category : #accessing }
BrListItemHolder >> rowStencilBuilder [
	<return: #BrListRowStencilBuilder>

	^ rowStencilBuilder
]

{ #category : #accessing }
BrListItemHolder >> rowStencilBuilder: aBrListRowStencil [
	rowStencilBuilder := aBrListRowStencil
]

{ #category : #accessing }
BrListItemHolder >> rowValue [
	^ rowValue
]

{ #category : #'api - binding' }
BrListItemHolder >> rowValue: anObject at: aRowIndex [
	self subclassResponsibility
]
