"
I am a ${class:BrProgress}$ glamorous look.
I display a progress bar only. 
See ${class:BrGlamorousProgressExamples}$ class comment for spefic glamorous examples.
"
Class {
	#name : #BrGlamorousProgressWithBarLook,
	#superclass : #BrLook,
	#category : #'Brick-Glamorous-Progress'
}

{ #category : #initialization }
BrGlamorousProgressWithBarLook >> initialize [
	super initialize.
	
	self addChangeProperty: #(widget layout) with: [ BlLinearLayout vertical ].
	self addChangeProperty: #(widget constraints horizontal resizer) with: [ BlLayoutResizer matchParent ].
	self addChangeProperty: #(widget constraints vertical resizer) with: [ BlLayoutResizer fitContent ].
	
	self addAll: {
		BrGlamorousProgressBarLook new.
	}
]
