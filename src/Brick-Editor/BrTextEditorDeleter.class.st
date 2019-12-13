Class {
	#name : #BrTextEditorDeleter,
	#superclass : #BrTextEditorOperator,
	#instVars : [
		'deletionIntervals',
		'shouldUpdateCursor',
		'shouldUpdateSelection'
	],
	#category : #'Brick-Editor-Model - Operators'
}

{ #category : #'api - configuration' }
BrTextEditorDeleter >> afterCursor [
	"Delete all text after all cursors"

	self cursor do: [ :aCursor |
		self
			from: aCursor position
			to: self text size ]
]

{ #category : #'api - configuration' }
BrTextEditorDeleter >> beforeCursor [
	"Delete all text before the cursors"
		
	self cursor do: [ :aCursor |
		self
			from: 0
			to: aCursor position ]
]

{ #category : #private }
BrTextEditorDeleter >> computeCursorMovement: aCursor [
	"Cumpute by how much a given cursor should be moved after text deletion within current deletion intervals"

	^ self computeIndexMovement: aCursor position
]

{ #category : #private }
BrTextEditorDeleter >> computeIndexMovement: anIndex [
	"Compute by how much a given text index should be moved after text deletion within current deletion intervals"
	| aCursorDelta |

	aCursorDelta := 0.

	deletionIntervals do: [ :aMonotoneSelection |
		(aMonotoneSelection to <= anIndex)
			ifTrue: [ aCursorDelta := aCursorDelta - (aMonotoneSelection to - aMonotoneSelection from) ]
			ifFalse: [ aMonotoneSelection from < anIndex
				ifTrue: [ aCursorDelta := aCursorDelta - (anIndex - aMonotoneSelection from) ] ] ].

	^ aCursorDelta
]

{ #category : #private }
BrTextEditorDeleter >> computeSelectionMovement: aMonotoneSelection [
	"Cumpute by how much a given selection should be moved after text deletion within current deletion intervals.
	Note: a given monotone selection must not overlap with any deletion intervals"
	| aSelectionDelta |
	
	aSelectionDelta := 0.
	
	deletionIntervals do: [ :eachDeletion |
		| size |
		size := eachDeletion to - eachDeletion from.
		eachDeletion to <= aMonotoneSelection from
			ifTrue: [ aSelectionDelta := aSelectionDelta - size  ] ].

	^ aSelectionDelta
]

{ #category : #'api - processing' }
BrTextEditorDeleter >> delete [
	"Perform deletion operation"

	shouldUpdateCursor
		ifTrue: [ self updateCursors ].

	shouldUpdateSelection
		ifTrue: [ self updateSelection ].

	deletionIntervals reverseDo: [ :aMonotoneSelection | self privateDelete: aMonotoneSelection from to: aMonotoneSelection to ]
]

{ #category : #'api - configuration' }
BrTextEditorDeleter >> from: aFromIndex to: aToIndex [
	"Mark a text interval given by from an to indices as the one to be deleted in cursor coordinates"

	aFromIndex = aToIndex
		ifTrue: [ ^ self ].

	deletionIntervals select: aFromIndex to: aToIndex
]

{ #category : #initialization }
BrTextEditorDeleter >> initialize [
	super initialize.
	
	deletionIntervals := BlCompositeSelection new.
	shouldUpdateCursor := true.
	shouldUpdateSelection := true
]

{ #category : #testing }
BrTextEditorDeleter >> isDeleter [
	^ true
]

{ #category : #'api - configuration' }
BrTextEditorDeleter >> oneAfterCursor [
	"Delete one symbol after the cursors"
		
	self cursor do: [ :aCursor |
		self
			from: aCursor position
			to: ((aCursor position + 1) min: self text size) ]
]

{ #category : #'api - configuration' }
BrTextEditorDeleter >> oneBeforeCursor [
	"Delete one symbol before the cursor"

	self cursor do: [ :aCursor |
		self
			from: ((aCursor position - 1) max: 0)
			to: aCursor position ]
]

{ #category : #private }
BrTextEditorDeleter >> privateDelete: aFromTextIndex to: aToTextIndex [
	"I delete a piece of text within a given text interval without cursor or selection update.
	Note: cursor or selection location after deletion may be invalid!"
	| aCommand |

	self
		assert: [ aFromTextIndex >= 0 and: [ aFromTextIndex <= self editor text size ] ]
		description: [ 'From deletion index must be within interval [0... text size]' ].
	self
		assert: [ aToTextIndex >= 0 and: [ aToTextIndex <= self editor text size ] ]
		description: [ 'To deletion index must be within interval [0... text size]' ].
	self
		assert: [ aToTextIndex >= aFromTextIndex ]
		description: [ 'To index must be greater or equal from index' ].

	aCommand := BrTextEditorDeleteCommand new
		fromIndex: aFromTextIndex;
		toIndex: aToTextIndex.
	self editor enqueueCommand: aCommand
]

{ #category : #'api - configuration' }
BrTextEditorDeleter >> selected [
	"Mark currenty selected text as the one to be deleted"

	self selection do: [ :aMonotoneSelection | self from: aMonotoneSelection from to: aMonotoneSelection to ]
]

{ #category : #private }
BrTextEditorDeleter >> updateCursors [
	
	self cursor do: [ :aCursor |
		| aCursorDelta |
		aCursorDelta := self computeCursorMovement: aCursor.
		aCursorDelta isZero
			ifFalse: [ self editor navigator
				dueTo: self;
				move: aCursor by: aCursorDelta;
				apply ] ]
]

{ #category : #private }
BrTextEditorDeleter >> updateSelection [
	| aSelectionCopy newSelection |
	
	deletionIntervals do: [ :aMonotoneSelection | self editor deselect: aMonotoneSelection from to: aMonotoneSelection to ].
	
	aSelectionCopy := BlCompositeSelection new select: self selection.
	aSelectionCopy deselect: deletionIntervals.

	newSelection := BlCompositeSelection new.
	aSelectionCopy do: [ :eachSelection |
		| aSelectionDelta |

		aSelectionDelta := self computeSelectionMovement: eachSelection.
		newSelection select: (eachSelection from + aSelectionDelta) to: (eachSelection to + aSelectionDelta) ].

	self editor selection: newSelection
]

{ #category : #'api - configuration' }
BrTextEditorDeleter >> withoutCursorUpdate [
	shouldUpdateCursor := false
]

{ #category : #'api - configuration' }
BrTextEditorDeleter >> withoutSelectionUpdate [
	shouldUpdateSelection := false
]
