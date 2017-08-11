pieces - computation
itemValue: aBrTextIterator
	"Items are words within a text line (segment). There is no guarantee that returned
	object is of type BrText, since replacement attribute may replace a part of text
	with multiple arbitrary objects"
	<return: #BrTextEditorAttributedLineSegmentPiece>
	| initialAttribute initialValue aTextPiece |

	replacedPieces
		ifNotEmpty: [ :theReplacement | ^ theReplacement pop ].

	initialAttribute := aBrTextIterator
			detectAttribute: #isReplacement
			ifFound: #yourself
			ifNone: [ nil ].

	initialValue := self itemValueType: aBrTextIterator peek.

	aTextPiece := aBrTextIterator nextSegment: [ :aCharacter |
		initialAttribute = (aBrTextIterator
			detectAttribute: #isReplacement
			ifFound: #yourself
			ifNone: [ nil ])
				ifTrue: [ initialAttribute
					ifNil: [ self itemValueType: aCharacter ]
					ifNotNil: [ initialValue ] ]
				ifFalse: [ #different ] ].
		
	^ initialAttribute
		ifNil: [ BrTextEditorAttributedLineSegmentTextPiece new text: aTextPiece ]
		ifNotNil: [ :anAttribute |
			initialAttribute shouldAppend
				ifTrue: [ 
					replacedPieces push: (BrTextEditorAttributedLineSegmentReplacementPiece new text: aTextPiece; attribute: initialAttribute).
					BrTextEditorAttributedLineSegmentTextPiece new text: aTextPiece ]
				ifFalse: [ BrTextEditorAttributedLineSegmentReplacementPiece new text: aTextPiece; attribute: initialAttribute ] ]