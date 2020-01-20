Class {
	#name : #BrProgress,
	#superclass : #BlElement,
	#instVars : [
		'labelModel'
	],
	#category : #'Brick-Progress - UI'
}

{ #category : #accessing }
BrProgress >> amount [
	^ self viewModel amount
]

{ #category : #accessing }
BrProgress >> amount: anAmountNumber total: aTotalNumber [
	^ self viewModel amount: anAmountNumber total: aTotalNumber
]

{ #category : #enumerating }
BrProgress >> barDo: anOneArgBlock [
	anOneArgBlock value: (self childNamed: BrProgressLook widgetProgressName)
]

{ #category : #accessing }
BrProgress >> fraction [
	^ self viewModel fraction
]

{ #category : #accessing }
BrProgress >> fraction: aNumber [
	^ self viewModel fraction: aNumber
]

{ #category : #initialization }
BrProgress >> initialize [
	super initialize.
	self viewModel: (BrProgressModel new
		+ (labelModel := BrLabelModel new))
]

{ #category : #accessing }
BrProgress >> label [
	<return: #BlText>

	^ labelModel text
]

{ #category : #accessing }
BrProgress >> label: aStringOrText [
	labelModel text: aStringOrText
]

{ #category : #accessing }
BrProgress >> percentage [
	^ self viewModel percentage
]

{ #category : #accessing }
BrProgress >> percentage: aNumber [
	^ self viewModel percentage: aNumber
]

{ #category : #accessing }
BrProgress >> total [
	^ self viewModel total
]
