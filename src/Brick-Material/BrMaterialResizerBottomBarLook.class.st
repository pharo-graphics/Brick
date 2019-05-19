Class {
	#name : #BrMaterialResizerBottomBarLook,
	#superclass : #BrLook,
	#category : 'Brick-Material-Collection'
}

{ #category : #'as yet unclassified' }
BrMaterialResizerBottomBarLook >> initialize [
	super initialize.
	changes
		add:
			(#(widget background)
				asBrLookPropertyChangeWithValue: [ Color gray alpha: 0.5 ]).
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
			(#(widget constraints vertical resizer)
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
