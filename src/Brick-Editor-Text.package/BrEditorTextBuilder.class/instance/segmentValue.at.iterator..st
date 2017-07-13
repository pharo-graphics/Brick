values - accessing
segmentValue: aBrText at: anIndex iterator: aBrTextIterator
	"In case of a text we split it in a segments based on lines with the help of iterator"
	<return: #BrSubText>
	| lineFound initialValue aSegment aSegmentStartIndex |

	replacedSegments isNotEmpty
		ifTrue: [ ^ replacedSegments top ].
	
	aSegmentStartIndex := aBrTextIterator position.
	
	initialValue := aBrTextIterator isNewLine: aBrTextIterator peek.

	lineFound := false.
	aSegment := aBrTextIterator nextSegment: [ :item |
		aBrTextIterator
			detectAttribute: #isReplacement
			ifFound: [ initialValue ]
			ifNone: [ lineFound
				ifFalse: [ (aBrTextIterator isNewLine: item)
					ifTrue: [ lineFound := true ]
					ifFalse: [ initialValue ] ]
				ifTrue: [ initialValue not ] ] ].

	(aBrTextIterator hasNext and: [ aBrTextIterator isNewLine: aBrTextIterator peek ])
		ifTrue: [ aBrTextIterator next ].
	
	editor addSegment: aSegment.
	
	^ aSegment