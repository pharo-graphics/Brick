as yet unclassified
importIcons: iconCollection fromFolder: aString inClass: aClass category: aCategory
	iconCollection
		do: [:each |
			| method form |
			form := PNGReadWriter formFromFileNamed: aString, '/', each , '.png'.
			method := each , Character cr asString ,
				('^ self icons
					at: #',  each , 
					' ifAbsentPut: ['),		
				form storeString,
				']'.
			aClass compile: method classified: aCategory ]