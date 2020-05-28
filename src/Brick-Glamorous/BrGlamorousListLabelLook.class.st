Class {
	#name : #BrGlamorousListLabelLook,
	#superclass : #BrGlamorousLabelLook,
	#category : #'Brick-Glamorous-Label'
}

{ #category : #initialization }
BrGlamorousListLabelLook >> initialize [
	super initialize.

	self add: (BrSizeAdjustmentLook new
		huge: [ :aWidget | aWidget margin: (BlInsets all: 3).
			labelElement padding: (BlInsets top: 3 bottom: 3) ];
		large: [ :aWidget | aWidget margin: (BlInsets all: 3).
			labelElement padding: (BlInsets top: 3 bottom: 3) ];
		default: [ :aWidget | aWidget margin: (BlInsets all: 3).
			labelElement padding: (BlInsets top: 3 bottom: 3) ];
		small: [ :aWidget | aWidget margin: (BlInsets all: 1).
			labelElement padding: (BlInsets top: 0 bottom: 0) ];
		tiny: [ :aWidget | aWidget margin: (BlInsets all: 1).
			labelElement padding: (BlInsets top: 0 bottom: 0) ];
		mini: [ :aWidget | aWidget margin: (BlInsets all: 1).
			labelElement padding: (BlInsets top: 0 bottom: 0) ])
]
