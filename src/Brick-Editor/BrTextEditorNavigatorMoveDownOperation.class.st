Class {
	#name : #BrTextEditorNavigatorMoveDownOperation,
	#superclass : #BrTextEditorNavigatorOperation,
	#category : #'Brick-Editor-Model - Operators'
}

{ #category : #matching }
BrTextEditorNavigatorMoveDownOperation >> performOn: aNavigator [
	| aGlobalTextIndex |
	
	aGlobalTextIndex := aNavigator
		findTextIndexBelowCursor: self cursor
		ifAbsent: [
			"a cursor position is not found, maybe we are at the last line?"
			(aNavigator isCursorOnTheLastLine: self cursor)
				ifFalse: [ ^ self ]
				ifTrue: [
					| anEvent |
					anEvent := BrTextEditorCursorReachedBoundaryEvent new
						beBottom;
						cursor: self cursor.
					aNavigator editor dispatchEvent: anEvent.
					anEvent isConsumed
						"it was handled by somebody else, do nothing"
						ifTrue: [ ^ self ]
						ifFalse: [ aNavigator text size ] ] ].

	aNavigator
		privateRegisterForMove: self cursor
		by: (aGlobalTextIndex - self cursor position)
]
