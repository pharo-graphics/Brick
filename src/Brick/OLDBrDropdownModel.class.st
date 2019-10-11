Class {
	#name : #OLDBrDropdownModel,
	#superclass : #BrWidgetModel,
	#instVars : [
		'toggleStencil',
		'popupStencil'
	],
	#category : #'Brick-Dropdown - Model'
}

{ #category : #'instance creation' }
OLDBrDropdownModel class >> defaultPopupStencil [
	^ [ BlElement new size: 150@100; background: Color blue ] asStencil
]

{ #category : #'instance creation' }
OLDBrDropdownModel class >> defaultToggleStencil [
	^ [ BlElement new size: 50@10; background: Color red ] asStencil
]

{ #category : #initialization }
OLDBrDropdownModel >> initialize [
	super initialize.
	
	toggleStencil := self class defaultToggleStencil.
	popupStencil := self class defaultPopupStencil
]

{ #category : #initialization }
OLDBrDropdownModel >> initializeListeners [
	super initializeListeners.
	
	self when: OLDBrDropdownToggleStencilRequest reply: [ :aResponse | aResponse stencil: self toggleStencil ].
	self when: OLDBrDropdownPopupStencilRequest reply: [ :aResponse | aResponse stencil: self popupStencil ]
]

{ #category : #notifying }
OLDBrDropdownModel >> notifyPopupStencilChanged [
	self dispatchEvent: (OLDBrDropdownPopupStencilChanged stencil: self popupStencil)
]

{ #category : #notifying }
OLDBrDropdownModel >> notifyToggleStencilChanged [
	self dispatchEvent: (OLDBrDropdownToggleStencilChanged stencil: self toggleStencil)
]

{ #category : #accessing }
OLDBrDropdownModel >> popupStencil [
	<return: #BrStencil>

	^ popupStencil
]

{ #category : #accessing }
OLDBrDropdownModel >> popupStencil: aBrStencil [

	self
		assert: [ aBrStencil isNotNil ]
		description: [ 'Stencil must not be nil' ].

	popupStencil := aBrStencil asStencil.
	self notifyPopupStencilChanged
]

{ #category : #accessing }
OLDBrDropdownModel >> toggleStencil [
	<return: #BrStencil>

	^ toggleStencil
]

{ #category : #accessing }
OLDBrDropdownModel >> toggleStencil: aBrStencil [

	self
		assert: [ aBrStencil isNotNil ]
		description: [ 'Stencil must not be nil' ].

	toggleStencil := aBrStencil asStencil.
	self notifyToggleStencilChanged
]
