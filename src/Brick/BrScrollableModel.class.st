Class {
	#name : #BrScrollableModel,
	#superclass : #BrWidgetModel,
	#instVars : [
		'contentStencil'
	],
	#category : #'Brick-Scrollable - Model'
}

{ #category : #accessing }
BrScrollableModel >> contentStencil [
	^ contentStencil
]

{ #category : #accessing }
BrScrollableModel >> contentStencil: aStencil [
	contentStencil := aStencil.
	
	self notifyContentStencilChanged: aStencil
]

{ #category : #initialization }
BrScrollableModel >> initialize [
	super initialize.
	
	contentStencil := [ BlElement new ] asStencil.
]

{ #category : #initialization }
BrScrollableModel >> initializeListeners [
	super initializeListeners.
	
	self when: BrScrollableContentRequest reply: [ :aResponse | aResponse contentStencil: self contentStencil ].
]

{ #category : #'private - notifying' }
BrScrollableModel >> notifyContentStencilChanged: aStencil [
	self dispatchEvent: (BrScrollableContentChanged new contentStencil: aStencil)
]
