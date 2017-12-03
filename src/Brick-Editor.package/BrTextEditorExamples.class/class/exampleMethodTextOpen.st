examples
exampleMethodTextOpen
	| space editorElement |

	editorElement := (self >> #elementOnMethodWithSyntaxHighlighting) gtExample returnValue.
	editorElement editor text attributes: {
		(BrFontSizeAttribute size: 18) beNotOverwritableByStyler.
		BrFontGenericFamilyAttribute monospace beNotOverwritableByStyler
	}.
	editorElement editor text attributes: {
		BrTextHoverAttribute new beNotOverwritableByStyler.
		BrTextClickAttribute new beNotOverwritableByStyler
	} from: 39 to: 42.
	editorElement editor segmentBuilder: (BrTextEditorLineSegmentBuilder of: BrTextEditorAttributedLineSegment).
	editorElement constraintsDo: [ :c |
		c horizontal matchParent.
		c vertical matchParent ].
	
	editorElement addEventHandler: BrTextEditorSelectionHandler new.

	space := BlSpace new.
	space extent: 800@400.
	space root addChild: editorElement.
	space show.