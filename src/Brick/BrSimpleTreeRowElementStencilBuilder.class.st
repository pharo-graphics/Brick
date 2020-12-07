Class {
	#name : #BrSimpleTreeRowElementStencilBuilder,
	#superclass : #BrTreeRowElementStencilBuilder,
	#instVars : [
		'nodeElement'
	],
	#category : #'Brick-Tree - Stencil'
}

{ #category : #'api - instantiation' }
BrSimpleTreeRowElementStencilBuilder >> buildDefault [
	<return: #BrStencil or: #BlElement>

	^ BlElement new
		layout: BlLinearLayout horizontal alignCenterLeft;
		constraintsDo: [ :c |
			c horizontal matchParent.
			c vertical fitContent ];
		addChild: (self createExpandCollapseElement
			toggleAction: [ :aToggleElement :aToggleModel | aToggleModel model toggle ]) as: #toggle;
		addChild: self nodeElement
]

{ #category : #'api - instantiation' }
BrSimpleTreeRowElementStencilBuilder >> createExpandCollapseElement [
	^ BrTriangle new
		look: BrGlamorousTriangleInCircleLook
]

{ #category : #accessing }
BrSimpleTreeRowElementStencilBuilder >> nodeElement [
	<return: #BlElement>

	^ nodeElement
]

{ #category : #accessing }
BrSimpleTreeRowElementStencilBuilder >> nodeElement: anElement [
	nodeElement := anElement
]

{ #category : #'api - instantiation' }
BrSimpleTreeRowElementStencilBuilder >> paramsOn: aStencilExecutor [
	aStencilExecutor
		push: self itemType;
		push: self nodeElement
]

{ #category : #initialization }
BrSimpleTreeRowElementStencilBuilder >> reset [
	super reset.
	
	nodeElement := nil
]
