event managing
buildEventDispatchChain: aTail
	self isDisabled ifTrue:[^ aTail].
	^ super buildEventDispatchChain: aTail