accessing
styler: aStyler
	styler removeEventHandler: stylerEventHandler.

	styler := aStyler.
	styler addEventHandler: stylerEventHandler.
	
	"styler changed, let's restyle the text"
	self styleText