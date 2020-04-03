Class {
	#name : #BrGlamorousButtonIconLook,
	#superclass : #BrIconLook,
	#category : #'Brick-Glamorous-Buttons - Support'
}

{ #category : #initialization }
BrGlamorousButtonIconLook >> initialize [
	super initialize.
	
	self add: (BrSizeAdjustmentLook new
		default: [ self icon transformDo: [ :t | t scaleBy: 1 ] ];
		small: [ self icon transformDo: [ :t | t scaleBy: 0.75] ])
]
