as yet unclassified
elementsOn: anObject in: anEditor for: aSegment from: anEditorBuilder
	| aDisplayedValue anElement |
	
	aDisplayedValue := displayBlock cull: anObject.
	
	anElement := (initializeElementBlock cull: aDisplayedValue cull: anEditor).
	bindBlock cull: anElement cull: aDisplayedValue cull: anEditor.
	styledBlock valueWithEnoughArguments: { anElement . aDisplayedValue . anEditor. aSegment . anEditorBuilder }.
	^ anElement