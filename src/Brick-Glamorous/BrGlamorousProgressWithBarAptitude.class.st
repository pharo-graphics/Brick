"
I am a ${class:BrProgress}$ glamorous look.
I display a progress bar only. 
See ${class:BrGlamorousProgressExamples}$ class comment for spefic glamorous examples.
"
Class {
	#name : #BrGlamorousProgressWithBarAptitude,
	#superclass : #BrAptitude,
	#category : #'Brick-Glamorous-Progress'
}

{ #category : #initialization }
BrGlamorousProgressWithBarAptitude >> initialize [
	super initialize.
	
	self addChangeProperty: #(widget layout) with: [ BlLinearLayout vertical ].
	self addChangeProperty: #(widget constraints horizontal resizer) with: [ BlLayoutResizer matchParent ].
	self addChangeProperty: #(widget constraints vertical resizer) with: [ BlLayoutResizer fitContent ].
	
	self addAll: {
		BrGlamorousProgressBarAptitude new.
	}
]
