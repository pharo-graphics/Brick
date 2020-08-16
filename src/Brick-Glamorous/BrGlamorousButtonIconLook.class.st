Class {
	#name : #BrGlamorousButtonIconLook,
	#superclass : #BrIconLook,
	#category : #'Brick-Glamorous-Buttons - Support'
}

{ #category : #initialization }
BrGlamorousButtonIconLook >> initialize [
	super initialize.
			
	self add: (BrSizeAdjustmentLook new
		huge: [ self icon transformDo: [ :t | t scaleBy: 2] ];
		large: [ self icon transformDo: [ :t | t scaleBy: 1.5] ];
		default: [ self icon transformDo: [ :t | t scaleBy: 1 ] ];
		small: [ self icon transformDo: [ :t | t scaleBy: 0.75] ];
		tiny: [ self icon transformDo: [ :t | t scaleBy: 0.75] ];
		mini: [ self icon transformDo: [ :t | t scaleBy: 0.5] ])
]
