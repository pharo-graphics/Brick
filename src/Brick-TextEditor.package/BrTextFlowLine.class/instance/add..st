adding
add: anElement
	"try to assign an given element to this line and return an actual line to which it was added"
	<return: #BrTextFlowLine>

	^ (self hasSpaceFor: anElement)
		ifTrue: [ self push: anElement ]
		ifFalse: [ self nextLine add: anElement ]