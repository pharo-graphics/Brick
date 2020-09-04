Class {
	#name : #BrTextCursorAttributeExamples,
	#superclass : #BrTextEditorAdornmentsExamples,
	#category : #'Brick-Editor-Examples-Documentation'
}

{ #category : #public }
BrTextCursorAttributeExamples >> changingForeground [
	<gtExample>
	| text |
	text := 'Hello World
- click here
- second item' asRopedText fontSize: 20.

	(text from: 13 to: 24) attribute: (BrTextCursorAttribute new
		enterAction: [ :aTextEditor :anEvent :aFromIndex :aToIndex |
			(aTextEditor text from: aFromIndex to: aToIndex) foreground: Color red ];
		leaveAction: [ :aTextEditor :anEvent :aFromIndex :aToIndex |
			(aTextEditor text from: aFromIndex to: aToIndex) foreground: Color blue ]).

	^ text
]
