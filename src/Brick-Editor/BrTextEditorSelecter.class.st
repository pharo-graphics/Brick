"
When in ""cursor update mode"" I place cursors at the end of each selection
"
Class {
	#name : #BrTextEditorSelecter,
	#superclass : #BrTextEditorOperator,
	#instVars : [
		'selection',
		'shouldUpdateCursor',
		'shouldDeselectExisting'
	],
	#category : #'Brick-Editor-Model - Operators'
}

{ #category : #'api - configuration' }
BrTextEditorSelecter >> all [
	"Select the whole text"
	
	self
		from: 0
		to: self text size
]

{ #category : #'api - configuration' }
BrTextEditorSelecter >> from: aFromIndex to: aToIndex [
	selection select: aFromIndex to: aToIndex
]

{ #category : #initialization }
BrTextEditorSelecter >> initialize [
	super initialize.

	selection := BlCompositeSelection new.
	shouldUpdateCursor := true.
	shouldDeselectExisting := false
]

{ #category : #'api - configuration' }
BrTextEditorSelecter >> overwrite [
	"Deselect any selections if they exist and overwrite with the new selection"
	
	shouldDeselectExisting := true
]

{ #category : #private }
BrTextEditorSelecter >> privateDeselectExisting [
	self editor deselecter all deselect
]

{ #category : #private }
BrTextEditorSelecter >> privateSelect: aFromTextIndex to: aToTextIndex [
	"Select text within an interval defined by provided from and to indices without any other side effects.
	Note:
		- I don't change cursor position.
		- I request segments update"
	| aCommand |
	
	aCommand := BrTextEditorSelectCommand new
		fromIndex: aFromTextIndex;
		toIndex: aToTextIndex.
	self editor enqueueCommand: aCommand
]

{ #category : #'api - processing' }
BrTextEditorSelecter >> select [

	shouldDeselectExisting
		ifTrue: [ self privateDeselectExisting ].

	selection do: [ :aMonotoneSelection | self privateSelect: aMonotoneSelection from to: aMonotoneSelection to ].

	shouldUpdateCursor
		ifTrue: [ self updateCursors ]
]

{ #category : #private }
BrTextEditorSelecter >> updateCursors [
	| aNavigator |
	
	aNavigator := self editor navigator.
	aNavigator removeAll.
	self selection do: [ :aMonotoneSelection | aNavigator addAt: aMonotoneSelection to ].
	aNavigator apply
]

{ #category : #'api - configuration' }
BrTextEditorSelecter >> withoutCursorUpdate [
	shouldUpdateCursor := false
]

{ #category : #'api - configuration' }
BrTextEditorSelecter >> wordAt: aTextIndex [
	"Select a word or a whitespace at a given text index"
	| aTextIterator hasWordToTheLeft hasWordToTheRight shouldBeWord aWordStart aWordEnd  |
	
	aTextIterator := self text iterator skip: aTextIndex.
	
	hasWordToTheLeft := aTextIterator hasPrevious and: [ aTextIterator peer isSeparator not ].
	hasWordToTheRight := aTextIterator hasNext and: [ aTextIterator peek isSeparator not ].
	shouldBeWord := hasWordToTheLeft or: hasWordToTheRight.
	
	aWordStart := aTextIndex.
	aWordEnd := aTextIndex.
	
	aTextIterator hasNext ifTrue: [
		aTextIterator
			nextSegment: [ :eachCharacter | eachCharacter isSeparator not ]
			indicesDo: [ :aStart :anEnd :isWord |
				isWord = shouldBeWord
					ifTrue: [ aWordEnd := anEnd ] ] ].
	
	aTextIterator := self text iterator skip: aTextIndex.
	aTextIterator hasPrevious ifTrue: [
		aTextIterator
			previousSegment: [ :eachCharacter | eachCharacter isSeparator not ]
			indicesDo: [ :aStart :anEnd :isWord |
				isWord = shouldBeWord
					ifTrue: [ aWordStart := aStart ] ] ].
			
	selection select: aWordStart to: aWordEnd
]
