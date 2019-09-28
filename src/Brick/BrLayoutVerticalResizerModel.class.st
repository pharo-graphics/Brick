Class {
	#name : #BrLayoutVerticalResizerModel,
	#superclass : #BrLayoutResizerModel,
	#category : #'Brick-Layout Resizer - Model'
}

{ #category : #initialization }
BrLayoutVerticalResizerModel >> initializeListeners [
	super initializeListeners.
	
	self when: BrLayoutVerticalResizerRequest reply: [ :aResponse | aResponse resizer: self resizer ].
	self when: BrLayoutVerticalResizerWish do: [ :aWish | self resizer: aWish resizer ]
]

{ #category : #'state - accessing' }
BrLayoutVerticalResizerModel >> stateChangedEventClass [
	^ BrLayoutVerticalResizerChanged
]

{ #category : #'state - streaming' }
BrLayoutVerticalResizerModel >> streamStateOn: aStream [
	aStream nextPut: (BrLayoutVerticalResizerState resizer: self resizer)
]
