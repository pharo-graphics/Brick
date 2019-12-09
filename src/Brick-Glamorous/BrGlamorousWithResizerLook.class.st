Class {
	#name : #BrGlamorousWithResizerLook,
	#superclass : #BrLook,
	#instVars : [
		'resizer'
	],
	#category : #'Brick-Glamorous-Resizer'
}

{ #category : #initialization }
BrGlamorousWithResizerLook >> initialize [
	super initialize.
	resizer := self newResizer.
	self addChangeAddChild: #() with: [ resizer ].
	self
		addChange:
			(BrLookChange new
				up: [ :e | resizer target: self widget ];
				down: [ :e |  ];
				yourself)
]

{ #category : #initialization }
BrGlamorousWithResizerLook >> newResizer [
	^ BrResizer new
		look: BrGlamorousResizerLook;
		elevation: (BlRelativeElevation elevation: 1000);
		constraintsDo: [ :c | c ignoreByLayout ]
]

{ #category : #enumerating }
BrGlamorousWithResizerLook >> resizerDo: aBlock [
	aBlock value: resizer
]
