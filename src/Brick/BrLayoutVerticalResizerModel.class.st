Class {
	#name : #BrLayoutVerticalResizerModel,
	#superclass : #BrLayoutResizerModel,
	#category : #'Brick-! Deprecated'
}

{ #category : #testing }
BrLayoutVerticalResizerModel class >> isDeprecated [
	^ true
]

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
BrLayoutVerticalResizerModel >> streamStateIn: aBrInteractionStatesMapping [
	aBrInteractionStatesMapping
		addState: (BrDeprecatedLayoutVerticalResizerState resizer: self resizer)
		model: self
]
