accessing
start: aStartIndex end: anEndIndex
	"Appended pieces must not modify original text"
	self attribute shouldAppend
		ifTrue: [ ^ self ].

	super start: aStartIndex end: anEndIndex