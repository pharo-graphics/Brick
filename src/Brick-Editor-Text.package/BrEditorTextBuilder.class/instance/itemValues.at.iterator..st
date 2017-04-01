builder - items
itemValues: aBrText at: anIndex iterator: aBrTextIterator
	"Items are words within a text line (segment)"
	<return: #BrText>
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

	^ initialAttribute
		ifNil: [ aSegment ]
		ifNotNil: [ :anAttribute | anAttribute replace: aSegment ]