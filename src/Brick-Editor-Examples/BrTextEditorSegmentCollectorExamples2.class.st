Class {
	#name : #BrTextEditorSegmentCollectorExamples2,
	#superclass : #Object,
	#category : #'Brick-Editor-Examples'
}

{ #category : #examples }
BrTextEditorSegmentCollectorExamples2 >> retrieveLimitPlusOne [
	<gtExample>
	| string limit editor collector |

	limit := BrTextEditorSegmentCollector new cacheLimit.
	string := String streamContents: [ :stream |
		1 to: limit+1 do: [ :i |
		 stream
		 	<< 'Line ';
		 	<< (i printPaddedWith: $0 to: 3);
		 	lf ] ].
	editor := BrTextEditor new.
	editor text: string asRopedText.
	collector := editor segmentCollector.

	self assert: (collector segmentAt: limit+1) asString
			equals: 'Line ', (limit+1 printPaddedWith: $0 to: 3).
	self assert: (collector segmentAt: 1) asString
			equals: 'Line 001'.
	self assert: (collector segmentAt: limit+1) asString
			equals: 'Line ', (limit+1 printPaddedWith: $0 to: 3).
	self assert: (collector segmentAt: limit) asString
			equals: 'Line ', (limit printPaddedWith: $0 to: 3).

]

{ #category : #examples }
BrTextEditorSegmentCollectorExamples2 >> retrieveWithinLimit [
	<gtExample>
	| string limit editor collector |

	limit := BrTextEditorSegmentCollector new cacheLimit // 2.
	string := String streamContents: [ :stream |
		1 to: 501 do: [ :i |
		 stream
		 	<< 'Line ';
		 	<< (i printPaddedWith: $0 to: 3);
		 	lf ] ].
	editor := BrTextEditor new.
	editor text: string asRopedText.
	collector := editor segmentCollector.

	self assert: (collector segmentAt: 1) asString
			equals: 'Line 001'.
	self assert: (collector segmentAt: limit) asString
			equals: 'Line ', (limit printPaddedWith: $0 to: 3).
	self assert: (collector segmentAt: limit // 2) asString
			equals: 'Line ', (limit // 2 printPaddedWith: $0 to: 3).

]
