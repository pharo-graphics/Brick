executing
executeOn: aTextEditor
	| oldCursorPosition newCursorPosition oldCursorSegment newCursorSegment |

	oldCursorPosition := aTextEditor cursor position.
	newCursorPosition := self position.

	aTextEditor segmentCollector
		cachedSegmentAt: oldCursorPosition
		ifFound: [ :aSegment | oldCursorSegment := aSegment ]
		ifNotFound: [  ].

	aTextEditor segmentCollector
		cachedSegmentAt: newCursorPosition
		ifFound: [ :aSegment | newCursorSegment := aSegment ]
		ifNotFound: [  ].

	aTextEditor cursor position: newCursorPosition.
	
	aTextEditor onCursorMoved: oldCursorPosition to: newCursorPosition.

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
	aTextEditor
		notifyItemsChanged: (oldCursorSegment index to: oldCursorSegment index)
		payload: self newHolderCommand.
		
	aTextEditor
		notifyItemsChanged: (newCursorSegment index to: newCursorSegment index)
		payload: self newHolderCommand.
	