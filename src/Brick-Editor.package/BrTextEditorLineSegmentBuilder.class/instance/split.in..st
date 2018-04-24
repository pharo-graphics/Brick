splitting
split: aBrText in: aStream
	| iterator |
	
	"Note that if original text is empty we must create exactly one empty segment!"
	aBrText isEmpty
		ifTrue: [ ^ aStream nextPut: (self newSegment: (aBrText from: 0 to: 0)) ].
	
	"in case of just line break we should generate two segmens"
	(aBrText size = 1 and: [ (aBrText at: 1) isLineBreak ])
		ifTrue: [
			| firstIndex secondIndex |
			
			firstIndex := aBrText start - 1.
			secondIndex := aBrText start.
			
			aStream nextPut: (self newSegment: (aBrText from: firstIndex to: firstIndex)).
			^ aStream nextPut: (self newSegment: (aBrText from: secondIndex to: secondIndex)) ].

	iterator := aBrText iterator.
	[ iterator hasNext and: [ aStream wantsMore ] ] whileTrue: [
	   | segment |
		segment := self newSegment: iterator nextLine.		
		aStream nextPut: segment ]