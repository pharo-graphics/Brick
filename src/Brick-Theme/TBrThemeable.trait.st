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
	themeLook ifNotNil: [ self removeAptitude: themeLook ].
	self aptitude: (themeLook := self theme newLookFor: self)
]

{ #category : #accessing }
TBrThemeable >> onAddedToSceneGraph [
	self aptitude
		ifNil: [ self aptitude: (themeLook := self theme newLookFor: self) ].
	super onAddedToSceneGraph
]
