Class {
	#name : #BrSimpleListItemHolder,
	#superclass : #BrListItemHolder,
	#instVars : [
		'rowValue'
	],
	#category : #'Brick-List - Support'
}

{ #category : #accessing }
BrSimpleListItemHolder >> rowValue [
	^ rowValue
]

{ #category : #accessing }
BrSimpleListItemHolder >> rowValue: anObject [
	rowValue := anObject
]

{ #category : #'api - binding' }
BrSimpleListItemHolder >> rowValue: anObject at: aRowIndex [
	"| aStencil |
	
	rowValue := anObject.
	
	aStencil := self rowStencilBuilder
		rowValue: anObject;
		rowIndex: aRowIndex;
		listElement: self listElement;
		build.

	itemElement := aStencil asElement.
	itemElement beInSeparateCompositionLayer"
]
