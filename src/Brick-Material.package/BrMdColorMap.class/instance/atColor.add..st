as yet unclassified
atColor: aSymbol add: anAssoc
	(colorMap at: aSymbol ifAbsentPut: [ Dictionary new ])
		at: anAssoc key
		put: (BrMdColor fromHexString: anAssoc value)