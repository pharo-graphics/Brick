Class {
	#name : #BrLazyElementProgressPreviewStencil,
	#superclass : #BlLazyElementPreviewStencil,
	#category : #'Brick-Lazy Preview - Support'
}

{ #category : #'api - instantiation' }
BrLazyElementProgressPreviewStencil >> create [
	^ BlElement new
		layout: BlFrameLayout new;
		background: BlBackground transparent;
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical matchParent. ];
		addChild: self newProgress
]

{ #category : #'api - instantiation' }
BrLazyElementProgressPreviewStencil >> newProgress [
	^ BrProgress new 
		fixedLabel: 'Rendering...' asRopedText;
		look: (BrGlamorousProgressWithLabelAndBarLook new foreground: Color gray lighter);
		constraintsDo: [ :c | 
			c frame horizontal weight: 0.5.
			c frame vertical alignCenter.
			c frame horizontal alignCenter ].
]
