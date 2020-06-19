Class {
	#name : #BrTextEditorUpdater,
	#superclass : #BrTextEditorOperator,
	#instVars : [
		'intervals',
		'shouldRedraw',
		'shouldRecreate'
	],
	#category : #'Brick-Editor-Model - Operators'
}

{ #category : #'api - configuration' }
BrTextEditorUpdater >> all [
	self from: 1 to: self text size
]

{ #category : #'api - configuration' }
BrTextEditorUpdater >> from: aFromTextIndex to: aToTextIndex [
	"Both from and to indices must be given in text coordinates"

	intervals add: (aFromTextIndex to: aToTextIndex)
]

{ #category : #initialization }
BrTextEditorUpdater >> initialize [
	super initialize.
	
	intervals := OrderedCollection new.
	shouldRecreate := true.
	shouldRedraw := true
]

{ #category : #'api - configuration' }
BrTextEditorUpdater >> redrawOnly [
	shouldRedraw := true.
	shouldRecreate := false
]

{ #category : #'api - processing' }
BrTextEditorUpdater >> update [
	ContextStackSignal emit.

	intervals do: [ :eachInterval |
		(shouldRecreate not and: [ shouldRedraw ])
			ifTrue: [
				| aCommand |
				aCommand := BrTextEditorInvalidateCommand new
					fromIndex: eachInterval first;
					toIndex: eachInterval last.
				self editor enqueueCommand: aCommand ].
		shouldRecreate
			ifTrue: [
				| aCommand |
				aCommand := BrTextEditorUpdateCommand new
					fromIndex: eachInterval first;
					toIndex: eachInterval last.
				self editor enqueueCommand: aCommand ] ]
]
