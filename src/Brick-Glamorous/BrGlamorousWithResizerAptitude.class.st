Class {
	#name : #BrGlamorousWithResizerAptitude,
	#superclass : #BrAptitude,
	#instVars : [
		'resizer'
	],
	#category : #'Brick-Glamorous-Resizer'
}

{ #category : #'api - visibility' }
BrGlamorousWithResizerAptitude >> hideResizer [
	self resizerDo: [ :aResizer | aResizer visibility: BlVisibility hidden ]
]

{ #category : #initialization }
BrGlamorousWithResizerAptitude >> initialize [
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
BrGlamorousWithResizerAptitude >> newResizer [
	^ BrResizer new
		aptitude: BrGlamorousResizerAptitude;
		elevation: (BlRelativeElevation elevation: 1000);
		constraintsDo: [ :c | c ignoreByLayout ]
]

{ #category : #enumerating }
BrGlamorousWithResizerAptitude >> resizerDo: aBlock [
	aBlock value: resizer
]

{ #category : #'api - visibility' }
BrGlamorousWithResizerAptitude >> showResizer [
	self resizerDo: [ :aResizer | aResizer visibility: BlVisibility visible ]
]
