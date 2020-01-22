"
I am an animated ${class:BrProgressBarLook}$. I add an animated background to the progress bar widget: 

${example:BrProgressExamples>>#animatedBar|codeExpanded=false|previewExpanded=true|previewHeight=180}$

I use ${class:BrProgressPaintStencil}$ to compute new progress bar background on every animation step.

"
Class {
	#name : #BrProgressAnimatedBarLook,
	#superclass : #BrProgressBarLook,
	#instVars : [
		'paintStencil'
	],
	#category : #'Brick-Progress - Look'
}

{ #category : #accessing }
BrProgressAnimatedBarLook >> animationDelay [
	^ 121 milliSeconds
]

{ #category : #configuration }
BrProgressAnimatedBarLook >> beGradientAnimation [
	self paintStencil: BrProgressGradientPaintStencil new
]

{ #category : #configuration }
BrProgressAnimatedBarLook >> beGradientAnimationBaseColor: aStartColor highlightColor: aStopColor [
	self paintStencil: (BrProgressGradientPaintStencil new
		startColor: aStartColor;
		stopColor: aStopColor)
]

{ #category : #configuration }
BrProgressAnimatedBarLook >> beGradientAnimationColor: aStopColor [
	self paintStencil: (BrProgressGradientPaintStencil new
		stopColor: aStopColor)
]

{ #category : #initialization }
BrProgressAnimatedBarLook >> defaultPaintStencil [
	^ BrProgressGradientPaintStencil new
]

{ #category : #initialization }
BrProgressAnimatedBarLook >> initialize [
	super initialize.
	self paintStencil: self defaultPaintStencil.
	self container enqueueTask: self newAnimationTask.
]

{ #category : #'instance creation' }
BrProgressAnimatedBarLook >> newAnimationTask [
	^ BlRepeatedTaskAction new
		delay: self animationDelay;
		action: [ self updateContainerBackground ].
]

{ #category : #accessing }
BrProgressAnimatedBarLook >> paintStencil [
	<return: #BrProgressPaintStencil>
	^ paintStencil
]

{ #category : #accessing }
BrProgressAnimatedBarLook >> paintStencil: aBrProgressPaintStencil [
	paintStencil := aBrProgressPaintStencil
]

{ #category : #updating }
BrProgressAnimatedBarLook >> updateContainerBackground [
	"do nothing"
	self container background: self paintStencil create.
]
