Extension { #name : #BlSceneInformingElement }

{ #category : #'*Brick' }
BlSceneInformingElement >> asVerticallyResizableDo: aBlock [
	(self childrenCount = 1 and: [ self child isVerticallyResizeableElement ])
		ifTrue: [ ^ self ].
	^ super asVerticallyResizableDo: aBlock
]
