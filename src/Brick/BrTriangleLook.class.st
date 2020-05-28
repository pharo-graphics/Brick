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

{ #category : #'private - ui' }
BrTriangleLook >> collapseWidget: aWidget [
	self collapsedTriangle removeFromParent.
	self expandedTriangle removeFromParent.
	self widgetContent addChild: self collapsedTriangle as: #triangle.
	isExpanded := false.
]

{ #category : #accessing }
BrTriangleLook >> collapsedStencil [
	^ collapsedStencil
]

{ #category : #accessing }
BrTriangleLook >> collapsedStencil: aStencil [
	collapsedStencil := aStencil.
	collapsedTriangle ifNotNil: [ :aTriangle | aTriangle removeFromParent ].
	collapsedTriangle := nil.
	self updateVisibleTriangle.
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

{ #category : #'private - ui' }
BrTriangleLook >> expandWidget: aWidget [
	self collapsedTriangle removeFromParent.
	self expandedTriangle removeFromParent.
	self widgetContent addChild: self expandedTriangle as: #triangle.
	isExpanded := true.
]

{ #category : #accessing }
BrTriangleLook >> expandedStencil [
	^ expandedStencil
]

{ #category : #accessing }
BrTriangleLook >> expandedStencil: aStencil [
	expandedStencil := aStencil.
	expandedTriangle ifNotNil: [ :aTriangle | aTriangle removeFromParent ].
	expandedTriangle := nil.
	self updateVisibleTriangle.
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
]

{ #category : #initialization }
BrTriangleLook >> initializeRequests [
	super initializeRequests.
	
	self request: BrTriangleStencilsRequest new.
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
		with: [ self triangle ];
	default: [ :aWidget | self collapseWidget: aWidget ];
	expanded: [ :aWidget | self expandWidget: aWidget ];
	collapsed: [ :aWidget | self collapseWidget: aWidget ]
]

{ #category : #'api - expandable' }
BrTriangleLook >> isExpanded [
	<return: #Boolean>
	^ isExpanded
]

{ #category : #hooks }
BrTriangleLook >> onStencilsChanged: anEvent [
	self collapsedStencil: anEvent collapsedStencil.
	self expandedStencil: anEvent expandedStencil.
]

{ #category : #'api - expandable' }
BrTriangleLook >> toggle [
	isExpanded := isExpanded not.
	self updateVisibleTriangle.
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
		self isExpanded 
			ifTrue: [ self expandWidget: aWidget ]
			ifFalse: [ self collapseWidget: aWidget ] ]
]
