accessing
segment: anEditorSegment
	| anEditor |
	
	segment := anEditorSegment.
	anEditor := self infiniteElement dataSource.
	itemElement segment: segment in: anEditor