text - modifications
insertedOutsideString: aString at: aTextIndex in: aBrTextEditor stream: aStream
	"Is sent when string was inserted outside of cached segments"

	"Text was added after the last cached segment, no need to do anything"
	aTextIndex > aBrTextEditor segmentCollector end
		ifTrue: [ ^ self ].
		
	aBrTextEditor segmentCollector moveTextBy: aString size.

	"there are no cached segments, do nothing"
	aBrTextEditor segmentCollector hasCached
		ifFalse: [ ^ self ].

	"was added before the first cached segment. We should offset
			all indices of all cached segments and all sub texts"
	aTextIndex < aBrTextEditor segmentCollector start ifTrue: [
		aBrTextEditor segmentCollector offsetSegmentIndicesBy: aStream collection size - 1.
		^ self ].

	self error: 'Must not reach this'