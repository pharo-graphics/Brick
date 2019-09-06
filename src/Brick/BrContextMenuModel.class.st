Class {
	#name : #BrContextMenuModel,
	#superclass : #BrWidgetModel,
	#instVars : [
		'visible',
		'stencil'
	],
	#category : #'Brick-Context Menu - Model'
}

{ #category : #initialization }
BrContextMenuModel >> initialize [
	super initialize.
	visible := false.
	stencil := [ BlElement new ] asStencil
]

{ #category : #notifying }
BrContextMenuModel >> notifyStencilChanged [
	self
		dispatchEvent: (BrContextMenuStencilChanged new stencil: self stencil)
]

{ #category : #notifying }
BrContextMenuModel >> notifyVisibleChanged [
	self
		dispatchEvent: (BrContextMenuVisibleChanged new visible: self visible)
]

{ #category : #hooks }
BrContextMenuModel >> onAttachedTo: anElement [
	super onAttachedTo: anElement.
	self
		when: BrContextMenuVisibleRequest
			reply: [ BrContextMenuVisibleChanged new
				visible: visible;
				yourself ];
		when: BrContextMenuStencilRequest
			reply: [ BrContextMenuStencilChanged new
				stencil: stencil;
				yourself ]
]

{ #category : #accessing }
BrContextMenuModel >> stencil [
	^ stencil
]

{ #category : #accessing }
BrContextMenuModel >> stencil: aStencil [
	stencil := aStencil asStencil.
	self notifyStencilChanged
]

{ #category : #accessing }
BrContextMenuModel >> visible [
	^ visible
]

{ #category : #accessing }
BrContextMenuModel >> visible: anObject [
	visible := anObject.
	self notifyVisibleChanged
]
