Class {
	#name : #BrGlamorousAsyncElementProgressPreviewStencil,
	#superclass : #BlLazyElementPreviewStencil,
	#category : #'Brick-Glamorous-Async Preview'
}

{ #category : #'api - instantiation' }
BrGlamorousAsyncElementProgressPreviewStencil >> create [
	^ BrFrame new
		matchParent;
		background: BlBackground transparent;
		addChild: self newProgress
]

{ #category : #'api - instantiation' }
BrGlamorousAsyncElementProgressPreviewStencil >> newProgress [
	^ BrProgress new 
		fixedLabel: 'Rendering...' asRopedText;
		look: (BrGlamorousProgressWithLabelAndBarLook new foreground: Color gray lighter);
		constraintsDo: [ :c | 
			c frame horizontal weight: 0.5.
			c frame vertical alignCenter.
			c frame horizontal alignCenter ].
]
