accessing
segment: anEditorSegment
	| aSubEditor aSubEditorElement |
	segment := anEditorSegment.

	aSubEditor := BrTextEditor new text: (BrScopedText text: anEditorSegment text asString asRopedText). 
	
	aSubEditorElement := BrEditorElement new editor: aSubEditor.
	aSubEditorElement background: Color white.
	aSubEditorElement constraintsDo: [ :c |
		c horizontal matchParent.
		c vertical fitContent ].

	itemElement removeChildren.
	itemElement addChild: aSubEditorElement