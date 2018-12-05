Class {
	#name : #BrTextEditorLineSegmentPiece,
	#superclass : #Object,
	#instVars : [
		'segment',
		'text',
		'textStart',
		'textEnd',
		'currentCursors'
	],
	#category : #'Brick-Editor-Model - Segment-Text-Line'
}

{ #category : #comparing }
BrTextEditorLineSegmentPiece >> = anotherObject [
	self == anotherObject
		ifTrue: [ ^ true ].
	(anotherObject isKindOf: self class)
		ifFalse: [ ^ false ].
	
	^ anotherObject text = self text
]

{ #category : #'instance creation' }
BrTextEditorLineSegmentPiece >> createElement: anEditorElement [
	<return: #BlElement>

	^ self subclassResponsibility
]

{ #category : #'api - cursor' }
BrTextEditorLineSegmentPiece >> currentCursors [
	"Return a collection of known unique cursors within this segment piece.
	It is important to remember cursors in order to send fine grained events when cursor's location changes
	or new cursors are added"
	<return: #Set of: #BrTextEditorSingleCursor>
	
	^ currentCursors
]

{ #category : #accessing }
BrTextEditorLineSegmentPiece >> end [
	<return: #Number>

	^ textEnd
]

{ #category : #'api - cursor' }
BrTextEditorLineSegmentPiece >> findAddedCursors: theUpdatedCursors to: theCurrentCursors [
	"Find which cursors are new relative to the set of current cursors"
	<return: #Set of: #BrTextEditorSingleCursor>
	
	^ theUpdatedCursors difference: theCurrentCursors
]

{ #category : #'api - cursor' }
BrTextEditorLineSegmentPiece >> findRemovedCursors: theUpdatedCursors from: theCurrentCursors [
	"Find which cursors were removed relative from the set of current cursors"
	<return: #Set of: #BrTextEditorSingleCursor>
	
	^ theCurrentCursors difference: theUpdatedCursors
]

{ #category : #'api - cursor' }
BrTextEditorLineSegmentPiece >> globalCursorToLocal: aSingleCursor [
	"Convert a global cursor as specified in the editor to a local one"
	<return: #BrTextEditorSingleCursor>
	| aLocalCursor |
	
	aLocalCursor := aSingleCursor copy.
	aLocalCursor position: (self globalTextIndexToLocal: aSingleCursor position).
	
	^ aLocalCursor
]

{ #category : #'api - cursor' }
BrTextEditorLineSegmentPiece >> globalTextIndexToLocal: aTextIndex [
	"Convert global text index given in the text coordinates of the whole editor to a local index within this segment piece.
	This convertion is necessary due to the fact that text elements that represent every segment piece work with text in their own local system"
	<return: #Number>

	^ self text isEmpty
		ifTrue: [ 0 ]
		ifFalse: [ aTextIndex - self start ]
]

{ #category : #printing }
BrTextEditorLineSegmentPiece >> gtDisplayOn: aStream [
	self printOn: aStream
]

{ #category : #comparing }
BrTextEditorLineSegmentPiece >> hash [
	^ self class hash bitXor: self text hash
]

{ #category : #initialization }
BrTextEditorLineSegmentPiece >> initialize [
	super initialize.
	
	currentCursors := Set new
]

{ #category : #testing }
BrTextEditorLineSegmentPiece >> isEmpty [
	^ self text isEmpty
]

{ #category : #'api - cursor' }
BrTextEditorLineSegmentPiece >> moveCursorDown: aCursor pieceElement: aPieceElement of: aLineSegment in: anEditorElement [
	aPieceElement dispatchEvent:
		(BrTextEditorMoveCursorRequest new down
			editorElement: anEditorElement;
			hasFocus: anEditorElement isFocused;
			cursorPosition: (self globalTextIndexToLocal: aCursor position))
]

{ #category : #'api - cursor' }
BrTextEditorLineSegmentPiece >> moveCursorUp: aCursor pieceElement: aPieceElement of: aLineSegment in: anEditorElement [
	aPieceElement dispatchEvent:
		(BrTextEditorMoveCursorRequest new up
			editorElement: anEditorElement;
			hasFocus: anEditorElement isFocused;
			cursorPosition: (self globalTextIndexToLocal: aCursor position))
]

{ #category : #'cursor - hooks' }
BrTextEditorLineSegmentPiece >> onCursorAdded: aCursor to: aPieceElement in: anEditorElement [
	"Is sent when a cursor is added to a given piece element within provided editor element"

	aPieceElement dispatchEvent:
		(BrTextEditorShowCursorRequest new
			editorElement: anEditorElement;
			hasFocus: anEditorElement isFocused;
			cursorPosition: aCursor position)
]

{ #category : #'cursor - hooks' }
BrTextEditorLineSegmentPiece >> onCursorRemoved: aCursor from: aPieceElement in: anEditorElement [
	"Is sent when a cursor is removed from a given piece element within provided editor element"
	
	aPieceElement dispatchEvent:
		(BrTextEditorHideCursorRequest new
			editorElement: anEditorElement;
			cursorPosition: aCursor position)
]

{ #category : #printing }
BrTextEditorLineSegmentPiece >> printOn: aStream [
	self text printOn: aStream
]

{ #category : #accessing }
BrTextEditorLineSegmentPiece >> segment [
	^ segment
]

{ #category : #accessing }
BrTextEditorLineSegmentPiece >> segment: anObject [
	segment := anObject
]

{ #category : #accessing }
BrTextEditorLineSegmentPiece >> start [
	<return: #Number>

	^ textStart
]

{ #category : #accessing }
BrTextEditorLineSegmentPiece >> start: aStartIndex end: anEndIndex [
	textStart := aStartIndex.
	textEnd := anEndIndex.

	text start: ((aStartIndex + 1) min: anEndIndex) end: anEndIndex
]

{ #category : #accessing }
BrTextEditorLineSegmentPiece >> text [
	<return: #BlSubText>

	^ text
]

{ #category : #accessing }
BrTextEditorLineSegmentPiece >> text: aBrSubText [
	text := aBrSubText.
	
	textStart := text textOffset.
	textEnd := textStart + text size
]

{ #category : #updating }
BrTextEditorLineSegmentPiece >> updateCursor: aTextElement of: aLineSegment in: anEditorElement [
	| theUpdatedCursors theAddedCursors theRemovedCursors |

	"select text editor cursors that are currently within this segment piece and convert them to local ones"
	theUpdatedCursors := anEditorElement editor cursor allCursors
		select: [ :aCursor | aCursor insideSubText: self of: aLineSegment ]
		thenCollect: [ :aCursor | self globalCursorToLocal: aCursor ].

	theAddedCursors := self findAddedCursors: theUpdatedCursors to: self currentCursors.
	theRemovedCursors := self findRemovedCursors: theUpdatedCursors from: self currentCursors.

	"update current cursors"
	currentCursors := theUpdatedCursors.
	
	"tell to remove deleted cursors"
	theRemovedCursors do: [ :aCursor | self onCursorRemoved: aCursor from: aTextElement in: anEditorElement ].
	
	"tell to add new cursors"
	theAddedCursors do: [ :aCursor | self onCursorAdded: aCursor to: aTextElement in: anEditorElement ]
]

{ #category : #updating }
BrTextEditorLineSegmentPiece >> updateFocus: aBoolean of: aTextPieceElement in: anEditorElement [
	self subclassResponsibility
]

{ #category : #updating }
BrTextEditorLineSegmentPiece >> updateSelection: anElement of: aLineSegment in: anEditorElement [
	
	self subclassResponsibility
]

{ #category : #updating }
BrTextEditorLineSegmentPiece >> updateText: anElement of: aLineSegment in: anEditorElement [
	
	self subclassResponsibility
]
