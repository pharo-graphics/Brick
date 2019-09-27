"
I am a widget that represents a GT-Example.

I can be embedded in various contexts
"
Class {
	#name : #BrEntailment,
	#superclass : #BlElement,
	#category : #'Brick-Entailment - UI'
}

{ #category : #accessing }
BrEntailment >> conclusion: aConclusionStencil [
	"Define how conclusion should be visually represented.
	For example it can be an example's preview or a preview of a search result in spotter"

	self viewModel conclusion: aConclusionStencil
]

{ #category : #initialization }
BrEntailment >> initialize [
	super initialize.
	
	self viewModel: BrEntailmentModel new
]

{ #category : #accessing }
BrEntailment >> premise: aPremiseStencil [
	"Define how premise should be visually represented.
	For example is can be a source code or a list of items"

	self viewModel premise: aPremiseStencil
]
