testing
isAllLineBreak
	"Return true if segment only consists of line break, false otherwise"
	<return: #Boolean>
	
	^ self text allSatisfy: #isLineBreak