Class {
	#name : #BrTextEditorSegmentCollectorExamples,
	#superclass : #Object,
	#instVars : [
		'largeFile'
	],
	#category : #'Brick-Editor-Examples'
}

{ #category : #private }
BrTextEditorSegmentCollectorExamples >> deleteLargeFile [

	largeFile ifNotNil: 
		[ largeFile ensureDelete.
		largeFile := nil ].
]

{ #category : #accessing }
BrTextEditorSegmentCollectorExamples >> largeFile [
	<gtExample>

	^largeFile ifNil: 
		[ largeFile := FileReference newTempFilePrefix: 'BlRopeableCollectionFileExamples-' suffix: '-largeFile'.
		largeFile writeStreamDo: [ :stream |
			1 to: 10000 do: [ :l |
				1 to: 9 do: [ :i |
					stream << (((l-1)*10 + i-1) printPaddedWith: $0 to: 10) ].
				stream << 'abcdefghi'; lf. ] ].
		largeFile ].
]

{ #category : #accessing }
BrTextEditorSegmentCollectorExamples >> largeFileRope [

	^ BlRopeableCollectionFile ropeFor: self largeFile
		"self largeFile contents asRopedText"
]

{ #category : #examples }
BrTextEditorSegmentCollectorExamples >> segmentAt142 [
	"Retrieve the segment at 1.42 times the cache limit.
	This tests accessing the cache outside its initial contents.
	Assumptions:
	- The test file size has at least twice the number of lines in the cache"
	<gtExample>
	<after: #deleteLargeFile>
	| segmentCollector limit expected actual |

	segmentCollector := self segmentCollector.
	limit := (segmentCollector cacheLimit * 1.42) rounded.
	expected := ((limit - 1) * 10) printPaddedWith: $0 to: 10.
	actual := (segmentCollector segmentAt: limit) asString copyFrom: 1 to: 10.
	self assert: actual equals: expected.
]

{ #category : #examples }
BrTextEditorSegmentCollectorExamples >> segmentAt200and262 [
	"Retrieve the segment at line 200, followed by the segment at line 262.
	This tests re-using part of the previously cached items where the index of the segments collection is not the same as the line number"
	<gtExample>
	<after: #deleteLargeFile>
	| segmentCollector expected actual limit |

	segmentCollector := self segmentCollector.

	limit := (segmentCollector cacheLimit * 2) rounded.
	expected := ((limit - 1) * 10) printPaddedWith: $0 to: 10.
	actual := (segmentCollector segmentAt: limit) asString copyFrom: 1 to: 10.
	self assert: actual equals: expected.

	limit := (segmentCollector cacheLimit * 2.62) rounded.
	expected := ((limit - 1) * 10) printPaddedWith: $0 to: 10.
	actual := (segmentCollector segmentAt: limit) asString copyFrom: 1 to: 10.
	self assert: actual equals: expected.

]

{ #category : #examples }
BrTextEditorSegmentCollectorExamples >> segmentAt242and42 [
	"Retrieve the segment at line 2.42 times the cache limit, followed by the segment at line 42.
	This tests #computeBackwardAt:."
	<gtExample>
	<after: #deleteLargeFile>
	| expected actual segmentCollector limit |

	segmentCollector := self segmentCollector.

	"Retrieve several segments leading up to 2.42 times to populate the map entries"
	expected := '0000000410'.
	actual := (segmentCollector segmentAt: 42) asString copyFrom: 1 to: 10.
	self assert: actual equals: expected.

	limit := (segmentCollector cacheLimit * 1.42) rounded.
	expected := ((limit - 1) * 10) printPaddedWith: $0 to: 10.
	actual := (segmentCollector segmentAt: limit) asString copyFrom: 1 to: 10.
	self assert: actual equals: expected.

	limit := (segmentCollector cacheLimit * 2.42) rounded.
	expected := ((limit - 1) * 10) printPaddedWith: $0 to: 10.
	actual := (segmentCollector segmentAt: limit) asString copyFrom: 1 to: 10.
	self assert: actual equals: expected.

	limit := (segmentCollector cacheLimit * 0.42) rounded.
	expected := ((limit - 1) * 10) printPaddedWith: $0 to: 10.
	actual := (segmentCollector segmentAt: limit) asString copyFrom: 1 to: 10.
	self assert: actual equals: expected.

]

{ #category : #examples }
BrTextEditorSegmentCollectorExamples >> segmentAt42 [
	"Retrieve the segment at line 42.
	Assumes the cache limit is always greater than 42."
	<gtExample>
	<after: #deleteLargeFile>
	| expected actual |

	expected := '0000000410'.
	actual := (self segmentCollector segmentAt: 42) asString copyFrom: 1 to: 10.
	self assert: actual equals: expected.
]

{ #category : #examples }
BrTextEditorSegmentCollectorExamples >> segmentAt80and120 [
	"Retrieve the segment at 0.8 times the cache limit, followed by the segment at 1.2 times the cache limit.
	This tests re-using part of the previously cached items"
	<gtExample>
	<after: #deleteLargeFile>
	| segmentCollector expected actual limit |

	segmentCollector := self segmentCollector.

	limit := (segmentCollector cacheLimit * 0.8) rounded.
	expected := (limit - 1 * 10) printPaddedWith: $0 to: 10.
	actual := (segmentCollector segmentAt: limit) asString copyFrom: 1 to: 10.
	self assert: actual equals: expected.

	limit := (segmentCollector cacheLimit * 1.2) rounded.
	expected := (limit - 1 * 10) printPaddedWith: $0 to: 10.
	actual := (segmentCollector segmentAt: limit) asString copyFrom: 1 to: 10.
	self assert: actual equals: expected.

]

{ #category : #accessing }
BrTextEditorSegmentCollectorExamples >> segmentCollector [

	^ self textEditor segmentCollector
]

{ #category : #accessing }
BrTextEditorSegmentCollectorExamples >> textEditor [ 

	^ BrTextEditor new text: self largeFileRope
]
