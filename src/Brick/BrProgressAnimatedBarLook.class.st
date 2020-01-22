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
	^ paintStencil
]

{ #category : #accessing }
BrProgressAnimatedBarLook >> paintStencil: anObject [
	paintStencil := anObject
]

{ #category : #updating }
BrProgressAnimatedBarLook >> updateContainerBackground [
	"do nothing"
	self container background: self paintStencil create.
]
