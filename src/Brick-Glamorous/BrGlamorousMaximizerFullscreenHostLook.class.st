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
	| anElementToMaximize aHostElement originalHorizontalResizingStrategy originalVerticalResizingStrategy originalPosition containerElement closeButton |
	
	anElementToMaximize := aMaximizeWish elementToMaximize.
	aHostElement := self widget.
	
	originalHorizontalResizingStrategy := anElementToMaximize constraints horizontal resizer.
	originalVerticalResizingStrategy := anElementToMaximize constraints vertical resizer.
	originalPosition := anElementToMaximize constraints position.
	
	anElementToMaximize constraintsDo: [ :c |
		c horizontal matchParent.
		c vertical matchParent.
		c position: 0@0 ].

	containerElement := BlElement new
		background: aMaximizeWish preferredBackground;
		constraintsDo: [ :c |
			c horizontal matchParent.
			c vertical matchParent.
			c ignoreByLayout ];
		zIndex: 100.
	
	closeButton := self createCloseButton.
	closeButton action: [
		aHostElement removeChild: containerElement.
		anElementToMaximize removeFromParent.
		anElementToMaximize constraints horizontal resizer: originalHorizontalResizingStrategy.
		anElementToMaximize constraints vertical resizer: originalVerticalResizingStrategy.
		anElementToMaximize constraints position: originalPosition.
		anElementToMaximize dispatchEvent: (BrMaximizerMinimizeWish new elementToMinimize: anElementToMaximize; hostElement: aHostElement) ].
	
	containerElement addChild: anElementToMaximize.
	containerElement addChild: closeButton.
	
	aHostElement addChild: containerElement
]
