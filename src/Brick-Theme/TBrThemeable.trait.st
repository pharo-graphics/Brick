Trait {
	#name : #TBrThemeable,
	#instVars : [
		'themeLook'
	],
	#category : #'Brick-Theme-Brick-Theme'
}

{ #category : #accessing }
TBrThemeable >> dispatchThemeChanged [
	super dispatchThemeChanged.
	themeLook ifNotNil: [ self removeLook: themeLook ].
	self look: (themeLook := self theme newLookFor: self)
]

{ #category : #accessing }
TBrThemeable >> onAddedToSceneGraph [
	self look
		ifNil: [ self look: (themeLook := self theme newLookFor: self) ].
	super onAddedToSceneGraph
]
