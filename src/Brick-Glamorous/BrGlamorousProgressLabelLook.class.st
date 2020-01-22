"
I am basic ${class:BrProgress}$ label glamorous look.
See ${class:BrGlamorousProgressExamples}$ class comment for spefic glamorous examples.
"
Class {
	#name : #BrGlamorousProgressLabelLook,
	#superclass : #BrGlamorousTextLabelLook,
	#category : #'Brick-Glamorous-Progress'
}

{ #category : #initialization }
BrGlamorousProgressLabelLook >> initialize [
	super initialize.
	self label constraintsDo: [ :c | 
		c margin: (BlInsets all: 3).
		c linear horizontal alignCenter.
		c ignored horizontal alignCenter.
		c ignored vertical alignCenter ]
]
