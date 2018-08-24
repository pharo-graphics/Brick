Class {
	#name : #BrStylePropertyDeclaration,
	#superclass : #BrStyleDeclaration,
	#instVars : [
		'value'
	],
	#category : 'Brick-Style-CSS'
}

{ #category : #'as yet unclassified' }
BrStylePropertyDeclaration >> = aDeclaration [
	^ super = aDeclaration and: [ self value = aDeclaration value ]
]

{ #category : #'adding/removing' }
BrStylePropertyDeclaration >> addTo: aRule [
	aRule declarations add: self
]

{ #category : #printing }
BrStylePropertyDeclaration >> printOn: aStream [
	aStream
		nextPutAll: self property;
		nextPutAll: ': ';
		nextPutAll: self value asString.
	self isImportant
		ifTrue: [ aStream nextPutAll: '!important' ]
]

{ #category : #accessing }
BrStylePropertyDeclaration >> value [
	^ value
]

{ #category : #accessing }
BrStylePropertyDeclaration >> value: anObject [
	value := anObject
]
