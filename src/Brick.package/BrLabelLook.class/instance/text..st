accessing
text: aTextOrString
	labelText := aTextOrString asRopedText.
	
	self attributesBuilder attributesTarget: labelText.
	self label text: labelText