parsers
monospaceFormat
	^ super monospaceFormat token 
	==> [ :token | 
		self targetText 
			attributes: { BrFontGenericFamilyAttribute monospace }
			from: token start
			to: token stop ]