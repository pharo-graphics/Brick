Extension { #name : #TBlElementCommonStyles }

{ #category : #'*Brick' }
TBlElementCommonStyles >> collapsed [
	^ self styleFor: BlElementState collapsed
]

{ #category : #'*Brick' }
TBlElementCommonStyles >> collapsed: aBlock [
	aBlock value: self collapsed
]

{ #category : #'*Brick' }
TBlElementCommonStyles >> expanded [
	^ self styleFor: BlElementState expanded
]

{ #category : #'*Brick' }
TBlElementCommonStyles >> expanded: aBlock [
	aBlock value: self expanded
]
