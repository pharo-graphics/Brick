"
I am a ${class:BlInfiniteElement}$
I am a vertical infinite list.

"
Class {
	#name : #BrInfiniteListElement,
	#superclass : #BlInfiniteElement,
	#category : #'Brick-List - Support'
}

{ #category : #initialization }
BrInfiniteListElement >> defaultDataSource [
	^ BrSimpleListDataSource new
]

{ #category : #initialization }
BrInfiniteListElement >> defaultLayout [
	^ BlInfiniteLinearLayout vertical
]

{ #category : #initialization }
BrInfiniteListElement >> defaultMouseScrollEventHandler [
	^ BlInfiniteMouseScrollDirectionallyLimitedListener vertical
]
