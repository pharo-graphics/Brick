Trait {
	#name : #TBrExamplesUtility,
	#category : #'Brick-Examples-Utilities'
}

{ #category : #asserting }
TBrExamplesUtility >> assertEventTarget: anEventTarget hasEventHandlerOn: anEventClass [

	self assert: (self doesEventTarget: anEventTarget hasEventHandlerOn: anEventClass)
]

{ #category : #asserting }
TBrExamplesUtility >> assertEventTarget: anEventTarget hasNoEventHandlerOn: anEventClass [

	self assert: (self doesEventTarget: anEventTarget hasEventHandlerOn: anEventClass) not
]

{ #category : #asserting }
TBrExamplesUtility >> doesEventHandler: anEventHandler want: anEventClass [
	<return: #Boolean>

	((anEventHandler isKindOf: BlEventHandler) and: [ anEventHandler eventClass = anEventClass ])
		ifTrue: [ ^ true ].
		
	(anEventHandler isKindOf: BlEventForwarder)
		ifTrue: [ ^ self doesEventHandler: anEventHandler eventHandler want: anEventClass ].
		
	^ false
]

{ #category : #asserting }
TBrExamplesUtility >> doesEventTarget: anEventTarget hasEventHandlerOn: anEventClass [
	<return: #Boolean>

	^ anEventTarget eventDispatcher hasEventHandlerSuchThat: [ :eachEventHandler |
		self doesEventHandler: eachEventHandler want: anEventClass ]
]
