Class {
	#name : #BrGlamorousListLabelLook,
	#superclass : #BrGlamorousLabelLook,
	#category : #'Brick-Glamorous-Label'
}

{ #category : #initialization }
BrGlamorousListLabelLook >> initialize [
	super initialize.

	self add: (BrSizeAdjustmentLook new
		huge: [ :aWidget | 
			labelElement padding: (BlInsets top: 3 bottom: 3) ];
		large: [ :aWidget | 
			labelElement padding: (BlInsets top: 3 bottom: 3) ];
		default: [ :aWidget | 
			labelElement padding: (BlInsets top: 3 bottom: 3) ];
		small: [ :aWidget | 
			labelElement padding: (BlInsets top: 1 bottom: 1) ];
		tiny: [ :aWidget | 
			labelElement padding: (BlInsets top: 1 bottom: 1) ];
		mini: [ :aWidget | 
			labelElement padding: (BlInsets top: 0 bottom: 0) ])
]
