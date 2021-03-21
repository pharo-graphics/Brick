Class {
	#name : #BrPopupModel,
	#superclass : #BrWidgetModel,
	#instVars : [
		'stencil',
		'target'
	],
	#category : #'Brick-Popup - Model'
}

{ #category : #initialization }
BrPopupModel >> initialize [
	super initialize.
	
	stencil := [ BlElement new ] asStencil.
	target := BrPopupEmptyTarget new
]

{ #category : #initialization }
BrPopupModel >> initializeListeners [
	super initializeListeners.

]

{ #category : #notifying }
BrPopupModel >> notifyStencilChanged [
	self dispatchEvent: (BrPopupStencilChanged new popupStencil: self stencil)
]

{ #category : #notifying }
BrPopupModel >> notifyTargetChanged [
	self dispatchEvent: (BrPopupTargetChanged new popupTarget: self target)
]

{ #category : #accessing }
BrPopupModel >> stencil [
	^ stencil
]

{ #category : #accessing }
BrPopupModel >> stencil: aStencil [
	stencil := aStencil asStencil.
	self notifyStencilChanged
]

{ #category : #accessing }
BrPopupModel >> target [
	^ target
]

{ #category : #accessing }
BrPopupModel >> target: aPopupTarget [
	target := aPopupTarget.
	self notifyTargetChanged
]
