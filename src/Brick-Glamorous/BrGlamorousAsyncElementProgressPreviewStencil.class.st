"
I represent a basic preview stencil for ${class:BlAsyncDelayedPreviewStrategy}$. 

I generate the following preview: ${example:BrGlamorousAsyncElementExamples>>#progressStencil|codeExpanded=false|previewExpanded=true}$

The following example will desplay the preview for about 3 seconds: ${example:BrGlamorousAsyncElementExamples>>#lazyPreviewedElementWithProgressStentil}$


"
Class {
	#name : #BrGlamorousAsyncElementProgressPreviewStencil,
	#superclass : #BlAsyncElementPreviewStencil,
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
