Class {
	#name : #BrScrollbarModel,
	#superclass : #BrWidgetModel,
	#instVars : [
		'trackStencil',
		'thumbStencil',
		'scrollableElement'
	],
	#category : #'Brick-Scrollbar - Model'
}

{ #category : #initialization }
BrScrollbarModel >> initialize [
	super initialize.
	
	trackStencil := [ BlElement new ] asStencil.
	thumbStencil := [ BlElement new ] asStencil.
]

{ #category : #initialization }
BrScrollbarModel >> initializeListeners [
	super initializeListeners.
	
	self
		when: BrScrollbarScrollableRequest
		reply: [ :aResponse | aResponse scrollableElement: self scrollableElement ].
		
	self
		when: BrScrollbarThumbRequest
		reply: [ :aResponse | aResponse stencil: thumbStencil ].
		
	self
		when: BrScrollbarTrackRequest
		reply: [ :aResponse | aResponse stencil: trackStencil ].
]

{ #category : #'private - notifying' }
BrScrollbarModel >> notifyScrollableChanged: aTBlScrollable [
	self dispatchEvent: (BrScrollbarScrollableChanged new scrollableElement: aTBlScrollable)
]

{ #category : #'private - notifying' }
BrScrollbarModel >> notifyThumbChanged: aStencil [
	self dispatchEvent: (BrScrollbarThumbChanged new stencil: aStencil)
]

{ #category : #'private - notifying' }
BrScrollbarModel >> notifyTrackChanged: aStencil [
	self dispatchEvent: (BrScrollbarTrackChanged new stencil: aStencil)
]

{ #category : #accessing }
BrScrollbarModel >> scrollableElement [
	^ scrollableElement
]

{ #category : #accessing }
BrScrollbarModel >> scrollableElement: aTBlScrollable [
	scrollableElement == aTBlScrollable
		ifTrue: [ ^ self ].

	scrollableElement := aTBlScrollable.
	self notifyScrollableChanged: scrollableElement
]

{ #category : #accessing }
BrScrollbarModel >> thumbStencil [
	^ thumbStencil
]

{ #category : #accessing }
BrScrollbarModel >> thumbStencil: aStencil [
	thumbStencil == aStencil
		ifTrue: [ ^ self ].

	thumbStencil := aStencil asStencil.
	self notifyThumbChanged: thumbStencil
]

{ #category : #accessing }
BrScrollbarModel >> trackStencil [
	^ trackStencil
]

{ #category : #accessing }
BrScrollbarModel >> trackStencil: aStencil [
	trackStencil == aStencil
		ifTrue: [ ^ self ].

	trackStencil := aStencil asStencil.
	self notifyTrackChanged: trackStencil
]
