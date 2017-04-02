builder - items
itemValues: aBrText at: anIndex iterator: aBrTextIterator
	"Items are words within a text line (segment). There is no guarantee that returned
	object is of type BrText, since replacement attribute may replace a part of text
	with multiple arbitrary objects"
	<return: #SequenceableCollection of: #BrText or: #Object>
	| initialAttribute initialValue aSegment |

	initialAttribute := aBrTextIterator
			detectAttribute: #isReplacement
			ifFound: #yourself
			ifNone: [ nil ].

	initialValue := self itemValueType: aBrTextIterator peek.

	aSegment := aBrTextIterator nextSegment: [ :item |
		initialAttribute = (aBrTextIterator
			detectAttribute: #isReplacement
			ifFound: #yourself
			ifNone: [ nil ])
				ifTrue: [ initialAttribute
					ifNil: [ self itemValueType: item ]
					ifNotNil: [ initialValue ] ]
				ifFalse: [ #different ] ].
	
	editor addPiece: aSegment for: aBrText.
	
	^ initialAttribute
		ifNil: [ aSegment ]
		ifNotNil: [ :anAttribute | anAttribute replace: aSegment ]