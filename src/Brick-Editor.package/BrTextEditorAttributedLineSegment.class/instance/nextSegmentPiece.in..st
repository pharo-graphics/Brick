pieces - computation
nextSegmentPiece: aBrTextIterator in: aStream
	| initialAdornments anAdornmentText anAdornmentIterator |

	initialAdornments := aBrTextIterator selectAttributes: [ :anAttribute |
			anAttribute isParagraphAttribute not and: [ anAttribute isAdornment ] ].
	
	anAdornmentText := self nextAdornment: aBrTextIterator.
	
	initialAdornments
		detect: #shouldReplace
		ifFound: [ :aReplacementAttribute |
			^ aStream nextPut: (self adornmentPiece: anAdornmentText with: aReplacementAttribute) ].
	
	anAdornmentIterator := anAdornmentText iterator.
	[ anAdornmentIterator hasNext ] whileTrue: [
		| aWordText aWordTextIterator |
		aWordText := self nextWord: anAdornmentIterator.
		aWordTextIterator := aWordText iterator.
		[ aWordTextIterator hasNext ] whileTrue: [
			self nextSpan: aWordTextIterator in: aStream ] ].

	aStream nextPutAll: (initialAdornments asArray
		select: #shouldAppend
		thenCollect: [ :anAppendingAttribute | self adornmentPiece: anAdornmentText with: anAppendingAttribute ])