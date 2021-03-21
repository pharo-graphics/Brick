Class {
	#name : #BrListItemType,
	#superclass : #BlInfiniteItemType,
	#category : #'Brick-List - Support'
}

{ #category : #'instance creation' }
BrListItemType class >> default [
	^ self new
]

{ #category : #'instance creation' }
BrListItemType class >> named: aSymbol [
	^ BlInfiniteNamedItemType named: aSymbol
]
