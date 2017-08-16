adding
add: anElement
	"try to assign a given element to this line (if possible) or create a new line.
	Return an actual line to which anElement was added"
	<return: #BrEditorTextFlowLine>
	
	| currentLine |
	
	currentLine := ((self hasSpaceFor: anElement) and: [ anElement constraints textFlow shouldBreakLineBefore not ])
		ifTrue: [ self push: anElement ]
		ifFalse: [ self nextLine push: anElement ].
		
	^ anElement constraints textFlow shouldBreakLineAfter
		ifTrue: [ currentLine nextLine ]
		ifFalse: [ currentLine ]