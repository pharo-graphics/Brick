text - modifications
insertedString: aString at: aTextIndex in: aBrTextEditor
	"I am doing a hard work updating editor's segment cache due to inserted string.
	Note: This is an *algorithm* that should be very performant, that is why we don't see
	a point in doing it in OOP style, procedural way fits quite well"
	| aCurrentSegment aStream theNewSegments |

	self
		assert: [ aBrTextEditor text isNotEmpty ]
		description: [ 'Text can not be empty here' ].
	self
		assert: [ aString isNotEmpty ]
		description: [ 'String must not be empty' ].

	aStream := BrEditorSegmentStream new.
	aStream limit: Float infinity.

	self
		split: (aBrTextEditor text from: aTextIndex + 1 to: aTextIndex + aString size)
		in: aStream.

	aBrTextEditor segmentCollector
		cachedSegmentAt: aTextIndex
		ifFound: [ :aSegment | aCurrentSegment := aSegment ]
		ifNotFound: [ self error: 'Not supported yet' ].
	
	theNewSegments := aCurrentSegment insert: aStream segments.
	theNewSegments size > 1
		ifTrue: [ aBrTextEditor segmentCollector addSegments: theNewSegments allButFirst after: aCurrentSegment ].

	aBrTextEditor segmentCollector moveTextBy: aString size after: theNewSegments last.
	
	aBrTextEditor invalidate: aCurrentSegment textStart to: aCurrentSegment textEnd.
	aBrTextEditor update: aCurrentSegment textStart to: aCurrentSegment textEnd.