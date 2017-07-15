instance creation
initializePiece: aTextElement
	| aCursor |
	
	aCursor := self editor cursor.
	self flag: 'Implement cursor binding'.
	"(aCursor insideSubText: aTextElement text)
		ifTrue: [ aTextElement background: Color red ]"