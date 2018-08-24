Class {
	#name : #BrToolbarSkin,
	#superclass : #BrSkin,
	#category : 'Brick-Experimental-Toolbar'
}

{ #category : #'as yet unclassified' }
BrToolbarSkin >> defaultLayout [
	^ BlLinearLayout horizontal
]

{ #category : #'as yet unclassified' }
BrToolbarSkin >> initializeSkin [
	widget
		height: 48;
		background: Color blue quiteWhiter;
		constraintsDo: [ :c | c horizontal matchParent ]
]
