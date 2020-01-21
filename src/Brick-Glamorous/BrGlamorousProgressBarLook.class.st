Class {
	#name : #BrGlamorousProgressBarLook,
	#superclass : #BrProgressBarLook,
	#category : #'Brick-Glamorous-Progress'
}

{ #category : #'instance creation' }
BrGlamorousProgressBarLook >> newProgressBarElement [
	^ super newProgressBarElement
		background: BrGlamorousColors defaultButtonTextColor;
		margin: (BlInsets all: 1);
		geometry: (BlRectangle cornerRadius: 8)
]

{ #category : #'instance creation' }
BrGlamorousProgressBarLook >> newProgressContainerElement [
	^ super newProgressContainerElement
		background: BrGlamorousColors defaultButtonBackgroundColor;
		border: (BlBorder paint: BrGlamorousColors defaultButtonBorderColor width: 1);
		geometry: (BlRectangle cornerRadius: 8)
]
