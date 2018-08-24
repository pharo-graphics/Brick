Class {
	#name : #BrStyleDeclaration,
	#superclass : #Object,
	#instVars : [
		'property',
		'important',
		'rule'
	],
	#category : 'Brick-Style-CSS'
}

{ #category : #'as yet unclassified' }
BrStyleDeclaration >> = aDeclaration [
	^ self property = aDeclaration property
]

{ #category : #'adding/removing' }
BrStyleDeclaration >> addTo: aRule [
	self subclassResponsibility 
]

{ #category : #accessing }
BrStyleDeclaration >> important [
	^ important
]

{ #category : #accessing }
BrStyleDeclaration >> important: anObject [
	important := anObject
]

{ #category : #'initialize-release' }
BrStyleDeclaration >> initialize [
	super initialize.
	important := false
]

{ #category : #testing }
BrStyleDeclaration >> isImportant [
	^ important
]

{ #category : #accessing }
BrStyleDeclaration >> property [
	^ property
]

{ #category : #accessing }
BrStyleDeclaration >> property: anObject [
	property := anObject
]

{ #category : #accessing }
BrStyleDeclaration >> rule [
	^ rule
]

{ #category : #accessing }
BrStyleDeclaration >> rule: anObject [
	rule := anObject
]
