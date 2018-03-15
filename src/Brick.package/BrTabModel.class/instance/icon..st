api - widget
icon: aBlElement

	icon = aBlElement
		ifTrue: [ ^ self ].

	icon := aBlElement.
	self notifyIconChanged