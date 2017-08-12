parsers
script
	| endParser |
	endParser := newline asParser , (EndMarkups at: PRScript) asParser token , space star , lineEnd ==> [:t | t second ].
	^ (Markups at: PRScript) asParser token , scriptParameters , endParser negate plus token , endParser
	==> [ :t | 
		self targetText 
			attributes: { 
			BrFontGenericFamilyAttribute monospace.
			(BrFontSizeAttribute size: 14) }
			from: t third start
			to: t third stop
		 ]