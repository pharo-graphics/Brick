accessing
text: aTextOrString
	text := aTextOrString asRopedText.
	
	self attributesBuilder attributesTarget: text.
	self label text: text