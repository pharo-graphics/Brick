Class {
	#name : #BrDevLookGraphOverview,
	#superclass : #BrVerticalPane,
	#instVars : [
		'lookClass'
	],
	#category : #'Brick-DevTool'
}

{ #category : #'private - instance creation' }
BrDevLookGraphOverview >> buildLookAndModelGraph [
	| aMondrian |
	
	aMondrian := GtMondrian new.
	
	aMondrian nodes 
		stencil: [ :each | BlTextElement new text: each name asRopedText glamorousRegularSize ];
		with: { self lookClass }, self lookClass allRelatedViewModels.

	aMondrian edges
		fromRightCenter;
		toLeftCenter;
		connectToAll: #allRelatedViewModels.

	aMondrian layout horizontalTree.
	
	^ aMondrian root clipChildren: false
]

{ #category : #accessing }
BrDevLookGraphOverview >> lookClass [
	^ lookClass
]

{ #category : #accessing }
BrDevLookGraphOverview >> lookClass: anObject [
	lookClass := anObject.

	self addChild: (BrVerticalPane new matchParent addChild: self buildLookAndModelGraph asPannableElement).
]
