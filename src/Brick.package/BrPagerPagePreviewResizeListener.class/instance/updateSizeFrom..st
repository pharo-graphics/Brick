element handlers
updateSizeFrom: aPageElement
	| aPageExtent aScale aPreviewExtent |

	aPageExtent := aPageElement extent.
	aScale := aPageExtent y / self height.
	
	aPreviewExtent := aScale isZero
		ifTrue: [ 0@0 ]
		ifFalse: [ (aPageExtent / aScale) rounded ].
	
	self previewElement size: aPreviewExtent