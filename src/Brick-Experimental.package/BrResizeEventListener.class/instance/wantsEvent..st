mouse handlers
wantsEvent: anEvent
	^ anEvent isBaseDrag or: [ anEvent isMouse and: [ isDragging not ] ]