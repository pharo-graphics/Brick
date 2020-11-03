"
I am basic ${class:BrProgress}$ bar glamorous look.
See ${class:BrGlamorousProgressExamples}$ class comment for spefic glamorous examples.
"
Class {
	#name : #BrGlamorousProgressBarLook,
	#superclass : #BrProgressAnimatedBarLook,
	#category : #'Brick-Glamorous-Progress'
}

{ #category : #'instance creation' }
BrGlamorousProgressBarLook >> newProgressBarElement [
	^ super newProgressBarElement
		background: BrGlamorousColors defaultButtonTextColor;
		margin: (BlInsets all: 1);
		geometry: (BlStadium new)
]

{ #category : #'instance creation' }
BrGlamorousProgressBarLook >> newProgressContainerElement [
	^ super newProgressContainerElement
		background: BrGlamorousColors defaultButtonBackgroundColor;
		border: (BlBorder paint: BrGlamorousColors defaultButtonBorderColor width: 1);
		geometry: (BlStadium new);
		margin: (BlInsets left: 4)
]
