pieces - computation
nextWord: aBrTextIterator with: aCollectionOfInitialAttributes
	<return: #BrSubText>
	| initialValue |

	initialValue := self itemValueType: aBrTextIterator peek.

	^  aBrTextIterator nextSegment: [ :aCharacter |		
			aCollectionOfInitialAttributes = (aBrTextIterator selectAttributes: #isAdornment)
				ifTrue: [ aCollectionOfInitialAttributes
					ifEmpty: [ self itemValueType: aCharacter ]
					ifNotEmpty: [ initialValue ] ]
				ifFalse: [ #different ] ]