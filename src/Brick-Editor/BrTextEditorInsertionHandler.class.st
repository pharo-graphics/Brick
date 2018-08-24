"
I handle keystroke-based insertions and must be added to the editor element
"
Class {
	#name : #BrTextEditorInsertionHandler,
	#superclass : #BlElementEventListener,
	#category : 'Brick-Editor-UI-Handlers'
}

{ #category : #'api - insertion' }
BrTextEditorInsertionHandler >> insert: aString atCursorIn: anEditor [
	anEditor inserter
		atCursor;
		string: aString;
		insert
]

{ #category : #'keyboard handlers' }
BrTextEditorInsertionHandler >> keystrokeEvent: anEvent [
	| aCharacter |

	aCharacter := anEvent char.
	
	((Unicode isPrintable: aCharacter) or: [ aCharacter isSeparator ])
		ifFalse: [ ^ self ].

	anEvent consumed: true.

	self
		insert: anEvent char asString
		atCursorIn: anEvent currentTarget editor
]
