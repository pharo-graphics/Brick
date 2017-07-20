instance creation
onCreateHolder: anEditorElement type: aSegmentType
	"Create and return a new segment holder of a given type to be used with provided editor element"
	<return: #BrTextEditorSegmentHolder>
	
	"We perform a single dispatch on a segment type in order to support multiple types"
	^ aSegmentType holder