"
I am basic ${class:BrProgress}$ bar glamorous look.
See ${class:BrGlamorousProgressExamples}$ class comment for spefic glamorous examples.
"
Class {
	#name : #BrGlamorousProgressBarAptitude,
	#superclass : #BrProgressAnimatedBarAptitude,
	#category : #'Brick-Glamorous-Progress'
}

{ #category : #'instance creation' }
BrGlamorousProgressBarAptitude >> newProgressBarElement [
	^ super newProgressBarElement
		background: BrGlamorousColors defaultButtonTextColor;
		margin: (BlInsets all: 1);
		geometry: (BlStadium new)
]

{ #category : #'instance creation' }
BrGlamorousProgressBarAptitude >> newProgressContainerElement [
	^ super newProgressContainerElement
		background: BrGlamorousColors defaultButtonBackgroundColor;
		border: (BlBorder paint: BrGlamorousColors defaultButtonBorderColor width: 1);
		geometry: (BlStadium new);
		margin: (BlInsets left: 4)
]
