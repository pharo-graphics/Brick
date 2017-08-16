geometry
totalWidth
	"Return a total width taking into account all next lines"
	<return: #Number>
	| aTotalWidth |
	
	aTotalWidth := self hasNextLine
		ifTrue: [ nextLine totalWidth ]
		ifFalse: [ 0 ].
	
	^ self width max: aTotalWidth