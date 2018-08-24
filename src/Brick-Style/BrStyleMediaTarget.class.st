Class {
	#name : #BrStyleMediaTarget,
	#superclass : #Object,
	#category : 'Brick-Style-CSS'
}

{ #category : #'as yet unclassified' }
BrStyleMediaTarget class >> defaultOn: aTarget [
	^ aTarget
]

{ #category : #'as yet unclassified' }
BrStyleMediaTarget class >> screenOn: aTarget [
	^ aTarget space root
]
