splitting
split: aBrText in: aStream
	| iterator |
	
	"Note that if original text is empty we must create exactly one empty segment!"
	aBrText isEmpty
		ifTrue: [ ^ aStream nextPut: (self newSegment: (aBrText from: 0 to: 0)) ].

	iterator := aBrText iterator.

	[ iterator hasNext and: [ aStream wantsMore ] ] whileTrue: [
	   | segment |
		segment := self newSegment: iterator nextLine.		
		aStream nextPut: segment ]