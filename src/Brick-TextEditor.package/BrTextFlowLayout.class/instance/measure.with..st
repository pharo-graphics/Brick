measure
measure: anElement with: anExtentSpec
	| maxWidth maxHeight aCurrentLine totalContentWidth totalContentHeight |
	
	"compute how much space is available along both axes"
	maxWidth := (anExtentSpec widthSpec size ifNil: [ Float infinity ]) - anElement padding width.
	maxHeight := (anExtentSpec heightSpec size ifNil: [ Float infinity ]) - anElement padding height.

	"Actually a linked list of lines"
	lines := BrTextFlowLine new maxWidth: maxWidth.
	
	"measure children and distribute them in lines"
	aCurrentLine := lines.
	anElement managedChildrenDo: [ :aChildElement |
		self measureChildWithMargins: aChildElement parentSpec: anExtentSpec.
		aCurrentLine := aCurrentLine add: aChildElement ].

	"compute total extent to measure layout's owner element"	
	totalContentWidth := anElement padding width + lines totalWidth.
	totalContentHeight := anElement padding height + lines totalHeight.

	anElement measuredExtent: (anExtentSpec sizeFor: totalContentWidth @ totalContentHeight)