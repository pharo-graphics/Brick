Class {
	#name : #BrStyleChildRelation,
	#superclass : #BrStyleRelation,
	#category : 'Brick-Style-CSS'
}

{ #category : #'as yet unclassified' }
BrStyleChildRelation class >> isChild [
	^ true
]

{ #category : #printing }
BrStyleChildRelation class >> printOn: aStream [
	aStream space
]
