Class {
	#name : #BrPagerPageHolder,
	#superclass : #BlInfiniteHolder,
	#category : #'Brick-Pager - Support'
}

{ #category : #updating }
BrPagerPageHolder >> onRecycled [
	"Hook method for cleaning up resources when the page holder is recycled."
	
	itemElement := nil.
]

{ #category : #accessing }
BrPagerPageHolder >> pageElement: aPageElement [
	aPageElement removeFromParent.
	itemElement := aPageElement
]
