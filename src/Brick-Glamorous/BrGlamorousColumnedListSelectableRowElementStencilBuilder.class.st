Class {
	#name : #BrGlamorousColumnedListSelectableRowElementStencilBuilder,
	#superclass : #BrColumnedListRowElementStencilBuilder,
	#category : #'Brick-Glamorous-List, Tree'
}

{ #category : #'api - instantiation' }
BrGlamorousColumnedListSelectableRowElementStencilBuilder >> buildDefault [
	^ super buildDefault
		addLook: BrGlamorousListItemLook
]
