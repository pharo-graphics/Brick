parsers
figure
	^ super figure 
	==> [ :tokens | 
		| attribute pictureFileReference fileNameWithoutPrefix |
		fileNameWithoutPrefix := tokens third.
		(fileNameWithoutPrefix beginsWith: 'file://') ifTrue: [ 
			fileNameWithoutPrefix := fileNameWithoutPrefix copyFrom: 'file://' size + 1 to: fileNameWithoutPrefix size ].
		pictureFileReference := self fileReference parent resolveString: fileNameWithoutPrefix.
		attribute := pictureFileReference exists
			ifTrue: [ 
				self flag: 'add preview of pictureFileReference'.
				self targetText 
					attributes: { BrTextForegroundAttribute paint: Color blue }
					from: tokens first start 
					to: tokens last stop.
				]
			ifFalse: [ 
				self targetText 
					attributes: {  BrTextForegroundAttribute paint: Color red }
					from: tokens first start 
					to: tokens last stop.
				] ]