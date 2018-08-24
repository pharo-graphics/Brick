Class {
	#name : #BrStyleRelation,
	#superclass : #Object,
	#instVars : [
		'type'
	],
	#category : 'Brick-Style-CSS'
}

{ #category : #'as yet unclassified' }
BrStyleRelation class >> CHILD [
	^ BrStyleChildRelation
]

{ #category : #'as yet unclassified' }
BrStyleRelation class >> DESCENDANT [
	^ BrStyleDescendantRelation
]

{ #category : #'as yet unclassified' }
BrStyleRelation class >> isChild [
	^ false
]

{ #category : #'as yet unclassified' }
BrStyleRelation class >> isDescendant [
	^ false
]
