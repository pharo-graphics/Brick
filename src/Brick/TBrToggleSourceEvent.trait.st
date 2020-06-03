Trait {
	#name : #TBrToggleSourceEvent,
	#instVars : [
		'source'
	],
	#category : #'Brick-Toggle - Events'
}

{ #category : #'instance creation' }
TBrToggleSourceEvent classSide >> toggle: aBrToggleModel source: anEvent [
	^ self new toggle: aBrToggleModel; source: anEvent
]

{ #category : #generated }
TBrToggleSourceEvent >> modifiers [
	^ self source
		ifNotNil: [ :anEvent | anEvent modifiers ] 
		ifNil: [ BlKeyModifiers new ]
]

{ #category : #accessing }
TBrToggleSourceEvent >> source [
	^ source
]

{ #category : #accessing }
TBrToggleSourceEvent >> source: anObject [
	source := anObject
]
