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
			labelElement padding: (BlInsets top: 3 left: 3 bottom: 3 right: 0 ) ];
		large: [ :aWidget |
			labelElement padding: (BlInsets top: 3 left: 3 bottom: 3 right: 0 ) ];
		default: [ :aWidget | 
			labelElement padding: (BlInsets top: 3 left: 3 bottom: 3 right: 0 ) ];
		small: [ :aWidget |
			labelElement padding: (BlInsets top: 1 left: 2 bottom: 1 right: 0 ) ];
		tiny: [ :aWidget |
			labelElement padding: (BlInsets top: 1 left: 2 bottom: 1 right: 0 ) ];
		mini: [ :aWidget |
			labelElement padding: (BlInsets top: 0 left: 1 bottom: 0 right: 0 ) ])
]
