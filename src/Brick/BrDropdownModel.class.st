Class {
	#name : #BrDropdownModel,
	#superclass : #BrAnchoredModel,
	#category : #'Brick-Dropdown - Model'
}

{ #category : #'instance creation' }
BrDropdownModel class >> anchor: anElement [
	^ self new
		anchor: anElement;
		yourself
]

{ #category : #notifying }
BrDropdownModel >> anchorChangedEvent [
	^ BrDropdownAnchorChanged new
]

{ #category : #'as yet unclassified' }
BrDropdownModel >> anchorRequestClass [
	^ BrDropdownAnchorRequest
]

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
