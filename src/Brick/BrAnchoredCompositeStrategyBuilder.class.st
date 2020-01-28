Class {
	#name : #BrAnchoredCompositeStrategyBuilder,
	#superclass : #BrAnchoredStrategyBuilder,
	#instVars : [
		'strategies'
	],
	#category : #'Brick-Anchored - Support'
}

{ #category : #building }
BrAnchoredCompositeStrategyBuilder >> build [
	^ BrAnchoredCompositeStrategy strategies: strategies
]

{ #category : #initialization }
BrAnchoredCompositeStrategyBuilder >> initialize [
	super initialize.
	strategies := OrderedCollection new
]

{ #category : #accessing }
BrAnchoredCompositeStrategyBuilder >> single: aBlock [
	| builder |
	builder := BrAnchoredSingleStrategy builder.
	aBlock value: builder.
	strategies add: builder build
]
