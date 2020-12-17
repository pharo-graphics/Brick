Extension { #name : #BrTextReplacingAttribute }

{ #category : #'*Brick-Glamorous' }
BrTextReplacingAttribute >> glamorousRoundedBackground [
	self embellishment: [ :anElement |
		anElement background: BrGlamorousColors neutralBackgroundColor.
		anElement geometry: (BlRoundedRectangleGeometry cornerRadius: 4) ].
	self padding: (BlInsets all: 3).
	self margin: (BlInsets top: 3 bottom: 3)
]
