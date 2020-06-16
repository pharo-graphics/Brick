"
I collect and cache text segment for fast access by index. Amount of segment that I store at a time is limited by #cacheLimit.
"
Class {
	#name : #BrTextEditorSegmentCollector,
	#superclass : #Object,
	#traits : 'TBlDebug',
	#classTraits : 'TBlDebug classTrait',
	#instVars : [
		'text',
		'subText',
		'segments',
		'limit',
		'editor',
		'segmentsInterval'
	],
	#category : #'Brick-Editor-Model - Segment-Text'
}

{ #category : #'cache - adding / removing' }
BrTextEditorSegmentCollector >> addSegments: aCollectionOfSegments after: aSegment [
	
	self
		assert: [ aCollectionOfSegments isNotEmpty ]
		description: [ 'Can not add a collection of empty segments!' ].
	
	self
		assert: [ self segments size = segmentsInterval size ]
		description: [ 'Amount of segments must correspond to the interval' ].

	self
		assert: [
			| satisfy |
			satisfy := true.
			self segments with: segmentsInterval do: [ :eachSegment :anExpectedIndex |
				satisfy := satisfy and: [ eachSegment index = anExpectedIndex ]	].
			satisfy ]
		description: [ 'Segment indices must correspond to the interval' ].

	aCollectionOfSegments withIndexDo: [ :aNewSegment :anIndex |
		aNewSegment index: anIndex + aSegment index.
		self segments
			add: aNewSegment
			afterIndex: aSegment index - self firstIndex + anIndex ].
	
	self offsetSegmentIndicesBy: aCollectionOfSegments size after: aCollectionOfSegments last index.
	
	self editor notifyItemsInserted: (aCollectionOfSegments first index to: aCollectionOfSegments last index).
	
	self
		assert: [ self segments size = segmentsInterval size ]
		description: [ 'Amount of segments must correspond to the interval' ].
		
	self
		assert: [
			| satisfy |
			satisfy := true.
			self segments with: segmentsInterval do: [ :eachSegment :anExpectedIndex |
				satisfy := satisfy and: [ eachSegment index = anExpectedIndex ]	].
			satisfy ]
		description: [ 'Segment indices must correspond to the interval' ].
]

{ #category : #'cache - adding / removing' }
BrTextEditorSegmentCollector >> addSegments: aCollectionOfSegments before: aSegment [
	
	self
		assert: [ aCollectionOfSegments isNotEmpty ]
		description: [ 'Can not add a collection of empty segments!' ].
	
	self
		assert: [ self segments size = segmentsInterval size ]
		description: [ 'Amount of segments must correspond to the interval' ].

	self
		assert: [
			| satisfy |
			satisfy := true.
			self segments with: segmentsInterval do: [ :eachSegment :anExpectedIndex |
				satisfy := satisfy and: [ eachSegment index = anExpectedIndex ]	].
			satisfy ]
		description: [ 'Segment indices must correspond to the interval' ].

	aCollectionOfSegments withIndexDo: [ :aNewSegment :anIndex |
		aNewSegment index: (aSegment index - aCollectionOfSegments size) + anIndex.
		self segments
			add: aNewSegment
			afterIndex: aNewSegment index - 1 ].
	
	self offsetSegmentIndicesBy: aCollectionOfSegments size after: aCollectionOfSegments last index.

	self editor notifyItemsInserted: (aCollectionOfSegments first index to: aCollectionOfSegments last index).
	
	self
		assert: [ self segments size = segmentsInterval size ]
		description: [ 'Amount of segments must correspond to the interval' ].
		
	self
		assert: [
			| satisfy |
			satisfy := true.
			self segments with: segmentsInterval do: [ :eachSegment :anExpectedIndex |
				satisfy := satisfy and: [ eachSegment index = anExpectedIndex ]	].
			satisfy ]
		description: [ 'Segment indices must correspond to the interval' ].
]

{ #category : #accessing }
BrTextEditorSegmentCollector >> cacheLimit [
	"I return a maximal number of segments I am allowed to cache"
	<return: #Number>
	
	^ limit
]

{ #category : #accessing }
BrTextEditorSegmentCollector >> cacheLimit: aNumber [
	limit := aNumber
]

{ #category : #'cache - accessing' }
BrTextEditorSegmentCollector >> cachedAt: anIndex [
	"Return a cached segment at an absolute index within editor
	(I must convert index from editor coordiantes to my local cache coordinates)"
	<return: #BrEditorSegment>
	| aCachedIndex |

	aCachedIndex := anIndex - segmentsInterval first + 1.
	^ self segments at: aCachedIndex
]

{ #category : #accessing }
BrTextEditorSegmentCollector >> cachedInterval [
	"Return the interval of the indices of the currently cached segments"
	<return: #Number>

	^ segmentsInterval
]

{ #category : #'cache - accessing' }
BrTextEditorSegmentCollector >> cachedSegmentAt: aTextIndex ifFound: aFoundBlock ifNotFound: aNotFoundBlock [
	| segmentIndex segment |

	segmentIndex := self cachedSegmentIndexAt: aTextIndex.
	
	"if segment index is zero it means that text was modified outsize of currently cached elements"
	segmentIndex isZero
		"we should handle the case when text was inserted at index before a #start
		of the first segment. when it happens we need to move all cached segments"
		ifTrue: [ ^ aNotFoundBlock cull: self ].

	self
		"Make sure that returned value makes sense and cache is not broken"
		assert: [ self isCachedAt: segmentIndex ]
		description: [ 'Segment must be cached' ].
		
	segment := self cachedAt: segmentIndex.
	
	self
		assert: [ segment index = segmentIndex ]
		description: [ 'Segment must have a valid index' ].
		
	aFoundBlock cull: segment
]

{ #category : #'cache - accessing' }
BrTextEditorSegmentCollector >> cachedSegmentIndexAt: aTextIndex [
	"Return an index of a segment in a collection of cached segments that contains
	a text item with a given index or return 0 if no such *cached* segment exists.
	I use binary search to find a segment, algorithmic complexity O(log n)"
	<return: #Number>

	^ self segments
		findBinaryIndex: [ :aSegment |
			(aTextIndex between: aSegment textStart and: aSegment textEnd)
				ifTrue: [ 0 ]
				ifFalse: [
					aTextIndex < aSegment textStart
						ifTrue: [ -1 ]
						ifFalse: [ 1 ] ] ]
		ifNone: [ :leftIndex :rightIndex |
			(leftIndex isNil and: [ rightIndex isNil ])
				ifTrue: [ 0 ]
				ifFalse: [ leftIndex ] ]
]

{ #category : #'cache - computation' }
BrTextEditorSegmentCollector >> computeBackwardAt: anIndex [
	"Currently a brain-dead implementation: Start from the beginning and search forward."

	segmentsInterval := 0 to: 0.
	segments := OrderedCollection new.
	subText := BlSubText text: '' asRopedText from: 1 to: 0.
	self computeForwardAt: anIndex.
]

{ #category : #'cache - computation' }
BrTextEditorSegmentCollector >> computeForwardAt: anIndex [
	| intervalEnd cachedInterval actualStart skip forwardText stream builder  |

	"the index of the last already cached segment"
	intervalEnd := segmentsInterval last.

	"indices interval of segments that we expect to cache in the end"
	cachedInterval := self computeInterval: anIndex.

	"new cached interval may overlap with existing cache, take it into account
	by computing an actual cache start index of a segment"
	actualStart := cachedInterval first max: (intervalEnd + 1).
	
	"a collection in which we will cache segments"
	segments := self forwardSegments: cachedInterval.

	skip := actualStart - (intervalEnd + 1).

	forwardText := self forwardText.
	stream := BrEditorSegmentStream new.
	stream skip: skip.
	stream limit: self cacheLimit - segments size.
	builder := self editor segmentBuilder.
	
	builder
		split: forwardText
		in: stream
		offset: ((forwardText start - text textOffset - 1) max: 0).
	
	segments addAll: stream collection.
	segmentsInterval := cachedInterval first to: cachedInterval first + segments size - 1.
	
	self computeSegmentIndices.
	self computeSubText
]

{ #category : #'cache - computation' }
BrTextEditorSegmentCollector >> computeInterval: anIndex [
	<return: #Interval>
	| start end |
	
	start := anIndex - (self cacheLimit / 2) rounded.
	start := start max: 1.
	end := start + self cacheLimit - 1.
	
	^ start to: end
]

{ #category : #accessing }
BrTextEditorSegmentCollector >> computeSegmentAt: anIndex [
	<return: #BrEditorSegment>

	self
		assert: [ (self isCachedAt: anIndex) not ]
		description: [ 'Computing of already cached segment is wasteful' ].

	anIndex > self lastIndex
		ifTrue: [ self computeForwardAt: anIndex ]
		ifFalse: [ self computeBackwardAt: anIndex ].

	self
		assert: [ self isCachedAt: anIndex ]
		description: [ 'Segment must be already cached!' ].

	^ self cachedAt: anIndex
]

{ #category : #'private - computing' }
BrTextEditorSegmentCollector >> computeSegmentIndices [
	"Recompute segment indices according to currently cached inerval"
	
	self
		assert: [ self hasCached ]
		description: [ 'There must be cached segments in order to compute sub text' ].
	
	self
		assert: [ segments size = segmentsInterval size ]
		description: [ 'Cached segments interval must correspond to amount of segments' ].
		
	segments
		with: segmentsInterval
		do: [ :aSegment :anIndex | aSegment index: anIndex ]
]

{ #category : #'private - computing' }
BrTextEditorSegmentCollector >> computeSubText [
	"Recompute subtext according to currently cached segments"
	| subTextStart subTextEnd |

	self
		assert: [ self hasCached ]
		description: [ 'There must be cached segments in order to compute sub text' ].

	subTextStart := segments first textStart + 1.
	subTextEnd := segments last textEnd + 1.
	"Allow for the fact that the last line in the string may not have a line-end character"
	subTextEnd > text size ifTrue: [ subTextEnd := subTextEnd - 1 ].
	subText := text from: subTextStart to: subTextEnd.
]

{ #category : #'cache - accessing' }
BrTextEditorSegmentCollector >> computedSegmentsCount [
	"Return amount of cached segments. If segments are not cached,
	try to cache them and return their amount"
	<return: #Number>
	
	self hasCached
		ifFalse: [ self computeForwardAt: 1 ].
		
	^ self lastIndex
]

{ #category : #accessing }
BrTextEditorSegmentCollector >> editor [
	<return: #BrTextEditor>

	^ editor
]

{ #category : #accessing }
BrTextEditorSegmentCollector >> editor: aBrTextEditor [
	self
		assert: [ editor isNil ]
		description: [ 'Can only be attached once' ].
	
	editor := aBrTextEditor
]

{ #category : #'cache - accessing' }
BrTextEditorSegmentCollector >> end [
	"Return the index of the last cached item in the text or 0 if nothing is cached"
	<return: #Number>
	
	^ self hasCached
		ifTrue: [ subText end ]
		ifFalse: [ 0 ]
]

{ #category : #'cache - accessing' }
BrTextEditorSegmentCollector >> firstIndex [
	"Return the index of the first cached segment or 0 if there are no cached segments"
	<return: #Number>
	
	^ self hasCached
		ifTrue: [ segments first index ]
		ifFalse: [ 0 ]
]

{ #category : #'cache - computation' }
BrTextEditorSegmentCollector >> forwardSegments: aNewCachedInterval [
	"Create and return a collection which will be used to collect segments for a given new cached interval.
	If existing cached interval overlaps with the new one, we should copy already cached segments to reduce amount of work"
	<return: #SequenceableCollection of: #BrEditorSegment>
	| startIndex |

	startIndex := aNewCachedInterval first - segmentsInterval first + 1.
	^ (self isCachedAt: aNewCachedInterval first)
		ifTrue: [ segments copyFrom: startIndex to: segments size ]
		ifFalse: [ self newSegments ]
]

{ #category : #'cache - computation' }
BrTextEditorSegmentCollector >> forwardText [
	"Return a forward text that start from the next item after the last cached one"
	<return: #BlText>
	| textStart textEnd |

	text isEmpty
		ifTrue: [ ^ BlSubText empty: text ].

	textStart := self end + 1.
	textEnd := text size.

	^ text from: textStart to: textEnd
]

{ #category : #testing }
BrTextEditorSegmentCollector >> hasCached [
	"Return true if there are cached segments, false otherwise"
	<return: #Boolean>

	^ segments isNotEmpty
]

{ #category : #initialization }
BrTextEditorSegmentCollector >> initialize [
	super initialize.
	
	segmentsInterval := 0 to: 0.
	segments := OrderedCollection new.
	limit := 100.
	subText := BlSubText text: '' asRopedText from: 1 to: 0
]

{ #category : #testing }
BrTextEditorSegmentCollector >> isCachedAt: anIndex [
	"Return true if I have a cached segment at a given index, false otherwise"
	<return: #Boolean>

	^ segmentsInterval rangeIncludes: anIndex
]

{ #category : #'cache - accessing' }
BrTextEditorSegmentCollector >> lastIndex [
	"Return the index of the last cached segment or 0 if there are no cached segments"
	<return: #Number>
	
	^ self hasCached
		ifTrue: [ segments last index ]
		ifFalse: [ 0 ]
]

{ #category : #'text - modifications' }
BrTextEditorSegmentCollector >> moveTextBy: aNumber [
	"move all segments' subTexts start/end indices by aNumber"

	self hasCached
		ifFalse: [ ^ self ].
	
	self segments do: [ :aSegment | aSegment moveTextBy: aNumber ].
	self computeSubText
]

{ #category : #'text - modifications' }
BrTextEditorSegmentCollector >> moveTextBy: aNumber after: aSegment [
	"move all segments after the given segment by aNumber"

	aSegment index + 1 to: self segments size do: [ :anIndex |
		| eachSegment |
		eachSegment := self cachedAt: anIndex.
		eachSegment moveTextBy: aNumber ].
	
	self computeSubText
]

{ #category : #'instance creation' }
BrTextEditorSegmentCollector >> newSegments [
	"Return a new empty collection that will be used to store segments"
	<return: #SequenceableCollection>

	^ OrderedCollection new
]

{ #category : #'text - modifications' }
BrTextEditorSegmentCollector >> offsetSegmentIndicesBy: anOffset [
	"Offset segments' #index by anOffset of all cached segments"
	
	self
		offsetSegmentIndicesBy: anOffset
		after: self firstIndex - 1
]

{ #category : #'text - modifications' }
BrTextEditorSegmentCollector >> offsetSegmentIndicesBy: anOffset after: aSegmentIndex [
	"Offset segments' #index by anOffset of all segments after a given segment index.
	Note: #lastIndex is not valid during execution of this method!"
	
	self
		assert: [ aSegmentIndex + 1 >= self firstIndex ]
		description: [ 'Segment index must be greater or equal first segment index ' ].
		
	(aSegmentIndex + 1 to: self segments size + self firstIndex - 1) do: [ :anIndex |
		| aSegment |
		
		aSegment := self segments at: anIndex - self firstIndex + 1.
		aSegment index: aSegment index + anOffset ].
	
	"actual cached interval changed, update it"
	segmentsInterval := segmentsInterval first to: segmentsInterval last + anOffset
]

{ #category : #'cache - adding / removing' }
BrTextEditorSegmentCollector >> removeSegmentInterval: anInterval [
	"Remove all segments within index interval"

	anInterval reverseDo: [ :anIndex | self segments removeAt: anIndex ].
	
	self segments
		withIndexDo: [ :eachSegment :anIndex | eachSegment index: anIndex ].
	
	segmentsInterval := (segments first index to: segments last index).

	self editor notifyItemsRemoved: anInterval
]

{ #category : #accessing }
BrTextEditorSegmentCollector >> segmentAt: anIndex [
	"Return segment at given index"
	<return: #BrEditorSegment>
	
	^ (self isCachedAt: anIndex)
		ifTrue: [ self cachedAt: anIndex ]
		ifFalse: [ self computeSegmentAt: anIndex ]
]

{ #category : #accessing }
BrTextEditorSegmentCollector >> segments [
	<return: #SequenceableCollection of: #BrEditorSegment>

	^ segments
]

{ #category : #'cache - accessing' }
BrTextEditorSegmentCollector >> start [
	"Return the index of the first cached item in the text or 0 if nothing is cached"
	<return: #Number>

	^ self hasCached
		ifTrue: [ subText start ]
		ifFalse: [ 0 ]
]

{ #category : #accessing }
BrTextEditorSegmentCollector >> text [
	<return: #BlText>

	^ text
]

{ #category : #accessing }
BrTextEditorSegmentCollector >> text: aBrText [
	text := aBrText
]
