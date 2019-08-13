Class {
	#name : #BrTooltipModel,
	#superclass : #BrWidgetModel,
	#instVars : [
		'visible',
		'stencil'
	],
	#category : #'Brick-Tooltip - Model'
}

{ #category : #initialization }
BrTooltipModel >> initialize [
	super initialize.
	visible := false.
	stencil := [ BlElement new ] asStencil
]

{ #category : #notifying }
BrTooltipModel >> notifyStencilChanged [
	self
		dispatchEvent: (BrTooltipStencilChanged new stencil: self stencil)
]

{ #category : #notifying }
BrTooltipModel >> notifyVisibleChanged [
	self
		dispatchEvent: (BrTooltipVisibleChanged new visible: self visible)
]

{ #category : #hooks }
BrTooltipModel >> onAttachedTo: anElement [
	super onAttachedTo: anElement.
	self
		when: BrTooltipVisibleRequest
			reply: [ BrTooltipVisibleChanged new
				visible: visible;
				yourself ];
		when: BrTooltipStencilRequest
			reply: [ BrTooltipStencilChanged new
				stencil: stencil;
				yourself ]
]

{ #category : #accessing }
BrTooltipModel >> stencil [
	^ stencil
]

{ #category : #accessing }
BrTooltipModel >> stencil: aStencil [
	stencil := aStencil asStencil.
	self notifyStencilChanged
]

{ #category : #accessing }
BrTooltipModel >> visible [
	^ visible
]

{ #category : #accessing }
BrTooltipModel >> visible: anObject [
	visible := anObject.
	self notifyVisibleChanged
]
