Class {
	#name : #BrColumnedTreeRowStencilBuilder,
	#superclass : #BrTreeRowStencilBuilder,
	#instVars : [
		'cellSpacing',
		'padding',
		'indentation',
		'selectionColor',
		'selectableBlock'
	],
	#category : #'Brick-Tree - Stencil'
}

{ #category : #'api - instantiation' }
BrColumnedTreeRowStencilBuilder >> buildDefault [
	<return: #BrStencil or: #BlElement>
	| aContainer aNode aRowIndex anExpander aTreeElement |
	
	aNode := self treeNode.
	aRowIndex := self rowIndex.
	aTreeElement := self treeElement.

	aContainer := BlElement new.
	
	(selectableBlock valueWithEnoughArguments: { aNode . aRowIndex . aTreeElement })
		ifTrue: [ self makeSelectableContaine: aContainer forTreeElement: aTreeElement atIndex: aRowIndex ].
		
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
	anExpander addChild: (self createExpandCollapseElementFor: aNode).
		
	aContainer addChild: anExpander as: #expander.

	^ aContainer
]

{ #category : #accessing }
BrColumnedTreeRowStencilBuilder >> cellSpacing [
	^ cellSpacing
]

{ #category : #accessing }
BrColumnedTreeRowStencilBuilder >> cellSpacing: aNumber [
	cellSpacing := aNumber
]

{ #category : #private }
BrColumnedTreeRowStencilBuilder >> createArrowInterationElementForNode: aNode [
	^ BlElement new
		background: (aNode isEmpty ifTrue: [ Color transparent ] ifFalse: [ Color gray ]);
		size: 12@12;
		relocate: (aNode isExpanded ifTrue: [ 2@3 ] ifFalse: [ 3@2 ]);
		geometry: (aNode isExpanded
			ifTrue: [ BlPolygon vertices: { 2@2 . 10@2 . 6@10 } ]
			ifFalse: [ BlPolygon vertices: { 2@2 . 10@6 . 2@10 } ])
]

{ #category : #private }
BrColumnedTreeRowStencilBuilder >> createExpandCollapseElementFor: aNode [
	^ BlElement new
		geometry: BlEllipse new;
		margin: (BlInsets all: 2);
		size: 16@16;
		viewModel: (BrWidgetModel new 
			addAll: { 
				BrButtonModel new action: [ aNode toggle ].
				BrInteractiveModel new addStates: (
					aNode isEmpty
						ifTrue: [ #() ]
						ifFalse: [ { BrHoverModel new . BrPressModel new } ]
				), { BrActivationModel new disabled: aNode isEmpty } });
		look: (BrInteractiveCommonLook new
			default: [ :aWidget | aWidget background: (Color transparent) ];
			hovered: [ :aWidget | aWidget background: (Color gray alpha: 0.1) ];
			pressed: [ :aWidget | aWidget background: (Color gray alpha: 0.2) ]);
		addChild: (self createArrowInterationElementForNode: aNode)
]

{ #category : #accessing }
BrColumnedTreeRowStencilBuilder >> indentation [
	^ indentation
]

{ #category : #accessing }
BrColumnedTreeRowStencilBuilder >> indentation: aNumber [
	indentation := aNumber
]

{ #category : #initialization }
BrColumnedTreeRowStencilBuilder >> initialize [
	super initialize.
	
	cellSpacing := 0.
	padding := BlInsets empty.
	indentation := 15.
	selectableBlock := [ :eachNode :eachIndex :aTree | true ].
	selectionColor := Color gray alpha: 0.2.
]

{ #category : #private }
BrColumnedTreeRowStencilBuilder >> makeSelectableContaine: aContainer forTreeElement: aTreeElement atIndex: aRowIndex [
	aContainer viewModel: (BrWidgetModel new addAll: { 
		BrButtonModel new action: [ :aWidget :aButtonModel :anEvent |
			aTreeElement selectOne: aRowIndex dueTo: anEvent.
			aTreeElement requestFocus ].
		BrInteractiveModel new addState: BrSelectModel new 
	}).
	
	aContainer look: (BrInteractiveCommonLook new
		selected: [ :aWidget | aWidget background: self selectionColor ];
		deselected: [ :aWidget | aWidget background: Color transparent ]).

	aContainer
		when: BlDoubleClickEvent
		do: [ :anEvent |
			anEvent consumed: true.
			aTreeElement dispatchEvent: (BrSelectionDoubleClicked new selection: aTreeElement selectedIndices; sourceEvent: anEvent) ]
]

{ #category : #accessing }
BrColumnedTreeRowStencilBuilder >> padding [
	^ padding
]

{ #category : #accessing }
BrColumnedTreeRowStencilBuilder >> padding: aBlInsets [
	padding := aBlInsets
]

{ #category : #accessing }
BrColumnedTreeRowStencilBuilder >> selectable: aValuable [
	selectableBlock := aValuable
]

{ #category : #accessing }
BrColumnedTreeRowStencilBuilder >> selectionColor [
	^ selectionColor
]

{ #category : #accessing }
BrColumnedTreeRowStencilBuilder >> selectionColor: aColor [
	selectionColor := aColor
]
