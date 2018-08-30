"
I am responsible for cursor navigation.

- First I perform all cursor remove operations.
- Then I add new cursors
- and finally perform cursor movement operations
"
Class {
	#name : #BrTextEditorNavigator,
	#superclass : #BrTextEditorOperator,
	#instVars : [
		'cursorsToAdd',
		'cursorsToRemove',
		'cursorsToMove'
	],
	#category : #'Brick-Editor-Model'
}

{ #category : #'api - configuration' }
BrTextEditorNavigator >> add: aCursor [
	"Add a given cursor at the position specified in the added cursor"
	self privateAssertPosition: aCursor position.
		
	cursorsToAdd add: aCursor
]

{ #category : #'api - configuration' }
BrTextEditorNavigator >> addAt: aTextPosition [
	"Add a cursor at a given text position"
	self privateAssertPosition: aTextPosition.
		
	cursorsToAdd add: (self privateNewCursorAt: aTextPosition)
]

{ #category : #'api - processing' }
BrTextEditorNavigator >> apply [
	self privateRemoveRegistered.
	self privateAddRegistered.
	self privateMoveRegistered
]

{ #category : #initialization }
BrTextEditorNavigator >> initialize [
	super initialize.

	cursorsToAdd := Set new.
	cursorsToRemove := Set new.
	cursorsToMove := Dictionary new
]

{ #category : #'api - configuration' }
BrTextEditorNavigator >> move: aCursor by: aDelta [
	"Move a given cursor by a provided delta"

	cursorsToMove at: aCursor put: aDelta
]

{ #category : #'api - configuration' }
BrTextEditorNavigator >> move: aCursor to: aTextPosition [
	"Move a given cursor to a provided position"
	self privateAssertPosition: aTextPosition.

	cursorsToMove at: aCursor put: (aTextPosition - aCursor position)
]

{ #category : #'api - configuration' }
BrTextEditorNavigator >> moveBy: aDelta [
	"Move all cursors by a given delta. The operation is only applied on existing cursor, not the ones that will be added"

	aDelta isZero
		ifTrue: [ ^ self ].

	self cursor do: [ :aCursor |
		cursorsToMove at: aCursor put: aDelta ]
]

{ #category : #'api - configuration' }
BrTextEditorNavigator >> moveLeft [
	"Move all cursors one to the left"
	
	self moveBy: -1
]

{ #category : #'api - configuration' }
BrTextEditorNavigator >> moveRight [
	"Move all cursors one to the right"
	
	self moveBy: 1
]

{ #category : #'api - configuration' }
BrTextEditorNavigator >> moveTo: aTextPosition [
	"Move all cursors to a given position (basically, remove all cursors except one)"
	self privateAssertPosition: aTextPosition.

	self removeAll.
	self addAt: aTextPosition
]

{ #category : #private }
BrTextEditorNavigator >> notifyCursorChangedAt: aTextIndex [
	| aCommand |

	aCommand := BrTextEditorCursorChangeCommand new
		position: aTextIndex.
	self editor enqueueCommand: aCommand
]

{ #category : #private }
BrTextEditorNavigator >> privateAddCursor: aNewCursor [

	self
		assert: [ self cursor allSatisfy: [ :aCursor | aCursor position ~= aNewCursor position ] ]
		description: [ 'Cursor must not exist at a given index' ].
	
	self cursor add: aNewCursor.
	self notifyCursorChangedAt: aNewCursor position
]

{ #category : #'private - operations' }
BrTextEditorNavigator >> privateAddRegistered [
	(cursorsToAdd asSortedCollection: [ :a :b | a position < b position])
		do: [ :aCursor | self privateAddCursor: aCursor ]
]

{ #category : #private }
BrTextEditorNavigator >> privateAssertPosition: aTextPosition [
	self
		assert: [ aTextPosition between: 0 and: self text size ]
		description: [ 'Cursor position must be within the interval [0.. text size]' ].
]

{ #category : #private }
BrTextEditorNavigator >> privateCursorAt: aTextPosition ifFound: aFoundBlock ifNone: aNoneBlock [
	self cursor
		detect: [ :aCursor | aCursor position = aTextPosition ]
		ifFound: aFoundBlock
		ifNone: aNoneBlock
]

{ #category : #private }
BrTextEditorNavigator >> privateMoveCursor: aCursor to: aTextIndex [
	| anOldPosition |
	self
		assert: [ aCursor position ~= aTextIndex ]
		description: [ 'Can not move a given cursor to the same location' ].
	
	anOldPosition := aCursor position.
	aCursor position: aTextIndex.

	self notifyCursorChangedAt: anOldPosition.
	self notifyCursorChangedAt: aTextIndex
]

{ #category : #'private - operations' }
BrTextEditorNavigator >> privateMoveRegistered [
	| theExistingCursors theRequestedCursors theMovableCursors theMergedCursors theRemovedCursor |

	theExistingCursors := (Array streamContents: [ :aStream |
		self cursor do: [ :aCursor | aStream nextPut: aCursor ] ]) asSet.
	
	theRequestedCursors := cursorsToMove keys asSet.
	
	"contains existing cursors that should be moved"
	theMovableCursors := theRequestedCursors intersection: theExistingCursors.

	"contains associations newPosition -> cursor, a subset of theMovableCursors"
	theMergedCursors := Dictionary new.

	theMovableCursors do: [ :aCursor |
		| aNewPosition |
		aNewPosition := aCursor position + (cursorsToMove at: aCursor).
		aNewPosition := self privateNormalizePosition: aNewPosition.
		theMergedCursors at: aNewPosition put: aCursor ].
	
	"cursors that should be removed due to merging of moved cursors"
	theRemovedCursor := theRequestedCursors difference: theMergedCursors values.
	
	"remove them now"
	theRemovedCursor do: [ :aCursor | self privateRemoveCursor: aCursor ].
	
	"cursors that we actually move"
	theMergedCursors keysAndValuesDo: [ :aNewPosition :aCursor | self privateMoveCursor: aCursor to: aNewPosition ]
]

{ #category : #private }
BrTextEditorNavigator >> privateNewCursorAt: aTextPosition [
	"Create a new cursor for a given text position"
	
	^ BrTextEditorSingleCursor new position: aTextPosition
]

{ #category : #private }
BrTextEditorNavigator >> privateNormalizePosition: aTextPosition [
	^ (aTextPosition max: 0) min: self text size
]

{ #category : #private }
BrTextEditorNavigator >> privateRemoveCursor: aCursorToRemove [
	self
		assert: [ self cursor anySatisfy: [ :aCursor | aCursor position = aCursorToRemove position ] ]
		description: [ 'Cursor must exist at a given index' ].

	self cursor remove: aCursorToRemove.
	self notifyCursorChangedAt: aCursorToRemove position
]

{ #category : #'private - operations' }
BrTextEditorNavigator >> privateRemoveRegistered [
	cursorsToRemove do: [ :aCursor | self privateRemoveCursor: aCursor ]
]

{ #category : #'api - configuration' }
BrTextEditorNavigator >> remove: aCursor [
	"Remove a given cursor"
	self privateAssertPosition: aCursor position.

	cursorsToRemove add: aCursor
]

{ #category : #'api - configuration' }
BrTextEditorNavigator >> removeAll [
	"Remove all cursors"
	
	self cursor do: [ :aCursor | cursorsToRemove add: aCursor ]
]

{ #category : #'api - configuration' }
BrTextEditorNavigator >> removeAt: aTextPosition [
	"Remove a cursor at a given text position"
	self privateAssertPosition: aTextPosition.

	cursorsToRemove add: (self privateNewCursorAt: aTextPosition)
]
