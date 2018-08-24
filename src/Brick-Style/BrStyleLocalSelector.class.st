Class {
	#name : #BrStyleLocalSelector,
	#superclass : #BrStyleSimpleSelector,
	#instVars : [
		'target'
	],
	#category : 'Brick-Style-Util'
}

{ #category : #'as yet unclassified' }
BrStyleLocalSelector class >> target: aNode [
	^ self new
		target: aNode;
		yourself
]

{ #category : #'as yet unclassified' }
BrStyleLocalSelector >> matchesPseudoClasseState: aPseudoClassStates [
	^ aPseudoClassStates includesAll: pseudoClasses
]

{ #category : #'as yet unclassified' }
BrStyleLocalSelector >> matchesStyleable: aStyleable [
	^ true
]

{ #category : #'as yet unclassified' }
BrStyleLocalSelector >> origin [
	^ BrStyleOrigin INLINE
]

{ #category : #accessing }
BrStyleLocalSelector >> target [
	^ target
]

{ #category : #accessing }
BrStyleLocalSelector >> target: anObject [
	target := anObject
]

{ #category : #'as yet unclassified' }
BrStyleLocalSelector >> updateSpecificity [
	idCount := 0.
	styleClassCount := self target styleClassProperty size.
	pseudoClassCount := self pseudoClasses size.
	nameCount := 0.
	specificity := idCount << 8 | (pseudoClassCount << 4) | styleClassCount | nameCount
]
