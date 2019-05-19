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
	changes
		add: (#(content) asBrLookChildAddChangeWithValue: [ resizer ]).
	changes
		add:
			(BrLookChange new
				up: [ :e | resizer target: self widgetContent ];
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
