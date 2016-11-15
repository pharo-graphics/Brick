as yet unclassified
updateSizeFromEvent: anEvent
	| lPos |
	lPos := self globalPointToLocal: anEvent position.
	 