Class {
	#name : #BrDropdownModel,
	#superclass : #BrWidgetModel,
	#instVars : [
		'toggleStencil',
		'popupStencil'
	],
	#category : #'Brick-Dropdown - Model'
}

{ #category : #'instance creation' }
BrDropdownModel class >> defaultPopupStencil [
	^ [ BlElement new size: 150@100; background: Color blue ] asStencil
]

{ #category : #'instance creation' }
BrDropdownModel class >> defaultToggleStencil [
	^ [ BlElement new size: 50@10; background: Color red ] asStencil
]

{ #category : #initialization }
BrDropdownModel >> initialize [
	super initialize.
	
	toggleStencil := self class defaultToggleStencil.
	popupStencil := self class defaultPopupStencil
]

{ #category : #initialization }
BrDropdownModel >> initializeListeners [
	super initializeListeners.
	
	self when: BrDropdownToggleStencilRequest reply: [ :aResponse | aResponse stencil: self toggleStencil ].
	self when: BrDropdownPopupStencilRequest reply: [ :aResponse | aResponse stencil: self popupStencil ]
]

{ #category : #notifying }
BrDropdownModel >> notifyPopupStencilChanged [
	self dispatchEvent: (BrDropdownPopupStencilChanged stencil: self popupStencil)
]

{ #category : #notifying }
BrDropdownModel >> notifyToggleStencilChanged [
	self dispatchEvent: (BrDropdownToggleStencilChanged stencil: self toggleStencil)
]

{ #category : #accessing }
BrDropdownModel >> popupStencil [
	<return: #BrStencil>

	^ popupStencil
]

{ #category : #accessing }
BrDropdownModel >> popupStencil: aBrStencil [

	self
		assert: [ aBrStencil isNotNil ]
		description: [ 'Stencil must not be nil' ].

	popupStencil := aBrStencil asStencil.
	self notifyPopupStencilChanged
]

{ #category : #accessing }
BrDropdownModel >> toggleStencil [
	<return: #BrStencil>

	^ toggleStencil
]

{ #category : #accessing }
BrDropdownModel >> toggleStencil: aBrStencil [

	self
		assert: [ aBrStencil isNotNil ]
		description: [ 'Stencil must not be nil' ].

	toggleStencil := aBrStencil asStencil.
	self notifyToggleStencilChanged
]
