Class {
	#name : #BrTextEditorSignalLogger,
	#superclass : #MemoryLogger,
	#category : #'Brick-Editor-Signals'
}

{ #category : #initialization }
BrTextEditorSignalLogger >> interestingSignals [
	^ { BrTextEditorSignal . BrTextEditorHolderCommand }
]

{ #category : #accessing }
BrTextEditorSignalLogger >> nextPut: aSignal [
	(self interestingSignals anySatisfy: [ :eachSignalClass |
		aSignal class == eachSignalClass or: [ aSignal class inheritsFrom: eachSignalClass ] ])
			ifFalse: [ ^ self ].

	super nextPut: aSignal
]
