Class {
	#name : #BrLayoutHorizontalResizerModel,
	#superclass : #BrLayoutResizerModel,
	#category : #'Brick-! Core'
}

{ #category : #initialization }
BrLayoutHorizontalResizerModel >> initializeListeners [
	super initializeListeners.
	
	self when: BrLayoutHorizontalResizerRequest reply: [ :aResponse | aResponse resizer: self resizer ]
]

{ #category : #'state - accessing' }
BrLayoutHorizontalResizerModel >> stateChangedEventClass [
	^ BrLayoutHorizontalResizerChanged
]

{ #category : #'state - streaming' }
BrLayoutHorizontalResizerModel >> streamStateOn: aStream [
	aStream nextPut: (BrLayoutHorizontalResizerState resizer: self resizer)
]
