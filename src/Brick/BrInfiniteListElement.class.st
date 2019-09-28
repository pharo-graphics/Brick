Class {
	#name : #BrInfiniteListElement,
	#superclass : #BlInfiniteElement,
	#category : 'Brick-List - Support'
}

{ #category : #initialization }
BrInfiniteListElement >> defaultDataSource [
	^ BrSimpleListDataSource new
]

{ #category : #initialization }
BrInfiniteListElement >> defaultLayout [
	^ BlInfiniteLinearLayout vertical
]
