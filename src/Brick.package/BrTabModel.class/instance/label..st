api - widget
label: aBrTextOrString

	label = aBrTextOrString
		ifTrue: [ ^ self ].

	label := aBrTextOrString.
	self notifyLabelChanged