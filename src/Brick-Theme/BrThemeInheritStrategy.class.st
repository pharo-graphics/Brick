Class {
	#name : #BrThemeInheritStrategy,
	#superclass : #BrThemeStrategy,
	#classInstVars : [
		'instance'
	],
	#category : #'Brick-Theme-Brick-Theme'
}

{ #category : #'instance creation' }
BrThemeInheritStrategy class >> instance [
	^ instance ifNil: [ instance := self basicNew initialize ]
]

{ #category : #'instance creation' }
BrThemeInheritStrategy class >> new [
	Error signal: 'Cannot instantiate singleton, use #instance instead'
]

{ #category : #accessing }
BrThemeInheritStrategy >> themeFor: anElement [
	^ anElement parent
		ifNil: [ Error signal: 'element has not parent, cannot delegate theme' ]
		ifNotNil: [ :e | e theme ]
]
