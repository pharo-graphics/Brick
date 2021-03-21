"
I am an abstract class. I define an animated tool bar background. My subclasses return ${class:BlPaint}$ objects on every ${method:BrProgressPaintStencil>>#create|label=#selector}$ call. The subclasses should return different ${class:BlPaint}$ objects on every call in order to generate an animated background effect.

I am used by ${class:BrProgressAnimatedBarLook}$.

See my subclasses for specific use cases: ${class:BrProgressPaintStencil|show=#gtSubclassesFor:|expanded=true|height=150}$


"
Class {
	#name : #BrProgressPaintStencil,
	#superclass : #BrStencil,
	#category : #'Brick-Progress - Look'
}

{ #category : #testing }
BrProgressPaintStencil class >> isAbstract [
	^ self name = #BrProgressPaintStencil 
]

{ #category : #'api - instantiation' }
BrProgressPaintStencil >> create [
	<return: #BlPaint>
	^ self subclassResponsibility
]
