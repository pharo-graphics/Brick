api - cursor
moveLeftBy: aTextIndexDelta in: aBrTextEditor
	position := (position -  aTextIndexDelta) max: 0