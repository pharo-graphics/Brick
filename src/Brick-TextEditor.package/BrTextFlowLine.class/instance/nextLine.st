accessing
nextLine
	"Return or create a new next line to which we should continue adding elements"
	<return: #BrTextFlowLine>

	^ nextLine ifNil: [
		nextLine := BrTextFlowLine new
			maxWidth: maxWidth;
			yourself ]