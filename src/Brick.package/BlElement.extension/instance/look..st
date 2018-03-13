*Brick
look: aLook
	| aLookInstance |
	
	aLookInstance := aLook asLook.
	self removeEventHandlersSuchThat: [ :each | each isKindOf: BrLook ].
	self addEventHandler: aLookInstance.
	self userData at: #brickLook put: aLookInstance