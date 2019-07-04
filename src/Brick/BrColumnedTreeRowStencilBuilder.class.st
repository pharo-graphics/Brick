Class {
	#name : #BrColumnedTreeRowStencilBuilder,
	#superclass : #BrTreeRowStencilBuilder,
	#instVars : [
		'cellSpacing',
		'padding',
		'indentation',
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
		ifTrue: [
			aContainer look: (BrInteractiveCommonLook new
				selected: [ :aWidget | aWidget background: (Color gray alpha: 0.2) ];
				deselected: [ :aWidget | aWidget background: (Color transparent) ]).

			aContainer viewModel: (BrWidgetModel new addAll: { 
				BrButtonModel new action: [ :aWidget :aButtonModel :anEvent |
					aTreeElement selectOne: aRowIndex dueTo: anEvent.
					aTreeElement requestFocus ].
				BrInteractiveModel new addState: BrSelectModel new
			}).
			
			aContainer
				when: BlDoubleClickEvent
				do: [ :anEvent |
					anEvent consumed: true.
					aTreeElement dispatchEvent: (BrSelectionDoubleClicked new selection: aTreeElement selection; sourceEvent: anEvent) ] ].
	

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
	
	anExpander addChild: (
		BlElement new
			geometry: BlEllipse new;
			margin: (BlInsets all: 2);
			size: 16@16;
			look: (BrInteractiveCommonLook new
				default: [ :aWidget | aWidget background: (Color transparent) ];
				hovered: [ :aWidget | aWidget background: (Color gray alpha: 0.1) ];
				pressed: [ :aWidget | aWidget background: (Color gray alpha: 0.2) ]);
			viewModel: (BrWidgetModel new addAll: { 
				BrButtonModel new action: [ aNode toggle ].
				BrInteractiveModel new addStates: (aNode isEmpty
						ifTrue: [ #() ]
						ifFalse: [ { BrHoverModel new . BrPressModel new } ]),
					{ BrActivationModel new disabled: aNode isEmpty } });
			addChild: (BlElement new
				background: (aNode isEmpty ifTrue: [ Color transparent ] ifFalse: [ Color gray ]);
				size: 12@12;
				relocate: (aNode isExpanded ifTrue: [ 2@3 ] ifFalse: [ 3@2 ]);
				geometry: (aNode isExpanded
					ifTrue: [ BlPolygon vertices: { 2@2 . 10@2 . 6@10 } ]
					ifFalse: [ BlPolygon vertices: { 2@2 . 10@6 . 2@10 } ]))
			).
		
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
	selectableBlock := [ :eachNode :eachIndex :aTree | true ]
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
