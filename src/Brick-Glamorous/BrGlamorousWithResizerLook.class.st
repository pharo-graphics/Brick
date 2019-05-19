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
	self addChangeAddChild: #(content) with: [ resizer ].
	self
		addChange:
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
