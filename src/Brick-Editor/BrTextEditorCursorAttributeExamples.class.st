Class {
	#name : #BrTextEditorCursorAttributeExamples,
	#superclass : #BrTextEditorAdornmentsExamples,
	#category : #'Brick-Editor-Documentation'
}

{ #category : #public }
BrTextEditorCursorAttributeExamples >> simple [
	<gtExample>
	| text |
	text := 'Hello World
- click here
- second item' asRopedText.

	(text from: 13 to: 24) attribute: (BrTextCursorAttribute new
		enterAction: [ :aTextEditor |
			(aTextEditor text from: 13 to: 24) foreground: Color blue.
			aTextEditor invalidate: 13 to: 24 ];
		leaveAction: [ :aTextEditor |
			(aTextEditor text from: 13 to: 24) foreground: Color black.
			aTextEditor invalidate: 13 to: 24 ]).

	^ text
]
