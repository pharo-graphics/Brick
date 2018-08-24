Class {
	#name : #BrStyleDescendantRelation,
	#superclass : #BrStyleRelation,
	#category : 'Brick-Style-CSS'
}

{ #category : #'as yet unclassified' }
BrStyleDescendantRelation class >> isDescendant [
	^ true
]

{ #category : #printing }
BrStyleDescendantRelation class >> printOn: aStream [
	aStream nextPut:$>
]
