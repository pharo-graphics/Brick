"
I define an animated tool bar background. My subclasses return ${class:BlLinearGradientPaint}$ object on every ${method:BrProgressPaintStencil>>#create|label=#selector}$ call.

!! Default Gradients

${example:BrProgressExamples>>#basicGradientPaintStencil|codeExpanded=false|previewExpanded=true}$

!! Green and Blue Gradients

${example:BrProgressExamples>>#blueGradientPaintStencil|codeExpanded=false|previewExpanded=true}$

!! Animated Progress Bar With Gradients

${example:BrProgressExamples>>#animatedBarAndTextAbove|codeExpanded=false|previewExpanded=true|previewHeight=180}$


"
Class {
	#name : #BrProgressGradientPaintStencil,
	#superclass : #BrProgressPaintStencil,
	#instVars : [
		'stop',
		'step',
		'startColor',
		'stopColor'
	],
	#category : #'Brick-Progress - Look'
}

{ #category : #'api - instantiation' }
BrProgressGradientPaintStencil >> create [
	<return: #BlLinearGradientPaint>
	stop > 0.9 ifTrue: [ step := step negated ].
	stop < 0.1 ifTrue: [ step := step negated ].
	stop := stop + step.
	^ self newGradientBackgroundAt: stop.
]

{ #category : #initialization }
BrProgressGradientPaintStencil >> defaultStartColor [
	^ Color white
]

{ #category : #initialization }
BrProgressGradientPaintStencil >> defaultStep [
	^ 0.1
]

{ #category : #initialization }
BrProgressGradientPaintStencil >> defaultStop [
	^ 0.1
]

{ #category : #initialization }
BrProgressGradientPaintStencil >> defaultStopColor [
	^ Color veryVeryLightGray 
]

{ #category : #initialization }
BrProgressGradientPaintStencil >> initialize [
	super initialize.
	stop := self defaultStop.
	step := self defaultStep.
	startColor := self defaultStartColor.
	stopColor := self defaultStopColor.
	
]

{ #category : #'instance creation' }
BrProgressGradientPaintStencil >> newGradientBackgroundAt: aStop [
	^ BlLinearGradientPaint new
			stops:
				{ ( 0.0   -> self startColor ).
				  ( aStop -> self stopColor ).
				  ( 1.0   -> self startColor ) };
			start: 0@0;
			end: 1@1
]

{ #category : #accessing }
BrProgressGradientPaintStencil >> startColor [
	^ startColor
]

{ #category : #accessing }
BrProgressGradientPaintStencil >> startColor: anObject [
	startColor := anObject
]

{ #category : #accessing }
BrProgressGradientPaintStencil >> step [
	^ step
]

{ #category : #accessing }
BrProgressGradientPaintStencil >> step: anObject [
	step := anObject
]

{ #category : #accessing }
BrProgressGradientPaintStencil >> stop [
	^ stop
]

{ #category : #accessing }
BrProgressGradientPaintStencil >> stop: anObject [
	stop := anObject
]

{ #category : #accessing }
BrProgressGradientPaintStencil >> stopColor [
	^ stopColor
]

{ #category : #accessing }
BrProgressGradientPaintStencil >> stopColor: anObject [
	stopColor := anObject
]
