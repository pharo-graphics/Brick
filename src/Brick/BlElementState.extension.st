Extension { #name : #BlElementState }

{ #category : #'*Brick' }
BlElementState class >> collapsed [
	^ BrCollapsedState uniqueInstance
]

{ #category : #'*Brick' }
BlElementState class >> expanded [
	^ BrExpandedState uniqueInstance
]
