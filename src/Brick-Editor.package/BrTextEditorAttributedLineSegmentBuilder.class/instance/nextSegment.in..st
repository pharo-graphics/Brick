splitting
nextSegment: anIterator in: aStream
	| aParagraphSegment aParagraphIterator theParagraphAttributes |
	
	aParagraphSegment := anIterator nextSegment: [ :aCharacter |
		anIterator selectAttributes: [ :anAttribute |
			anAttribute isParagraphAttribute and: [ anAttribute isAdornment ] ] ].

	aParagraphIterator := aParagraphSegment iterator.
	theParagraphAttributes := aParagraphIterator
			selectAttributes: [ :anAttribute |
				anAttribute isParagraphAttribute and: [ anAttribute isAdornment ] ].
	
	self
		assert: [ theParagraphAttributes isEmpty or: [ theParagraphAttributes size = 1 ] ]
		description: [ 'There can only be at most one paragraph adornment attribute' ].
	
	theParagraphAttributes
		"if there are no paragraph adornment attributes we fallback to the default line-based splitting"
		ifEmpty: [
			[ aParagraphIterator hasNext and: [ aStream wantsMore ] ]
				whileTrue: [ super nextSegment: aParagraphIterator in: aStream ] ]
		ifNotEmpty: [ :theAttributes |
			| aParagraphAdornmentAttribute aSegment |

			aParagraphAdornmentAttribute := theAttributes.
			aSegment := BrTextEditorAttributedParagraphSegment new.
			aSegment initializeWith: aParagraphSegment.
			
			aStream nextPut: aSegment ]