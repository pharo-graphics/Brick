Extension { #name : #BlText }

{ #category : #'*Brick-Glamorous' }
BlText >> glamorousRoundedBackground [
	self attribute: (BrTextEmbellishmentAttribute new roundedBackground: BrGlamorousColors neutralBackgroundColor)
]
