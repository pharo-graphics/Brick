Class {
	#name : #BrGlamorousButtonIconLook,
	#superclass : #BrIconLook,
	#category : #'Brick-Glamorous-Buttons - Support'
}

{ #category : #initialization }
BrGlamorousButtonIconLook >> initialize [
	super initialize.
			
	self add: (BrSizeAdjustmentLook new
		target: [ self icon ];
		huge: [ :aStyle | aStyle scaleBy: 2 ];
		large: [ :aStyle | aStyle scaleBy: 1.5 ];
		normal: [ :aStyle | aStyle scaleBy: 1 ];
		small: [ :aStyle | aStyle scaleBy: 0.75 ];
		tiny: [ :aStyle | aStyle scaleBy: 0.75 ];
		mini: [ :aStyle | aStyle scaleBy: 0.5 ])
]
