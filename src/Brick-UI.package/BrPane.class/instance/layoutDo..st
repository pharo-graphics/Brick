as yet unclassified
layoutDo: aBlock
	layout ifNotNil: [ :l | aBlock value: l ]