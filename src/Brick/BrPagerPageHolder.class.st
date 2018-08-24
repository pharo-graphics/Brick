Class {
	#name : #BrPagerPageHolder,
	#superclass : #BlInfiniteHolder,
	#category : 'Brick-Pager - Support'
}

{ #category : #accessing }
BrPagerPageHolder >> pageElement: aPageElement [
	aPageElement removeFromParent.
	itemElement := aPageElement
]
