as yet unclassified
elementsOn: anObject
	| aDisplayedValue anElement |
	
	aDisplayedValue := displayBlock cull: anObject.
	
	anElement := (initializeElementBlock cull: aDisplayedValue).
	bindBlock cull: anElement cull: aDisplayedValue.
	styledBlock cull: anElement cull: aDisplayedValue.
	^ anElement