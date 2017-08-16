executing
executeOn: aTextEditor
	| oldCursorSegment newCursorSegment |
	
	aTextEditor cursor position: self position.
	
	aTextEditor segmentCollector
		cachedSegmentAt: aTextEditor cursor position
		ifFound: [ :aSegment | oldCursorSegment := aSegment ]
		ifNotFound: [  ].

	aTextEditor segmentCollector
		cachedSegmentAt: self position
		ifFound: [ :aSegment | newCursorSegment := aSegment ]
		ifNotFound: [  ].

	(oldCursorSegment isNil and: [ newCursorSegment isNil ])
		ifTrue: [ ^ self ].
		
	oldCursorSegment == newCursorSegment
		ifTrue: [
			^ aTextEditor
				notifyItemsChanged: (newCursorSegment index to: newCursorSegment index)
				payload: self newHolderCommand ].

	(oldCursorSegment isNil and: [ newCursorSegment isNotNil ])
		ifTrue: [ 
			^ aTextEditor
				notifyItemsChanged: (newCursorSegment index to: newCursorSegment index)
				payload: self newHolderCommand	].
				
	(oldCursorSegment isNotNil and: [ newCursorSegment isNil ])
		ifTrue: [ 
			^ aTextEditor
				notifyItemsChanged: (oldCursorSegment index to: oldCursorSegment index)
				payload: self newHolderCommand	].
	
	"here both are not nil"
	
	(oldCursorSegment index - newCursorSegment index) abs = 1
		ifTrue: [
			| fromIndex toIndex |
			fromIndex := oldCursorSegment index min: newCursorSegment index.
			toIndex := oldCursorSegment index max: newCursorSegment index.
			^ aTextEditor
				notifyItemsChanged: (fromIndex to: toIndex)
				payload: self newHolderCommand ].
			
	aTextEditor
		notifyItemsChanged: (newCursorSegment index to: newCursorSegment index)
		payload: self newHolderCommand.
	aTextEditor
		notifyItemsChanged: (oldCursorSegment index to: oldCursorSegment index)
		payload: self newHolderCommand