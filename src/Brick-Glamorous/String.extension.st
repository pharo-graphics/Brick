Extension { #name : #String }

{ #category : #'*Brick-Glamorous' }
String >> asHexColor [
	^ Color fromHexString: self
]

{ #category : #'*Brick-Glamorous' }
String >> asThemedIcon [
	^ BrGlamorousIcons perform: self asSymbol
]
