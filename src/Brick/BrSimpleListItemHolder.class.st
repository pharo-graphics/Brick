Class {
	#name : #BrSimpleListItemHolder,
	#superclass : #BrListItemHolder,
	#category : 'Brick-List - Support'
}

{ #category : #'api - binding' }
BrSimpleListItemHolder >> rowValue: anObject at: aRowIndex [
	| aStencil |
	
	rowValue := anObject.
	
	aStencil := self rowStencilBuilder
		rowValue: anObject;
		rowIndex: aRowIndex;
		build.

	itemElement := aStencil asElement
]
