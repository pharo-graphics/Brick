Class {
	#name : #BrGlamorousResizerRightBarLook,
	#superclass : #BrLook,
	#category : #'Brick-Glamorous'
}

{ #category : #'as yet unclassified' }
BrGlamorousResizerRightBarLook >> initialize [
	super initialize.
	changes
		add:
			(#(widget background)
				asBrLookPropertyChangeWithValue: [ BrGlamorousColors editorBorderColor alpha: 0.5 ]).
	changes
		add:
			(#(widget geometry)
				asBrLookPropertyChangeWithValue: [ BlRectangle cornerRadius: 2 ]).
	changes
		add:
			(#(widget constraints vertical resizer)
				asBrLookPropertyChangeWithValue: [ BlLayoutResizer exact: 70 ]).
	changes
		add:
			(#(widget constraints horizontal resizer)
				asBrLookPropertyChangeWithValue: [ BlLayoutResizer exact: 4 ]).
	changes
		add:
			(#(widget margin)
				asBrLookPropertyChangeWithValue: [ BlInsets right: 4 ]).
	changes
		add:
			(BrLookChange new
				up: [ :e | 
					self widget
						constraintsDo: [ :c | 
							c ignoreByLayout.
							c ignored vertical alignCenter.
							c ignored horizontal alignRight ] ];
				down: [ :e |  ];
				yourself)
]
