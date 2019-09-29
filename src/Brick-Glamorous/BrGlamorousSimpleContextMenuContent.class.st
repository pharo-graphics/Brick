Class {
	#name : #BrGlamorousSimpleContextMenuContent,
	#superclass : #BrSimpleList,
	#instVars : [
		'anchor'
	],
	#category : #'Brick-Glamorous-Context Menu'
}

{ #category : #accessing }
BrGlamorousSimpleContextMenuContent >> anchor [
	^ anchor
]

{ #category : #accessing }
BrGlamorousSimpleContextMenuContent >> anchor: anObject [
	self flag: 'FIXME find other way to propagate anchor?'.
	anchor := anObject
]

{ #category : #initialization }
BrGlamorousSimpleContextMenuContent >> initialize [
	super initialize.
	self
		stencil: [ :e | 
			BlElement new
				viewModel:
					(BrInteractiveModel new
						withHover;
						yourself);
				look:
					(BrInteractiveCommonLook new
						default: [ :f | f background: Color transparent ];
						hovered: [ :f | f background: BrGlamorousColors defaultButtonBorderColor ];
						yourself);
				layout: BlLinearLayout horizontal;
				constraintsDo: [ :c | 
					c horizontal matchParent.
					c vertical fitContent ];
				padding: (BlInsets all: 5);
				addEventHandlerOn: BlClickEvent
					do: [ e value cull: anchor.
					anchor
						dispatchEvent:
							(BrContextMenuHideWish new
								anchor: anchor;
								yourself) ];
				addChild:
					(BrLabel new
						look: BrGlamorousLabelLook;
						text: e key;
						yourself);
				yourself ];
		hFitContent;
		vFitContent
]
