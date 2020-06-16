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
	"Retrieve the segment at line 142.
	Since 100 lines are collected initially (see limit in BrTextEditorSegmentCollector), this will require the cache to be updated, testing the associated functionality."
	<gtExample>
	<after: #deleteLargeFile>
	| expected actual |

	expected := '0000001410'.
	actual := (self segmentCollector segmentAt: 142) asString copyFrom: 1 to: 10.
	self assert: actual equals: expected.
]

{ #category : #examples }
BrTextEditorSegmentCollectorExamples >> segmentAt200and262 [
	"Retrieve the segment at line 200, followed by the segment at line 262.
	This tests re-using part of the previously cached items where the index of the segments collection is not the same as the line number"
	<gtExample>
	<after: #deleteLargeFile>
	| segmentCollector expected actual |

	segmentCollector := self segmentCollector.

	expected := '0000001990'.
	actual := (segmentCollector segmentAt: 200) asString copyFrom: 1 to: 10.
	self assert: actual equals: expected.

	expected := '0000002610'.
	actual := (segmentCollector segmentAt: 262) asString copyFrom: 1 to: 10.
	self assert: actual equals: expected.
]

{ #category : #examples }
BrTextEditorSegmentCollectorExamples >> segmentAt242and42 [
	"Retrieve the segment at line 242, followed by the segment at line 42.
	This tests #computeBackwardAt:."
	<gtExample>
	<after: #deleteLargeFile>
	| expected actual segmentCollector |

	segmentCollector := self segmentCollector.

	expected := '0000002410'.
	actual := (segmentCollector segmentAt: 242) asString copyFrom: 1 to: 10.
	self assert: actual equals: expected.

	expected := '0000000410'.
	actual := (segmentCollector segmentAt: 42) asString copyFrom: 1 to: 10.
	self assert: actual equals: expected.
]

{ #category : #examples }
BrTextEditorSegmentCollectorExamples >> segmentAt42 [
	"Retrieve the segment at line 42.
	Since 100 lines are collected initially (see limit in BrTextEditorSegmentCollector), this will be cached."
	<gtExample>
	<after: #deleteLargeFile>
	| expected actual |

	expected := '0000000410'.
	actual := (self segmentCollector segmentAt: 42) asString copyFrom: 1 to: 10.
	self assert: actual equals: expected.
]

{ #category : #examples }
BrTextEditorSegmentCollectorExamples >> segmentAt42and142 [
	"Retrieve the segment at line 42, followed by the segment at line 142.
	This tests re-using part of the previously cached items"
	<gtExample>
	<after: #deleteLargeFile>
	| segmentCollector expected actual |

	segmentCollector := self segmentCollector.

	expected := '0000000410'.
	actual := (segmentCollector segmentAt: 42) asString copyFrom: 1 to: 10.
	self assert: actual equals: expected.

	expected := '0000001410'.
	actual := (segmentCollector segmentAt: 142) asString copyFrom: 1 to: 10.
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
