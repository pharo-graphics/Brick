pieces - computation
itemValue: aBrTextIterator
	"Items are words within a text line (segment). There is no guarantee that returned
	object is of type BrText, since replacement attribute may replace a part of text
	with multiple arbitrary objects"
	<return: #BrTextEditorAttributedLineSegmentPiece>
	| initialAttributes initialValue aTextPiece |

	replacedPieces
		ifNotEmpty: [ :theReplacement | ^ theReplacement pop ].

	initialAttributes := aBrTextIterator selectAttributes: #isReplacement.

	initialValue := self itemValueType: aBrTextIterator peek.

	aTextPiece := aBrTextIterator nextSegment: [ :aCharacter |		
		initialAttributes = (aBrTextIterator selectAttributes: #isReplacement)
				ifTrue: [ initialAttributes
					ifEmpty: [ self itemValueType: aCharacter ]
					ifNotEmpty: [ initialValue ] ]
				ifFalse: [ #different ] ].
		
	^ initialAttributes
		ifEmpty: [ BrTextEditorAttributedLineSegmentTextPiece new text: aTextPiece ]
		ifNotEmpty: [ :theAttributes |
			theAttributes
				detect: #shouldReplace
				ifFound: [ :aReplacementAttribute | BrTextEditorAttributedLineSegmentReplacementPiece new text: aTextPiece; attribute: aReplacementAttribute ]
				ifNone: [
					theAttributes
						select: #shouldAppend
						thenDo: [ :anAppendingAttribute | replacedPieces push: (BrTextEditorAttributedLineSegmentReplacementPiece new text: aTextPiece; attribute: anAppendingAttribute) ].
					BrTextEditorAttributedLineSegmentTextPiece new text: aTextPiece ] ].