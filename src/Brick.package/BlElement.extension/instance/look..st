*Brick
look: aBrViewLook
	self removeEventHandlersSuchThat: [ :each | each isKindOf: BrLook ].
	self addEventHandler: aBrViewLook