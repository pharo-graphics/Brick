as yet unclassified
defaultStylesheet
	^ DefaultStylesheet
		ifNil: [ DefaultStylesheet := BrStylesheet origin: BrStyleOrigin AUTHOR ]