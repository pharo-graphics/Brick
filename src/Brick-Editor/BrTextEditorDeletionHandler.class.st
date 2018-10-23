"
I handle keystroke-based deletions and must be added to the editor element.

Note: Ideally deletion (#delete and #backspace) should be added as a shortcut to the text editor, however since Morphic does not differenciate between delete and backspace keydown events we have to use this ""hacky"" way of handling keystroke events instead
"
Class {
	#name : #BrTextEditorDeletionHandler,
	#superclass : #BlElementEventListener,
	#category : #'Brick-Editor-UI - Handlers'
}

{ #category : #'api - deletion' }
BrTextEditorDeletionHandler >> deleteNextAtCursorIn: anEditor [
	"Delete currently selected text and delete a character to the right from the current cursor position"
	
	anEditor deleter
		selected;
		oneAfterCursor;
		delete
]

{ #category : #'api - deletion' }
BrTextEditorDeletionHandler >> deletePreviousAtCursorIn: anEditor [
	"Delete currently selected text and delete a character to the left from the current cursor position"

	anEditor deleter
		selected;
		oneBeforeCursor;
		delete
]

{ #category : #'keyboard handlers' }
BrTextEditorDeletionHandler >> keystrokeEvent: anEvent [
	| aCharacter |

	aCharacter := anEvent char.
	
	(aCharacter ~= Character backspace and: [ aCharacter ~= Character delete ])
		ifTrue: [ ^ self ].

	anEvent consumed: true.

	aCharacter = Character backspace
		ifTrue: [ self deletePreviousAtCursorIn: anEvent currentTarget editor ].
		
	aCharacter = Character delete
		ifTrue: [ self deleteNextAtCursorIn: anEvent currentTarget editor ]
]
