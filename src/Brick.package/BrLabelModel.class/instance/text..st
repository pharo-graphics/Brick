accessing
text: aBlTextOrString
	text = aBlTextOrString
		ifTrue: [ ^ self ].

	text := aBlTextOrString asRopedText.
	attributesBuilder applyOn: text.
	self notifyLabelChanged