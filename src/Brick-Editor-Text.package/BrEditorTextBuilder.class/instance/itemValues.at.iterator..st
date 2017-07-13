builder - items
itemValues: aBrText at: anIndex iterator: aBrTextIterator
	"Items are words within a text line (segment). There is no guarantee that returned
	object is of type BrText, since replacement attribute may replace a part of text
	with multiple arbitrary objects"
	<return: #SequenceableCollection of: #BrText or: #Object>
	| initialAttribute initialValue aSubText |

	replacedSegments isNotEmpty
		ifTrue: [ aBrText = replacedSegments top
			ifTrue: [
				replacedSegments size = 1
					ifTrue: [ replacedSegmentsCleaned := true ].
				^ replacedSegments pop ] ].

	initialAttribute := aBrTextIterator
			detectAttribute: #isReplacement
			ifFound: #yourself
			ifNone: [ nil ].

	initialValue := self itemValueType: aBrTextIterator peek.

	aSubText := aBrTextIterator nextSegment: [ :item |
		initialAttribute = (aBrTextIterator
			detectAttribute: #isReplacement
			ifFound: #yourself
			ifNone: [ nil ])
				ifTrue: [ initialAttribute
					ifNil: [ self itemValueType: item ]
					ifNotNil: [ initialValue ] ]
				ifFalse: [ #different ] ].
	
	editor addPiece: aSubText for: aBrText.
	
	^ initialAttribute
		ifNil: [ aSubText ]
		ifNotNil: [ :anAttribute | 
			anAttribute wantsNewSegment
				ifTrue: [ 
					replacedSegments push: (anAttribute replace: aSubText).
					replacedSegmentsCleaned := false.
					aSubText ]
				ifFalse: [ anAttribute replace: aSubText ] ]