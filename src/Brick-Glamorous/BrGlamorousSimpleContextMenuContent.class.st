Class {
	#name : #BrGlamorousSimpleContextMenuContent,
	#superclass : #BrSimpleList,
	#category : #'Brick-Glamorous-Context Menu'
}

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
					do: [ e value cull: self anchor.
					self anchor
						dispatchEvent:
							(BrContextMenuHideWish new
								anchor: self anchor;
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
