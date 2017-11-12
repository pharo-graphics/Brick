accessing
elementBlockWithErrorCatching: aBlock
	adornmentBlock := [ :aBrText :anEditorElement |
		[ aBlock cull: aBrText cull: anEditorElement ]
			on: Error 
			do: [ :err |
				| text | 
				text := err printString asRopedText.
				text attributes: { BrTextForegroundAttribute paint: Color red }.
				BlTextElement new 
					text: text;
					constraintsDo: [ :c | 
						c textFlow pushLine.
						c horizontal matchParent.
						c vertical fitContent ] ] ]