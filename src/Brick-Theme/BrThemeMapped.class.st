Class {
	#name : #BrThemeMapped,
	#superclass : #BrTheme,
	#instVars : [
		'map'
	],
	#category : #'Brick-Theme-Brick-Theme'
}

{ #category : #accessing }
BrThemeMapped >> at: aClass put: aSymbol [
	self
		assert: [ aSymbol isKeyword
				and: [ aSymbol numArgs = 1 and: [ self class canPerform: aSymbol ] ] ].
	map at: aClass put: aSymbol
]

{ #category : #accessing }
BrThemeMapped >> initialize [
	super initialize.
	map := IdentityDictionary new
]

{ #category : #accessing }
BrThemeMapped >> newLookFor: anElement [
	| cursor |
	cursor := anElement class.
	[ map
		at: cursor
		ifPresent: [ :s | ^ self perform: s with: anElement ].
	cursor := cursor superclass ] doWhileTrue: [ cursor isNotNil ].
	Error
		signal: 'Could not create look, no mapped class in inheritance tree found'
]
