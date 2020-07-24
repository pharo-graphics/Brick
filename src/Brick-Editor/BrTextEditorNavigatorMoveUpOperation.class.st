Class {
	#name : #BrTextEditorNavigatorMoveUpOperation,
	#superclass : #BrTextEditorNavigatorOperation,
	#category : #'Brick-Editor-Model - Operators'
}

{ #category : #matching }
BrTextEditorNavigatorMoveUpOperation >> performOn: aNavigator [
	| aGlobalTextIndex |
	
	aGlobalTextIndex := aNavigator
		findTextIndexAboveCursor: self cursor
		ifAbsent: [
			"a cursor position is not found, maybe we are at the first line?"
			(aNavigator findLineStartBefore: (self cursor position max: aNavigator text isNotEmpty asBit)) isZero
				ifFalse: [ ^ self ]
				ifTrue: [
					| anEvent |
					anEvent := BrTextEditorCursorReachedBoundaryEvent new
						beTop;
						cursor: self cursor.
					aNavigator editor dispatchEvent: anEvent.
					anEvent isConsumed
						"it was handled by somebody else, do nothing"
						ifTrue: [ ^ self ]
						ifFalse: [ 0 ] ] ].

	aNavigator
		privateRegisterForMove: self cursor
		by: (aGlobalTextIndex - self cursor position)
]
