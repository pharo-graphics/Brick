accessing
text: aTextOrString
	labelText := aTextOrString asRopedText.
	
	foreground ifNotNil: [ labelText foreground: foreground ].
	weight ifNotNil: [ labelText weight: weight ].

	self label text: labelText