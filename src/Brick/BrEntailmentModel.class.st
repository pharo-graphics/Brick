Class {
	#name : #BrEntailmentModel,
	#superclass : #BrWidgetModel,
	#instVars : [
		'conclusionStencil',
		'premiseStencil'
	],
	#category : #'Brick-Entailment - Model'
}

{ #category : #accessing }
BrEntailmentModel >> conclusion: aConclusionStencil [

	self
		assert: [ aConclusionStencil isNotNil ]
		description: [ 'Conclusion must not be nil' ].

	conclusionStencil := aConclusionStencil asStencil.
	self notifyConclusionChanged: conclusionStencil
]

{ #category : #initialization }
BrEntailmentModel >> initialize [
	super initialize.

	premiseStencil := [ BlElement new ] asStencil.
	conclusionStencil := [ BlElement new ] asStencil
]

{ #category : #initialization }
BrEntailmentModel >> initializeListeners [
	super initializeListeners.

	self when: BrEntailmentPremiseRequest reply: [ :aResponse | aResponse stencil: premiseStencil ].
	self when: BrEntailmentConclusionRequest reply: [ :aResponse | aResponse stencil: conclusionStencil ]
]

{ #category : #notifying }
BrEntailmentModel >> notifyConclusionChanged: aConclusionStencil [
	self dispatchEvent: (BrEntailmentConclusionChanged new stencil: aConclusionStencil)
]

{ #category : #notifying }
BrEntailmentModel >> notifyPremiseChanged: anPremiseStencil [
	self dispatchEvent: (BrEntailmentPremiseChanged new stencil: anPremiseStencil)
]

{ #category : #accessing }
BrEntailmentModel >> premise: aPremiseStencil [
	self
		assert: [ aPremiseStencil isNotNil ]
		description: [ 'Premise must not be nil' ].

	premiseStencil := aPremiseStencil asStencil.
	self notifyPremiseChanged: premiseStencil
]
