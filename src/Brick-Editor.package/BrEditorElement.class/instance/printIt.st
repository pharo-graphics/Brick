action
printIt
	| aSelection aSelectionString |
	
	aSelection := Array streamContents: [ :aStream |
		self replaceIn: self on: aStream ].
	
	aSelection ifEmpty: [ ^ self ].

	
	aSelectionString := String streamContents: [ :aStream | 
		aSelection do: [ :each | aStream nextPutAll: each value asString ] ].
	
	self
		evaluate: aSelectionString readStream
		andDo: [ :aResult |
			aSelection first value text
				attributes: {
					BrTextBackgroundAttribute paint: Color paleGreen.
					BrTextDynamicReplaceAttribute new
						append: true;
						newSegment: false;
						object: aResult printString }
				from: aSelection first value start
				to: aSelection last value end.
			
			aSelection do: [ :each |
				| aText aBuilder |
				aText := each value.
				aBuilder := each key.
	
				self editor iterator rebuildSegments: aText text of: aBuilder.
				self editor notifyChanged ] ].
		
	