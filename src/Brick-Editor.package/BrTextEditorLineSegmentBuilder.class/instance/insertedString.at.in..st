text - modifications
insertedString: aString at: aTextIndex in: aBrTextEditor
	"I am doing a hard work updating editor's segment cache due to inserted string.
	Note: This is an *algorithm* that should be very performant, that is why we don't see
	a point in doing it in OOP style, procedural way fits quite well"
	| aCurrentSegment aStream aSubText |
	
	self
		assert: [ aBrTextEditor text isNotEmpty ]
		description: [ 'Text can not be empty here' ].
	self
		assert: [ aString isNotEmpty ]
		description: [ 'String must not be empty' ].
	
	aSubText := self
		insertedStringSubText: aString
		at: aTextIndex
		in: aBrTextEditor text.
	
	aStream := BrTextEditorSegmentStream new.
	aStream limit: Float infinity.
	
	self split: aSubText in: aStream.
	
	aBrTextEditor segmentCollector
		cachedSegmentAt: aTextIndex
		ifFound: [ :aSegment | aCurrentSegment := aSegment ]
		ifNotFound: [ ^ self
				insertedOutsideString: aString
				at: aTextIndex
				in: aBrTextEditor
				stream: aStream ].
			
	aStream collection size > 1
		ifTrue: [
			"If there is more then one segment it means that there should be
			(aStream collection size - 1) new segments"
			self
				insertedStringAdd: aString
				at: aTextIndex
				in: aBrTextEditor
				segment: aCurrentSegment
				stream: aStream ]
		ifFalse: [
			self
				insertedStringAppend: aString
				at: aTextIndex
				in: aBrTextEditor
				segment: aCurrentSegment
				stream: aStream ].
	
	aBrTextEditor invalidateAll.
	aBrTextEditor updateAll.
	
	aBrTextEditor
		invalidate: aTextIndex + 1
		to: aTextIndex + aString size.

	aBrTextEditor update: aTextIndex + 1 to: aTextIndex + aString size