private
select: aFromTextIndex to: aToTextIndex
	"Select text within an interval defined by provided from and to indices without any other side effects.
	Note:
		- I don't change cursor position.
		- I request segments update"
	| aCommand |
	
	aCommand := BrTextEditorSelectCommand new
		fromIndex: aFromTextIndex;
		toIndex: aToTextIndex.
	self editor enqueueCommand: aCommand