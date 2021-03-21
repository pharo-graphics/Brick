"
I represent a basic preview stencil for ${class:BlAsyncDelayedPreviewStrategy}$. 

I generate the following preview: ${example:BrGlamorousAsyncElementExamples>>#progressStencil|codeExpanded=false|previewExpanded=true}$

The following example will desplay the preview for about 3 seconds: ${example:BrGlamorousAsyncElementExamples>>#lazyPreviewedElementWithProgressStentil}$


"
Class {
	#name : #BrGlamorousAsyncElementProgressPreviewStencil,
	#superclass : #BlAsyncElementPreviewStencil,
	#instVars : [
		'label'
	],
	#category : #'Brick-Glamorous-Async Preview'
}

{ #category : #'api - instantiation' }
BrGlamorousAsyncElementProgressPreviewStencil >> create [
	^ BrFrame new
		matchParent;
		background: BlBackground transparent;
		addChild: self newProgress
]

{ #category : #initialization }
BrGlamorousAsyncElementProgressPreviewStencil >> initialize [
	super initialize.
	
	label := 'Rendering...'
]

{ #category : #accessing }
BrGlamorousAsyncElementProgressPreviewStencil >> label [
	^ label
]

{ #category : #accessing }
BrGlamorousAsyncElementProgressPreviewStencil >> label: anObject [
	label := anObject
]

{ #category : #'api - instantiation' }
BrGlamorousAsyncElementProgressPreviewStencil >> newProgress [
	^ BrProgress new 
		fixedLabel: self label asRopedText;
		"We intentionally replaced it with just a label, otherwise the always updating progress bar consumes space frames to redraw which slows down the system"
		look: (BrGlamorousProgressWithLabelLook new foreground: Color gray lighter);
		constraintsDo: [ :c | 
			c frame horizontal weight: 0.5.
			c frame vertical alignCenter.
			c frame horizontal alignCenter ]
]
