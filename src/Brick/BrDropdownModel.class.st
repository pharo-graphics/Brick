Class {
	#name : #BrDropdownModel,
	#superclass : #BrAnchoredModel,
	#category : #'Brick-Dropdown - Model'
}

{ #category : #notifying }
BrDropdownModel >> contentChangedEvent [
	^ BrDropdownContentChanged new
]

{ #category : #'as yet unclassified' }
BrDropdownModel >> contentRequestClass [
	^ BrDropdownContentRequest
]

{ #category : #notifying }
BrDropdownModel >> handleChangedEvent [
	^ BrDropdownHandleChanged new
]

{ #category : #'as yet unclassified' }
BrDropdownModel >> handleRequestClass [
	^ BrDropdownHandleRequest
]
