adding
add: anElement
	"Try to assign a given element to this line (if possible) or create a new line.
	Return a line to which next element should be tried to added"
	<return: #BrEditorTextFlowLine>
	| currentLine |
	
	anElement constraints textFlow shouldPushLine
		ifTrue: [
			pushedQueue addLast: anElement.
			^ self ].
	
	currentLine := ((self hasSpaceFor: anElement) and: [ anElement constraints textFlow shouldBreakLineBefore not ])
		ifTrue: [ self push: anElement ]
		ifFalse: [ self nextLine push: anElement ].
		
	^ anElement constraints textFlow shouldBreakLineAfter
		ifTrue: [ currentLine nextLine ]
		ifFalse: [ currentLine ]