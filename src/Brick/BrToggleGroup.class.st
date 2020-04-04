Class {
	#name : #BrToggleGroup,
	#superclass : #BlElement,
	#category : #'Brick-Toggle - UI'
}

{ #category : #'adding / removing' }
BrToggleGroup >> addToggle: aToggle [
	self viewModel addToggle: aToggle viewModel.
	self addChild: aToggle
]

{ #category : #'adding / removing' }
BrToggleGroup >> addToggles: aCollectionOfToggles [
	aCollectionOfToggles do: [ :aToggle | self addToggle: aToggle ]
]

{ #category : #initialization }
BrToggleGroup >> initialize [
	super initialize.

	self viewModel: BrToggleGroupModel new
]

{ #category : #'adding / removing' }
BrToggleGroup >> removeToggles [
	self viewModel removeToggles.
	self removeChildren
]
