Class {
	#name : #BrGlamorousListLabelAptitude,
	#superclass : #BrGlamorousLabelAptitude,
	#category : #'Brick-Glamorous-Label'
}

{ #category : #initialization }
BrGlamorousListLabelAptitude >> initialize [
	super initialize.

	self add: (BrSizeAdjustmentAptitude new
		huge: [ :aStyle | aStyle padding: (BlInsets top: 3 left: 3 bottom: 3 right: 0 ) ];
		large: [ :aStyle | aStyle padding: (BlInsets top: 3 left: 3 bottom: 3 right: 0 ) ];
		normal: [ :aStyle | aStyle padding: (BlInsets top: 3 left: 3 bottom: 3 right: 0 ) ];
		small: [ :aStyle | aStyle padding: (BlInsets top: 1 left: 2 bottom: 1 right: 0 ) ];
		tiny: [ :aStyle | aStyle padding: (BlInsets top: 1 left: 2 bottom: 1 right: 0 ) ];
		mini: [ :aStyle | aStyle padding: (BlInsets top: 0 left: 1 bottom: 0 right: 0 ) ])
]
