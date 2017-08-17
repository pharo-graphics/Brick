text - modifications
insertedString: aString at: aTextIndex in: aBrTextEditor
	"I am doing a hard work updating editor's segment cache due to inserted string.
	Note: This is an *algorithm* that should be very performant, that is why we don't see
	a point in doing it in OOP style, procedural way fits quite well"
	| aCurrentSegment aStream aSubText isAfterLineBreak isFirstLineBreak |

	self
		assert: [ aBrTextEditor text isNotEmpty ]
		description: [ 'Text can not be empty here' ].
		
	self
		assert: [ aString isNotEmpty ]
		description: [ 'String must not be empty' ].
	
	"true if inserted string starts with a line break"
	isFirstLineBreak := aString first isLineBreak.
	
	"true is string is inserted after line break character"
	isAfterLineBreak := aTextIndex isZero
		ifTrue: [ false ]
		ifFalse: [ (aBrTextEditor text at: aTextIndex) isLineBreak ].
	
	aSubText := aBrTextEditor text
		from: ((aTextIndex + (isAfterLineBreak and: [ isFirstLineBreak not ]) asBit) max: 1)
		to: (aTextIndex + aString size min: aBrTextEditor text size).

	aStream := BrTextEditorSegmentStream new.
	aStream limit: Float infinity.
	
	self split: aSubText in: aStream.
		
	aBrTextEditor segmentCollector
		cachedSegmentAt: aTextIndex
		ifFound: [ :aSegment | aCurrentSegment := aSegment ]
		ifNotFound: [
			^ self
				insertedOutsideString: aString
				at: aTextIndex
				in: aBrTextEditor
				stream: aStream ].
	
	aStream collection size > 1
		"If there is more then one segment it means that there should be
		(aStream collection size - 1) new segments"
		ifTrue: [
			| newCurrentSegmentEnd newLastSegmentStart newLastSegmentEnd |			
						
			newCurrentSegmentEnd := aStream collection first textEnd.
			
			newLastSegmentStart := aStream collection last textStart + isFirstLineBreak asBit.
			"we move segments by `aString size` later"
			newLastSegmentEnd := aCurrentSegment textEnd + aString size.
			
			"it makes sense to invalidate current segment only if it is splitted in half"
			(newCurrentSegmentEnd ~= aCurrentSegment textEnd)
				ifTrue: [
					aCurrentSegment start: (aCurrentSegment textStart max: 1) end: newCurrentSegmentEnd.
					aCurrentSegment invalidate ].
			
			aStream collection last
				start: newLastSegmentStart
				end: newLastSegmentEnd.
			
			aBrTextEditor segmentCollector
				addSegments: (aStream collection last: aStream collection size - 1)
				after: aCurrentSegment.
				
			aBrTextEditor segmentCollector moveTextBy: aString size after: aStream collection last ]		
		"there are no new segments"
		ifFalse: [
			aCurrentSegment invalidate.
			aCurrentSegment start: ((aCurrentSegment textStart + isAfterLineBreak asBit) max: 1) end: aCurrentSegment textEnd + aString size.
			aBrTextEditor segmentCollector moveTextBy: aString size after: aCurrentSegment ].
		
	aBrTextEditor updateAll