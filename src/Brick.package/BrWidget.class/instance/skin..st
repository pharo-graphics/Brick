accessing
skin: aSkin
	self skin ifNotNil: [ :oldSkin | self removeEventFilter: oldSkin ].
	skin := aSkin.
	self addEventFilter: aSkin