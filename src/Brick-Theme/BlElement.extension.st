Extension { #name : #BlElement }

{ #category : #'*Brick-Theme' }
BlElement >> dispatchThemeChanged [
	self flag: 'the strategy decides where to dispatch to'.
	self userData removeKey: #brickTheme ifAbsent: [ "noop" ].
	self dispatchEvent: BrThemeChanged new.
	self children do: #dispatchThemeChanged
]

{ #category : #'*Brick-Theme' }
BlElement >> theme [
	^ self userData
		at: #brickTheme
		ifAbsentPut: [ self themeStrategy themeFor: self ]
]

{ #category : #'*Brick-Theme' }
BlElement >> theme: aTheme [
	self themeStrategy: (BrThemeExplicitStrategy theme: aTheme)
]

{ #category : #'*Brick-Theme' }
BlElement >> themeStrategy [
	^ self userData
		at: #brickThemeStrategy
		ifAbsentPut: [ self isRoot
				ifTrue: [ BrThemeGlobalStrategy instance ]
				ifFalse: [ BrThemeInheritStrategy instance ] ]
]

{ #category : #'*Brick-Theme' }
BlElement >> themeStrategy: aStrategy [
	self userData at: #brickThemeStrategy put: aStrategy.
	self dispatchThemeChanged
]
