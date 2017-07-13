collector - adding
segment: anObject for: aBuilder
	"Add and return a new segment for a given object behind a segment and builder.
	Depending on a builder anObject can represent completely different things.
	For example in case of TextBuilder anObject may be a single line of text,
	a paragraph or even a page"
	<return: #BrEditorSegment>
	| aSegment |

	aSegment := self newSegment.
	aSegment entity: anObject.
	aSegment builder: aBuilder.
	aSegment index: self segments size + 1.
	
	self segments add: aSegment.
	
	^ aSegment