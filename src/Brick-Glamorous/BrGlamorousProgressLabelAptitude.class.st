"
I am basic ${class:BrProgress}$ label glamorous look.
See ${class:BrGlamorousProgressExamples}$ class comment for spefic glamorous examples.
"
Class {
	#name : #BrGlamorousProgressLabelAptitude,
	#superclass : #BrGlamorousTextLabelAptitude,
	#category : #'Brick-Glamorous-Progress'
}

{ #category : #initialization }
BrGlamorousProgressLabelAptitude >> initialize [
	super initialize.
	self label constraintsDo: [ :c | 
		c margin: (BlInsets all: 3).
		c linear horizontal alignCenter.
		c ignored horizontal alignCenter.
		c ignored vertical alignCenter ]
]
