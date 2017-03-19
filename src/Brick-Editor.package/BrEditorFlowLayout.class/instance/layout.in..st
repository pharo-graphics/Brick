layout
layout: anElement in: aRectangle
	| anOffsetX anOffsetY aLeft aTop |

	anOffsetX := anElement padding left.
	anOffsetY := anElement padding top.
	
	aLeft := anOffsetX.
	aTop := anOffsetY.
	
	lines do: [ :aLine |
		aLine elements do: [ :aChildElement |
			| aWidth aMarginedTop |
			aLeft := aLeft + aChildElement margin left.
			aMarginedTop := aTop + aChildElement margin top.
			aWidth := aChildElement measuredWidth.
			"we computed layout bounds for the element, let it apply it"
			aChildElement applyLayoutIn: (aLeft @ aMarginedTop extent: aChildElement measuredExtent).
			"offset width for the next element"
			aLeft := aLeft + aWidth + aChildElement margin right ].
		"prepare values for the next line"
		aLeft := anOffsetX.
		aTop := aTop + aLine height + lineSpacing ]