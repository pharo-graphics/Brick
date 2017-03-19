accessing
nextLine
	"Return or create a new next line to which we should continue adding elements"
	<return: #BrEditorFlowLine>

	^ nextLine ifNil: [
		nextLine := BrEditorFlowLine new
			maxWidth: maxWidth;
			yourself ]