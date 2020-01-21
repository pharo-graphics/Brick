Class {
	#name : #BrProgressWithLabelModel,
	#superclass : #BrProgressModel,
	#instVars : [
		'labelStencil',
		'labelModel'
	],
	#category : #'Brick-Progress - Model'
}

{ #category : #initialization }
BrProgressWithLabelModel >> defaultLabelStencil [
	^ BrProgressFixedLabelStencil new
]

{ #category : #accessing }
BrProgressWithLabelModel >> fixedLabel: aString [
	"Set fixed progress label"
	labelStencil := BrProgressFixedLabelStencil new label: aString.
	self updateLabel.
]

{ #category : #initialization }
BrProgressWithLabelModel >> initialize [
	super initialize.
	labelModel := BrLabelModel new.
	self add: labelModel.
	self labelStencil: self defaultLabelStencil.
	
]

{ #category : #accessing }
BrProgressWithLabelModel >> label [
	<return: #BlRopedText>
	^ labelStencil 
		amount: self amount; 
		total: self total;
		create
]

{ #category : #accessing }
BrProgressWithLabelModel >> labelStencil [
	<return: #BrProgressLabelStencil>
	^ labelStencil
]

{ #category : #accessing }
BrProgressWithLabelModel >> labelStencil: aBrProgressLabelStencil [
	labelStencil := aBrProgressLabelStencil.
	self updateLabel.
]

{ #category : #hooks }
BrProgressWithLabelModel >> onProgressChanged: anAmountNumber total: aTotalNumber [
	super onProgressChanged: anAmountNumber total: aTotalNumber.
	self updateLabel.
]

{ #category : #accessing }
BrProgressWithLabelModel >> patternLabel: aString [
	"The input string can include two place holders called {1} and {2},
	where {1} is transfered amount, and {2} is total to transfer.
	Example: 'Out of {2}%, {1}% transfered...'"
	labelStencil := BrProgressExactProgressLabelStencil new pattern: aString.
	self updateLabel.
]

{ #category : #updating }
BrProgressWithLabelModel >> updateLabel [
	labelModel text: self label
]
