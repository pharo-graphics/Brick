Class {
	#name : #BrProgressGradientPaintStencil,
	#superclass : #BrProgressPaintStencil,
	#instVars : [
		'stop',
		'step'
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
BrProgressGradientPaintStencil >> initialize [
	super initialize.
	stop := 0.1.
	step := 0.01.
]

{ #category : #'instance creation' }
BrProgressGradientPaintStencil >> newGradientBackgroundAt: aStop [
	^ BlLinearGradientPaint new
			stops:
				{ ( 0.0   -> Color white ).
				  ( aStop -> Color gray ).
				  ( 1.0   -> Color white ) };
			start: 0@0;
			end: 1@1
]
