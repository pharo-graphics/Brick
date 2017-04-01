builder - items
itemValueType: anObject
	"Return a type of an item within a segment"
	<return: #Symbol>
	
	^ anObject isCharacter
		ifTrue: [ anObject isSeparator
			ifTrue: [ #separator ]
			ifFalse: [ #letter ] ]
		ifFalse: [ #object ]