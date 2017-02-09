instance creation
holder
	"I instantiate and return a new segment holder that corresponds to my type.
	If you want to support multiple segment types, please create a new subclass and override me"
	<return: #BrTextEditorSegmentHolder>

	^ BrTextEditorSegmentHolder new