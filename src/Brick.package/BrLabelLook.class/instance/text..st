accessing
text: aTextOrString
	labelText := aTextOrString asRopedText.
	
	foreground ifNotNil: [ labelText foreground: foreground ].
	weight ifNotNil: [ labelText weight: weight ].
	fontSize ifNotNil: [ labelText fontSize: fontSize ].

	self label text: labelText