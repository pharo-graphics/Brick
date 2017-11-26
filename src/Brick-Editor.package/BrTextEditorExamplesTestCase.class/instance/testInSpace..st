tests
testInSpace: anElement
	| aSpace aTopMostElement semaphore error |
	
	aTopMostElement := anElement topMostParent.
	aTopMostElement isAttachedToSceneGraph
		ifTrue: [ ^ self ].

	BlUniverse reset.

	semaphore := Semaphore new.

	aSpace := BlTestAutoClosingSpace new.
	aSpace root addChild: aTopMostElement.
	
	aSpace
		addEventHandlerOn: BlSpaceClosedEvent
		do: [ semaphore signal ].
	aSpace
		addEventHandlerOn: BlSpaceErrorEvent
		do: [ :anEvent |
			error := anEvent error.
			semaphore signal ].
	aSpace show.

	semaphore wait.
	aTopMostElement removeFromParent.
	
	error
		ifNotNil: [ self classForTestResult signalErrorWith: error messageText ]