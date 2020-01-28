Extension { #name : #Exception }

{ #category : #'*Brick' }
Exception >> asDebuggableElement [
	^ BrDebugglableElementStencil new
		freeze: self;
		asElement
]
