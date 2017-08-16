accessing
nextLine
	"Return or create a new next line to which we should continue adding elements"
	<return: #BrEditorTextFlowLine>

	^ nextLine ifNil: [
		nextLine := BrEditorTextFlowLine new
			maxWidth: maxWidth;
			yourself ]