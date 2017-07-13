collector - adding
segment: anObject for: aBuilder at: anIndex
	"Add and return a new segment for a given object and builder"
	<return: #BrEditorSegment>
	| aSegment |

	aSegment := self newSegment.
	aSegment entity: anObject.
	aSegment builder: aBuilder.
	aSegment index: anIndex.
	
	self segments add: aSegment beforeIndex: anIndex.
	"since we add a segment somewhere in the middle we need to
	offset indices of all segments after inserted one"
	anIndex + 1 to: self segments size
		do: [ :eachSegment | eachSegment index: eachSegment index + 1 ].
	
	^ aSegment