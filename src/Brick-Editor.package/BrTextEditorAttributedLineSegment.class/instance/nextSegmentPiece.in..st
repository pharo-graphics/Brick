pieces - computation
nextSegmentPiece: aBrTextIterator in: aStream
	"Items are words within a text line (segment). There is no guarantee that returned
	object is of type BrText, since replacement attribute may replace a part of text
	with multiple arbitrary objects"
	| initialAdornments anAdornmentText anAdornmentIterator |

	initialAdornments := aBrTextIterator selectAttributes: #isAdornment.
	
	anAdornmentText := self nextAdornment: aBrTextIterator.
	
	initialAdornments
		detect: #shouldReplace
		ifFound: [ :aReplacementAttribute |
			^ aStream nextPut: (self adornmentPiece: anAdornmentText with: aReplacementAttribute) ].
	
	anAdornmentIterator := anAdornmentText iterator.
	[ anAdornmentIterator hasNext ] whileTrue: [
		| aWordText aWordTextIterator  |
		aWordText := self nextWord: anAdornmentIterator.
		aWordTextIterator := aWordText iterator.
		[ aWordTextIterator hasNext ] whileTrue: [
			self nextSpan: aWordTextIterator in: aStream ] ].

	aStream nextPutAll: (initialAdornments
		select: #shouldAppend
		thenCollect: [ :anAppendingAttribute |
			self adornmentPiece: anAdornmentText with: anAppendingAttribute ])