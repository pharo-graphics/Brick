initialization
importIconsFromDirectory: aFileReference
	"self importIconsFromDirectory: './gt-icons' asFileReference"
	self initialize.
	(aFileReference files select: [ :each | each extension = 'png' ])
		do: [:each |
			| method form |
			form := PNGReadWriter formFromFileNamed: each fullName.
			method := (each basenameWithoutExtension removePrefix: 'gt-'), Character cr asString ,
				(String tab, '^ self icons
		at: #',  (each basenameWithoutExtension removePrefix: 'gt-') , 
		' ifAbsentPut: ['), form storeString, ']'.
			self class compile: method classified: 'icons' ]