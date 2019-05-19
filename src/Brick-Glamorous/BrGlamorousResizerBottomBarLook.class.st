Class {
	#name : #BrGlamorousResizerBottomBarLook,
	#superclass : #BrLook,
	#category : #'Brick-Glamorous'
}

{ #category : #'as yet unclassified' }
BrGlamorousResizerBottomBarLook >> initialize [
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
				asBrLookPropertyChangeWithValue: [ BlLayoutResizer exact: 4 ]).
	changes
		add:
			(#(widget constraints horizontal resizer)
				asBrLookPropertyChangeWithValue: [ BlLayoutResizer exact: 70 ]).
	changes
		add:
			(#(widget margin)
				asBrLookPropertyChangeWithValue: [ BlInsets bottom: 4 ]).
	changes
		add:
			(BrLookChange new
				up: [ :e | 
					self widget
						constraintsDo: [ :c | 
							c ignoreByLayout.
							c ignored vertical alignBottom.
							c ignored horizontal alignCenter ] ];
				down: [ :e |  ];
				yourself)
]
