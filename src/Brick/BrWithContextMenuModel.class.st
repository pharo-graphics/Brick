Class {
	#name : #BrWithContextMenuModel,
	#superclass : #BrWidgetModel,
	#instVars : [
		'visible',
		'stencil'
	],
	#category : #'Brick-Context Menu - Model'
}

{ #category : #initialization }
BrWithContextMenuModel >> initialize [
	super initialize.
	visible := false.
	stencil := [ BlElement new ] asStencil
]

{ #category : #notifying }
BrWithContextMenuModel >> notifyStencilChanged [
	self
		dispatchEvent: (BrContextMenuStencilChanged new stencil: self stencil)
]

{ #category : #notifying }
BrWithContextMenuModel >> notifyVisibleChanged [
	self
		dispatchEvent: (BrContextMenuVisibleChanged new visible: self visible)
]

{ #category : #hooks }
BrWithContextMenuModel >> onAttachedTo: anElement [
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
BrWithContextMenuModel >> stencil [
	^ stencil
]

{ #category : #accessing }
BrWithContextMenuModel >> stencil: aStencil [
	stencil := aStencil asStencil.
	self notifyStencilChanged
]

{ #category : #accessing }
BrWithContextMenuModel >> visible [
	^ visible
]

{ #category : #accessing }
BrWithContextMenuModel >> visible: anObject [
	visible := anObject.
	self notifyVisibleChanged
]
