Class {
	#name : #BrMaterialResizerBottomBarLook,
	#superclass : #BrLook,
	#category : 'Brick-Material-Collection'
}

{ #category : #accessing }
BrMaterialResizerBottomBarLook >> initialize [
	super initialize.
	self
		addChangeProperty: #(widget background)
		with: [ Color gray alpha: 0.5 ].
	self
		addChangeProperty: #(widget geometry)
		with: [ BlRectangle cornerRadius: 2 ].
	self
		addChangeProperty: #(widget constraints vertical resizer)
		with: [ BlLayoutResizer exact: 4 ].
	self
		addChangeProperty: #(widget constraints vertical resizer)
		with: [ BlLayoutResizer exact: 70 ].
	self addChangeProperty: #(widget margin) with: [ BlInsets bottom: 4 ].
	self
		addChange:
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
