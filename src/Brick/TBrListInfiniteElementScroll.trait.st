Trait {
	#name : #TBrListInfiniteElementScroll,
	#category : #'Brick-List - Look'
}

{ #category : #initialization }
TBrListInfiniteElementScroll >> initializeScrollListeners [
	self
		when: BrScrollByWish
		do: [ :aWish | self onScrollBy: aWish ].
	
	self
		when: BrScrollToItemWish
		do: [ :aWish | self onScrollToItem: aWish ]
]

{ #category : #accessing }
TBrListInfiniteElementScroll >> listElement [
	self explicitRequirement
]

{ #category : #scrolling }
TBrListInfiniteElementScroll >> onScrollBy: aWish [
	aWish smooth
		ifTrue: [ self listElement smoothScrollBy: aWish delta ]
		ifFalse: [ self listElement scrollBy: aWish delta ]
]

{ #category : #scrolling }
TBrListInfiniteElementScroll >> onScrollToItem: aWish [
	aWish smooth
		ifTrue: [ self listElement smoothScrollToPosition: aWish index ]
		ifFalse: [ self listElement scrollToPosition: aWish index ]
]
