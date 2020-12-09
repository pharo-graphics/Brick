Extension { #name : #BlElementStates }

{ #category : #'*Brick' }
BlElementStates >> withExpansion [
	self element addEventHandlerIfNotPresent: BrExpansionStateEventHandler uniqueInstance
]
