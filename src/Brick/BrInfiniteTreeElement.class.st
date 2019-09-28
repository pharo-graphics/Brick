Class {
	#name : #BrInfiniteTreeElement,
	#superclass : #BlInfiniteElement,
	#category : #'Brick-Tree - Support'
}

{ #category : #initialization }
BrInfiniteTreeElement >> defaultDataSource [
	^ BrSimpleTreeDataSource new
]

{ #category : #initialization }
BrInfiniteTreeElement >> defaultLayout [
	^ BlInfiniteLinearLayout vertical
]
