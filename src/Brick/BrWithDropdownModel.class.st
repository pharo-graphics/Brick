Class {
	#name : #BrWithDropdownModel,
	#superclass : #BrWithAnchoredModel,
	#category : #'Brick-Dropdown - Model'
}

{ #category : #notifying }
BrWithDropdownModel >> stencilChangedEvent [
	^ BrDropdownStencilChanged new
]

{ #category : #notifying }
BrWithDropdownModel >> stencilRequestClass [
	^ BrDropdownStencilRequest
]

{ #category : #notifying }
BrWithDropdownModel >> visibleChangedEvent [
	^ BrDropdownVisibleChanged new
]

{ #category : #notifying }
BrWithDropdownModel >> visibleRequestClass [
	^ BrDropdownVisibleRequest
]
