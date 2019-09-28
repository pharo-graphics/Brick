Class {
	#name : #BrInfinitePagerElement,
	#superclass : #BlInfiniteElement,
	#category : 'Brick-Pager - Support'
}

{ #category : #initialization }
BrInfinitePagerElement >> defaultDataSource [
	^ BrPagerDataSource new
]

{ #category : #initialization }
BrInfinitePagerElement >> defaultLayout [
	^ BlInfiniteLinearLayout horizontal
]
