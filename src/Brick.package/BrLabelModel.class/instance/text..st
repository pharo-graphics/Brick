accessing
text: aBlTextOrString
	<event: #BrLabelChanged>

	text = aBlTextOrString
		ifTrue: [ ^ self ].

	text := aBlTextOrString asRopedText.

	self notifyLabelChanged