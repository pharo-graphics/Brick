pieces - computation
nextSegmentPiece: aBrTextIterator in: aStream
	"Items are words within a text line (segment). There is no guarantee that returned
	object is of type BrText, since replacement attribute may replace a part of text
	with multiple arbitrary objects"
	| initialAdornments aWordText |

	replacedPieces
		ifNotEmpty: [ :theReplacement | ^ theReplacement pop ].

	initialAdornments := aBrTextIterator selectAttributes: #isAdornment.

	aWordText := self nextWord: aBrTextIterator with: initialAdornments.

	initialAdornments
		detect: #shouldReplace
		ifFound: [ :aReplacementAttribute | ^ aStream nextPut: (self adornmentPiece: aWordText with: aReplacementAttribute) ].

	aStream nextPut: (self textPiece: aWordText).
	
	aStream nextPutAll: (initialAdornments
		select: #shouldAppend
		thenCollect: [ :anAppendingAttribute | self adornmentPiece: aWordText with: anAppendingAttribute ])