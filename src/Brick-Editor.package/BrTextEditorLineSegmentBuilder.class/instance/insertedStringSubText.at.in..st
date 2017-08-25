text - modifications
insertedStringSubText: aString at: aTextIndex in: aBrText
	| isFirstLineBreak isLastLineBreak isAfterLineBreak isBeforeLineBreak aStart anEnd |

	"true if inserted string starts with a line break"
	isFirstLineBreak := aString first isLineBreak.

	"true if inserted string ends with a line break"
	isLastLineBreak := aString last isLineBreak.
	
	"true if string is inserted after line break character"
	isAfterLineBreak := aTextIndex isZero
		ifTrue: [ false ]
		ifFalse: [ (aBrText at: aTextIndex) isLineBreak ].
	
	"true if string is inserted before line break character"
	isBeforeLineBreak := ((aTextIndex + 1 < aBrText size) and: [ aBrText size > 1 ])
		ifTrue: [ (aBrText at: aTextIndex + 2) isLineBreak ]
		ifFalse: [ false ].

	aStart := aTextIndex.
	anEnd := aTextIndex + aString size + 1.
	
	"If we add after line break something that does not start with line break,
	we should not take previous line break into account"
	(isAfterLineBreak and: [ isFirstLineBreak not ])
		ifTrue: [ aStart := aStart + 1 ].
	
	"if we add before line break something that does not end
	with line breal we should not take next line break into account"
	((isBeforeLineBreak and: [ isLastLineBreak not ])
		"if added string ends with line break we do not care
		what follows it"
		or: [ isLastLineBreak and: [ aTextIndex isZero not ] ])
			ifTrue: [ anEnd := anEnd - 1 ].

	"make sure that sub text does not go out of text bounds"
	aStart := aStart max: 1.
	anEnd := anEnd min: aBrText size.

	^ aBrText
		from: aStart
		to: anEnd