Extension { #name : #String }

{ #category : #'*Brick-Glamorous' }
String >> asThemedIcon [
	^ BrGlamorousIcons perform: self asSymbol
]
