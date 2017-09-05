examples
exampleMethodTextOpen
	| space editorElement |

	editorElement := (self >> #element:editorMethodText:) gtExample returnValue.
	editorElement editor text attributes: {
		BrFontSizeAttribute size: 18.
		BrFontGenericFamilyAttribute monospace
	}.
	editorElement editor text attributes: {
		BrTextHoverAttribute new
	} from: 37 to: 43.
	editorElement editor segmentBuilder: (BrTextEditorLineSegmentBuilder of: BrTextEditorAttributedLineSegment).
	editorElement constraintsDo: [ :c |
		c horizontal matchParent.
		c vertical matchParent ].
	
	editorElement addEventHandler: BrTextEditorSelectionHandler new.

	space := BlSpace new.
	space extent: 800@400.
	space root addChild: editorElement.
	space show.