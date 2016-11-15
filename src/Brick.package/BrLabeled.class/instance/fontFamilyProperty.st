accessing properties
fontFamilyProperty
	^ fontFamily ifNil: [ fontFamily := BlObjectProperty on: self named:#fontFamily  default: StandardFonts defaultFont familyName  ].
	