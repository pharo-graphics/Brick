Class {
	#name : #BrWithAnchoredModel,
	#superclass : #BrWidgetModel,
	#instVars : [
		'visible',
		'stencil'
	],
	#category : #'Brick-Anchored - Model'
}

{ #category : #initialization }
BrWithAnchoredModel >> initialize [
	super initialize.
	visible := false.
	stencil := [ BlElement new ] asStencil
]

{ #category : #hooks }
BrWithAnchoredModel >> initializeListeners [
	super initializeListeners.
	self
		when: self visibleRequestClass
			reply: [ :e | 
			e
				visible: self visible;
				yourself ];
		when: self stencilRequestClass
			reply: [ :e | 
			e
				stencil: self stencil;
				yourself ]
]

{ #category : #notifying }
BrWithAnchoredModel >> notifyStencilChanged [
	self
		dispatchEvent:
			(self stencilChangedEvent
				stencil: self stencil;
				yourself)
]

{ #category : #notifying }
BrWithAnchoredModel >> notifyVisibleChanged [
	self
		dispatchEvent:
			(self visibleChangedEvent
				visible: self visible;
				yourself)
]

{ #category : #accessing }
BrWithAnchoredModel >> stencil [
	^ stencil
]

{ #category : #accessing }
BrWithAnchoredModel >> stencil: anObject [
	stencil = anObject
		ifTrue: [ ^ self ].
	stencil := anObject asStencil.
	self notifyStencilChanged
]

{ #category : #notifying }
BrWithAnchoredModel >> stencilChangedEvent [
	self subclassResponsibility
]

{ #category : #notifying }
BrWithAnchoredModel >> stencilRequestClass [
	self subclassResponsibility
]

{ #category : #accessing }
BrWithAnchoredModel >> visible [
	^ visible
]

{ #category : #accessing }
BrWithAnchoredModel >> visible: anObject [
	visible = anObject
		ifTrue: [ ^ self ].
	visible := anObject.
	self notifyVisibleChanged
]

{ #category : #notifying }
BrWithAnchoredModel >> visibleChangedEvent [
	self subclassResponsibility
]

{ #category : #notifying }
BrWithAnchoredModel >> visibleRequestClass [
	self subclassResponsibility
]
