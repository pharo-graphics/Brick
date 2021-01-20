Extension { #name : #BlElement }

{ #category : #'*Brick-Theme' }
BlElement >> theme [
	^ self userData
		at: #brickTheme
		ifAbsentPut: [ self themeStrategy themeFor: self ]
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
	self userData
		removeKey: #brickTheme ifAbsent: [ "noop" ];
		at: #brickThemeStrategy put: aStrategy
]
