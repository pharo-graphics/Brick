testing
hasItemValue: aBrText at: anIndex iterator: aBrTextIterator
	"In case of text we can directly ask iterator if there are any words left"
	<return: #Boolean>

	^ (replacedSegments isNotEmpty and: [ replacedSegments top = aBrText ])
		ifFalse: [ replacedSegmentsCleaned
			ifTrue: [ replacedSegmentsCleaned := false ]
			ifFalse: [ aBrTextIterator hasNext ] ]
		ifTrue: [ true ]