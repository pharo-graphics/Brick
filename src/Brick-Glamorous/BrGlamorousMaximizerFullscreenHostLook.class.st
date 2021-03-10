Class {
	#name : #BrGlamorousMaximizerFullscreenHostLook,
	#superclass : #BrMaximizerHostLook,
	#category : #'Brick-Glamorous-Maximizer'
}

{ #category : #'private - hooks' }
BrGlamorousMaximizerFullscreenHostLook >> createCloseButton [
	^ BrButton new
		look: BrGlamorousButtonCircularLook + BrGlamorousButtonIconLook + BrGlamorousButtonFlatExteriorLook + BrGlamorousButtonLayoutLook;
		icon: [ (BrGlamorousVectorIcons close asElement
				outskirts: BlOutskirts centered;
				background: Color gray;
				border: (BlBorder paint: Color transparent width: 0.8)) ] asStencil;
		beLargeSize;
		constraintsDo: [ :c |
			c ignoreByLayout.
			c ignored horizontal alignRight.
			c ignored vertical alignTop.
			c margin: (BlInsets top: 5) ]
]

{ #category : #'private - hooks' }
BrGlamorousMaximizerFullscreenHostLook >> onMaximize: aMaximizeWish [
	| anElementToMaximize aHostElement originalHorizontalResizingStrategy originalVerticalResizingStrategy previousHorizontalResizerState previousVerticalResizerState originalPosition containerElement closeButton |
	
	anElementToMaximize := aMaximizeWish elementToMaximize.
	aHostElement := self widget.
	
	originalHorizontalResizingStrategy := anElementToMaximize constraints horizontal resizer.
	originalVerticalResizingStrategy := anElementToMaximize constraints vertical resizer.
	originalPosition := anElementToMaximize constraints position.
	
	previousHorizontalResizerState := anElementToMaximize states
		stateLike: BrLayoutHorizontalResizerState new
		ifFound: #yourself
		ifNone: [ nil ].
		
	previousVerticalResizerState := anElementToMaximize states
		stateLike: BrLayoutVerticalResizerState new
		ifFound: #yourself
		ifNone: [ nil ].
	
	anElementToMaximize constraintsDo: [ :c |
		c horizontal matchParent.
		c vertical matchParent.
		c position: 0@0 ].

	anElementToMaximize states addState: BrLayoutHorizontalResizerState matchParent.
	anElementToMaximize states addState: BrLayoutVerticalResizerState matchParent.

	containerElement := BlElement new
		background: aMaximizeWish preferredBackground;
		constraintsDo: [ :c |
			c horizontal matchParent.
			c vertical matchParent.
			c ignoreByLayout ].
	
	closeButton := self createCloseButton.
	closeButton action: [
		aHostElement removeChild: containerElement.
		anElementToMaximize removeFromParent.
		
		previousHorizontalResizerState
			ifNil: [ anElementToMaximize states removeState: BrLayoutHorizontalResizerState matchParent ]
			ifNotNil: [ anElementToMaximize states addState: previousHorizontalResizerState ].
			
		previousVerticalResizerState
			ifNil: [ anElementToMaximize states removeState: BrLayoutVerticalResizerState matchParent ]
			ifNotNil: [ anElementToMaximize states addState: previousVerticalResizerState ].
		
		anElementToMaximize constraints horizontal resizer: originalHorizontalResizingStrategy.
		anElementToMaximize constraints vertical resizer: originalVerticalResizingStrategy.
		anElementToMaximize constraints position: originalPosition.
		aMaximizeWish maximizerLook dispatchEvent: (BrMaximizerMinimizeWish new elementToMinimize: anElementToMaximize; hostElement: aHostElement) ].

	containerElement addChild: anElementToMaximize.
	containerElement addChild: closeButton.
	
	aHostElement addChild: containerElement
]
