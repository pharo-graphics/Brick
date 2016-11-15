change reporting
wrapTextChanged
	widget isWrapText
		ifTrue: [ text wrappingWidth: self wrappingWidth ]
		ifFalse: [text wrappingWidth: -1 ].