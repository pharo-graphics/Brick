Class {
	#name : #BrGlamorousResizerRightBarAptitude,
	#superclass : #BrAptitude,
	#category : #'Brick-Glamorous-Resizer'
}

{ #category : #accessing }
BrGlamorousResizerRightBarAptitude >> initialize [
	super initialize.
	self
		addChangeProperty: #(widget background)
		with: [ BrGlamorousColors editorBorderColor alpha: 0.5 ].
	self
		addChangeProperty: #(widget geometry)
		with: [ BlRoundedRectangleGeometry cornerRadius: 2 ].
	self
		addChangeProperty: #(widget constraints vertical resizer)
		with: [ BlLayoutResizer exact: 70.0 ].
	self
		addChangeProperty: #(widget constraints horizontal resizer)
		with: [ BlLayoutResizer exact: 4.0 ].
	self addChangeProperty: #(widget margin) with: [ BlInsets right: 4 ].
	self
		addChange:
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
