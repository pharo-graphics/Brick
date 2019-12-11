Trait {
	#name : #TBrTextEditorTextualPiece,
	#instVars : [
		'text',
		'textStart',
		'textEnd'
	],
	#category : #'Brick-Editor-Model - Segment-Text'
}

{ #category : #'text - testing' }
TBrTextEditorTextualPiece >> isEmpty [
	"Return true if my text is empty, false otherwise"
	<return: #Boolean>

	^ self textLength isZero
]

{ #category : #'text - modifications' }
TBrTextEditorTextualPiece >> scopeText: aStartIndex end: anEndIndex [
	self start: aStartIndex end: anEndIndex
]

{ #category : #'private - text' }
TBrTextEditorTextualPiece >> start: aStartIndex end: anEndIndex [
	"aStartIndex and anEndIndex are given in cursor coordinates"
	| aDelta |
	
	aDelta := (text textOffset - textStart) max: 0.
	
	self
		assert: [ aStartIndex <= anEndIndex ]
		description: [ 'Start must be less than end' ].

	text
		start: (aStartIndex + 1) + aDelta
		end: anEndIndex + aDelta.

	"text start and end are given in cursor coordinates of the text editor which may be opened on a subtext"
	textStart := aStartIndex.
	textEnd := anEndIndex
]

{ #category : #'text - accessing' }
TBrTextEditorTextualPiece >> text [
	"Return a sub-text that I represent"
	<return: #BlSubText>

	^ text
]

{ #category : #'text - accessing' }
TBrTextEditorTextualPiece >> textEnd [
	"Return an index of the last character of a subtext that I represent"
	<return: #Number>
	
	^ textEnd
]

{ #category : #'text - accessing' }
TBrTextEditorTextualPiece >> textInterval [
	"Return both #textStart and #textEnd in a form of Interval"
	<return: #Interval>
	
	^ self textStart to: self textEnd
]

{ #category : #'text - accessing' }
TBrTextEditorTextualPiece >> textLength [
	"Return an index of the last character of a subtext that I represent"
	<return: #Number>
	
	^ self textEnd - self textStart
]

{ #category : #'text - accessing' }
TBrTextEditorTextualPiece >> textStart [
	"Return an index of the first character of a subtext that I represent"
	<return: #Number>
	
	^ textStart
]
