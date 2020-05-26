Class {
	#name : #BrEmptyColumnedTreeRowStencilBuilder,
	#superclass : #BrTreeRowStencilBuilder,
	#instVars : [
		'selectionColor',
		'cellSpacing',
		'indentation',
		'padding',
		'selectableBlock'
	],
	#category : #'Brick-Tree - Stencil'
}

{ #category : #'api - instantiation' }
BrEmptyColumnedTreeRowStencilBuilder >> buildDefault [
	<return: #BrStencil or: #BlElement>
	| aContainer aNode aRowIndex anExpander aTreeElement |
	
	aNode := self treeNode.
	aRowIndex := self rowIndex.
	aTreeElement := self treeElement.

	aContainer := BlElement new.
	
	(selectableBlock valueWithEnoughArguments: { aNode . aRowIndex . aTreeElement })
		ifTrue: [ self makeSelectableContainer: aContainer forTreeElement: aTreeElement atIndex: aRowIndex ].
		
	aContainer constraintsDo: [ :c |
		c horizontal matchParent.
		c vertical fitContent ].
	aContainer layout: (BlLinearLayout horizontal alignCenterLeft cellSpacing: self cellSpacing).
	aContainer padding: self padding.

	anExpander := BlElement new.
	anExpander padding: (BlInsets left: aNode depth * self indentation).
	anExpander constraintsDo: [ :c |
		c horizontal matchParent.
		c vertical fitContent ].
	anExpander layout: (BlLinearLayout horizontal alignCenterLeft cellSpacing: self cellSpacing).
	self fillExpander: anExpander for: aNode.
		
	aContainer addChild: anExpander as: #expander.

	^ aContainer
]

{ #category : #accessing }
BrEmptyColumnedTreeRowStencilBuilder >> cellSpacing [
	^ cellSpacing
]

{ #category : #accessing }
BrEmptyColumnedTreeRowStencilBuilder >> cellSpacing: aNumber [
	cellSpacing := aNumber
]

{ #category : #private }
BrEmptyColumnedTreeRowStencilBuilder >> fillExpander: anExpander for: aNode [
	"subclasses may add expander content"
]

{ #category : #accessing }
BrEmptyColumnedTreeRowStencilBuilder >> indentation [
	^ indentation
]

{ #category : #accessing }
BrEmptyColumnedTreeRowStencilBuilder >> indentation: aNumber [
	indentation := aNumber
]

{ #category : #initialization }
BrEmptyColumnedTreeRowStencilBuilder >> initialize [
	super initialize.
	
	cellSpacing := 0.
	padding := BlInsets empty.
	indentation := 15.
	selectableBlock := [ :eachNode :eachIndex :aTree | true ].
	selectionColor := BrGlamorousColors selectedListItemColor.
]

{ #category : #private }
BrEmptyColumnedTreeRowStencilBuilder >> makeSelectableContainer: aContainer forTreeElement: aTreeElement atIndex: aRowIndex [
	aContainer viewModel: (BrWidgetModel new addAll: { 
		BrButtonModel new action: [ :aWidget :aButtonModel :anEvent |
			aTreeElement selectOne: aRowIndex dueTo: anEvent.
			aTreeElement requestFocus ].
		BrInteractiveModel new addState: BrSelectModel new 
	}).
	
	aContainer look: (BrInteractiveCommonLook new
		selected: [ :aWidget | aWidget background: self selectionColor ];
		deselected: [ :aWidget | aWidget background: BrGlamorousColors deselectedtListItemColor ]).

	aContainer
		when: BlDoubleClickEvent
		do: [ :anEvent |
			anEvent consumed: true.
			aTreeElement dispatchEvent: (BrSelectionDoubleClicked new selection: aTreeElement selectedIndices; sourceEvent: anEvent) ]
]

{ #category : #accessing }
BrEmptyColumnedTreeRowStencilBuilder >> padding [
	^ padding
]

{ #category : #accessing }
BrEmptyColumnedTreeRowStencilBuilder >> padding: aBlInsets [
	padding := aBlInsets
]

{ #category : #accessing }
BrEmptyColumnedTreeRowStencilBuilder >> selectable: aValuable [
	selectableBlock := aValuable
]

{ #category : #accessing }
BrEmptyColumnedTreeRowStencilBuilder >> selectionColor [
	^ selectionColor
]

{ #category : #accessing }
BrEmptyColumnedTreeRowStencilBuilder >> selectionColor: aColor [
	selectionColor := aColor
]
