Class {
	#name : #BrTriangleLook,
	#superclass : #BrInteractiveCommonLook,
	#instVars : [
		'isExpanded',
		'collapsedStencil',
		'expandedStencil',
		'collapsedTriangle',
		'expandedTriangle'
	],
	#category : #'Brick-Triangle - Look'
}

{ #category : #'api - expandable' }
BrTriangleLook >> collapse [
	self isExpanded ifFalse: [ ^ self ].
	isExpanded := false.
	self updateVisibleTriangle.
]

{ #category : #accessing }
BrTriangleLook >> collapsedStencil [
	^ collapsedStencil
]

{ #category : #accessing }
BrTriangleLook >> collapsedStencil: anObject [
	collapsedStencil := anObject
]

{ #category : #accessing }
BrTriangleLook >> collapsedTriangle [
	collapsedTriangle ifNil: [ 
		collapsedTriangle := self collapsedStencil asElement.
		self initializeTriangle: collapsedTriangle ].
	^ collapsedTriangle.
]

{ #category : #defaults }
BrTriangleLook >> defaultCollapsedStencil [
	^ BrCollapsedTriangleStencil new
]

{ #category : #defaults }
BrTriangleLook >> defaultExpandedStencil [
	^ BrExpandedTriangleStencil new
]

{ #category : #'api - expandable' }
BrTriangleLook >> expand [
	self isExpanded ifTrue: [ ^ self ].
	isExpanded := true.
	self updateVisibleTriangle.
]

{ #category : #accessing }
BrTriangleLook >> expandedStencil [
	^ expandedStencil
]

{ #category : #accessing }
BrTriangleLook >> expandedStencil: anObject [
	expandedStencil := anObject
]

{ #category : #accessing }
BrTriangleLook >> expandedTriangle [
	expandedTriangle ifNil: [ 
		expandedTriangle := self expandedStencil asElement.
		self initializeTriangle: expandedTriangle ].
	^ expandedTriangle.
]

{ #category : #initialization }
BrTriangleLook >> initialize [
	super initialize.
	isExpanded := false.
	self initializeStencils.
	self initializeWidget.
]

{ #category : #initialization }
BrTriangleLook >> initializeListeners [
	super initializeListeners.
	
	self when: BrTriangleStencilsChanged do: [ :anEvent | self onStencilsChanged: anEvent ].
	self when: BrExpansionChanged do: [ :anEvent | self onExpansionChanged: anEvent expanded ].
]

{ #category : #initialization }
BrTriangleLook >> initializeRequests [
	super initializeRequests.
	
	self request: BrTriangleStencilsRequest new.
	self request: BrExpansionStateRequest new.

]

{ #category : #initialization }
BrTriangleLook >> initializeStencils [
	collapsedStencil := self defaultCollapsedStencil.
	expandedStencil := self defaultExpandedStencil.
]

{ #category : #initialization }
BrTriangleLook >> initializeTriangle: aTriangle [
	"subclasses may configure collapsed and expanded triangle elements"
]

{ #category : #initialization }
BrTriangleLook >> initializeWidget [
	self 
		addChangeAddChildAs: #(content triangle) 
		with: [ self triangle ].
]

{ #category : #'api - testing' }
BrTriangleLook >> isExpanded [
	<return: #Boolean>
	^ isExpanded
]

{ #category : #hooks }
BrTriangleLook >> onExpansionChanged: aBoolean [
	aBoolean 
		ifTrue: [ self expand ] 
		ifFalse: [ self collapse ]
]

{ #category : #hooks }
BrTriangleLook >> onStencilsChanged: anEvent [
	self collapsedStencil: anEvent collapsedStencil.
	self expandedStencil: anEvent expandedStencil.
]

{ #category : #accessing }
BrTriangleLook >> triangle [
	^ self isExpanded 
		ifTrue: [ self expandedTriangle ]
		ifFalse: [ self collapsedTriangle ] 
]

{ #category : #'private - ui' }
BrTriangleLook >> updateVisibleTriangle [
	self widgetDo: [ :aWidget |
		self collapsedTriangle removeFromParent.
		self expandedTriangle removeFromParent.
		self isExpanded 
			ifTrue: [ self widgetContent addChild: self expandedTriangle as: #triangle ]
			ifFalse: [ self widgetContent addChild: self collapsedTriangle as: #triangle ] ]
]
