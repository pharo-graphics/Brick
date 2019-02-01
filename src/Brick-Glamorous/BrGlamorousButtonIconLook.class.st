Class {
	#name : #BrGlamorousButtonIconLook,
	#superclass : #BrIconLook,
	#category : #'Brick-Glamorous-Buttons - Support'
}

{ #category : #'as yet unclassified' }
BrGlamorousButtonIconLook >> initialize [
	super initialize.
	
	self add: (BrInteractiveLook new style: [ :aStyler |
		aStyler default: [ self icon
			transformDo: [ :t | t scaleBy: 1 ]].
		aStyler small: [ self icon 
			transformDo: [ :t | t scaleBy: 0.75] ]])
]

{ #category : #initialization }
BrGlamorousButtonIconLook >> initializeLook [
	super initializeLook
]
