Class {
	#name : #BrThemeGlobalStrategy,
	#superclass : #BrThemeStrategy,
	#classInstVars : [
		'instance'
	],
	#category : #'Brick-Theme-Brick-Theme'
}

{ #category : #'instance creation' }
BrThemeGlobalStrategy class >> instance [
	^ instance ifNil: [ instance := self basicNew initialize ]
]

{ #category : #'instance creation' }
BrThemeGlobalStrategy class >> new [
	Error signal: 'Cannot instantiate singleton, use #instance instead'
]

{ #category : #accessing }
BrThemeGlobalStrategy >> themeFor: anElement [
	^ BrTheme global
]
