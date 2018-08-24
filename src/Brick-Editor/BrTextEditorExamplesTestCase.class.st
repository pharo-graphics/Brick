"
I run all gt-examples as automatic tests
"
Class {
	#name : #BrTextEditorExamplesTestCase,
	#superclass : #GtExampleTestCase,
	#category : 'Brick-Editor-Examples'
}

{ #category : #configuration }
BrTextEditorExamplesTestCase >> packageNames [
	^ { 'Brick-Editor' }
]

{ #category : #private }
BrTextEditorExamplesTestCase >> runExample: example [
	" this is not the testing tool we have in mind, but a temporary solution to integrate examples into the currently existing testing tools "
	| exampleResult |
	
	NonInteractiveTranscript stdout show: (example methodClass name, '>>#', example selector); cr.
	
	exampleResult := super runExample: example.	
	(exampleResult returnValue isKindOf: BlElement) ifFalse: [ ^ self ].
	self testInSpace: exampleResult returnValue.
	^ exampleResult
]

{ #category : #tests }
BrTextEditorExamplesTestCase >> testInSpace: anElement [
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
]
