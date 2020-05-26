"
I add API that allows users to expand and collapse widgets that support it, for example ${class:BrTriangle}$.
"
Trait {
	#name : #TBrExpandable,
	#category : #'Brick-! Core - Support'
}

{ #category : #'api - expandable' }
TBrExpandable >> collapse [
	self dispatchEvent: BrExpansionWish collapse
]

{ #category : #'api - expandable' }
TBrExpandable >> expand [
	self dispatchEvent: BrExpansionWish expand
]

{ #category : #'api - expandable' }
TBrExpandable >> expanded: aBoolean [
	self dispatchEvent: (BrExpansionWish new expanded: aBoolean)
]

{ #category : #'api - expandable' }
TBrExpandable >> isCollapsed [
	^ self isExpanded not
]

{ #category : #'api - expandable' }
TBrExpandable >> isExpanded [
	^ (self viewModel request: BrExpansionStateRequest new oneWay) isExpanded
]

{ #category : #'api - expandable' }
TBrExpandable >> toggle [
	self dispatchEvent: BrExpansionToggleWish new
]
