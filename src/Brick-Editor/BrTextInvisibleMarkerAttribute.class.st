"
I am a special marker attribute that is intended to be used together with ${method:BlText>>#findAttribute:indicesDo:}$ to dynamically find text interval indices
"
Class {
	#name : #BrTextInvisibleMarkerAttribute,
	#superclass : #BlTextAttribute,
	#category : #'Brick-Editor-Text-Attributes'
}

{ #category : #comparing }
BrTextInvisibleMarkerAttribute >> type [
	^ self
]
