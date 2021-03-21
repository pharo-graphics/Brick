Trait {
	#name : #TBrToggleOriginalEvent,
	#instVars : [
		'originalEvent'
	],
	#category : #'Brick-Toggle - Events'
}

{ #category : #'instance creation' }
TBrToggleOriginalEvent classSide >> toggle: aBrToggleModel originalEvent: anEvent [
	^ self new toggle: aBrToggleModel; originalEvent: anEvent
]

{ #category : #generated }
TBrToggleOriginalEvent >> modifiers [
	^ self originalEvent
		ifNotNil: [ :anEvent | anEvent modifiers ] 
		ifNil: [ BlKeyModifiers new ]
]

{ #category : #accessing }
TBrToggleOriginalEvent >> originalEvent [
	^ originalEvent
]

{ #category : #accessing }
TBrToggleOriginalEvent >> originalEvent: anObject [
	originalEvent := anObject
]
