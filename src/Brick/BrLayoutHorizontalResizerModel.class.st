Class {
	#name : #BrLayoutHorizontalResizerModel,
	#superclass : #BrLayoutResizerModel,
	#category : #'Brick-Layout Resizer - Model'
}

{ #category : #testing }
BrLayoutHorizontalResizerModel class >> isDeprecated [
	^ true
]

{ #category : #initialization }
BrLayoutHorizontalResizerModel >> initializeListeners [
	super initializeListeners.
	
	self when: BrLayoutHorizontalResizerRequest reply: [ :aResponse | aResponse resizer: self resizer ].
	self when: BrLayoutHorizontalResizerWish do: [ :aWish | self resizer: aWish resizer ]
]

{ #category : #'state - accessing' }
BrLayoutHorizontalResizerModel >> stateChangedEventClass [
	^ BrLayoutHorizontalResizerChanged
]

{ #category : #'state - streaming' }
BrLayoutHorizontalResizerModel >> streamStateIn: aBrInteractionStatesMapping [
	aBrInteractionStatesMapping
		addState: (BrDeprecatedLayoutHorizontalResizerState resizer: self resizer)
		model: self
]
