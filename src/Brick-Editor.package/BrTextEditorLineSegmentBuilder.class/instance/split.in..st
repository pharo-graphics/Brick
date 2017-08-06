splitting
split: aBrText in: aStream
	| iterator |

	iterator := aBrText iterator.

	[ iterator hasNext and: [ aStream wantsMore ] ] whileTrue: [
	   | segment |
		segment := self newSegment: iterator nextLine.
		aStream nextPut: segment ]