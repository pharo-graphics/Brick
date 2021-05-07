Class {
	#name : #BrTriangleAptitude,
	#superclass : #BrAptitude,
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
BrTriangleAptitude >> collapse [
	self isExpanded ifFalse: [ ^ self ].
	isExpanded := false.
	self updateVisibleTriangle.
]

{ #category : #'private - ui' }
BrTriangleAptitude >> collapseWidget: aWidget [
	self collapsedTriangle removeFromParent.
	self expandedTriangle removeFromParent.
	self widgetContent addChild: self collapsedTriangle as: #triangle.
	isExpanded := false.
]

{ #category : #accessing }
BrTriangleAptitude >> collapsedStencil [
	^ collapsedStencil
]

{ #category : #accessing }
BrTriangleAptitude >> collapsedStencil: aStencil [
	collapsedStencil := aStencil.
	collapsedTriangle ifNotNil: [ :aTriangle | aTriangle removeFromParent ].
	collapsedTriangle := nil.
	self updateVisibleTriangle.
]

{ #category : #accessing }
BrTriangleAptitude >> collapsedTriangle [
	collapsedTriangle ifNil: [ 
		collapsedTriangle := self collapsedStencil asElement.
		self initializeTriangle: collapsedTriangle ].
	^ collapsedTriangle.
]

{ #category : #defaults }
BrTriangleAptitude >> defaultCollapsedStencil [
	^ BrCollapsedTriangleStencil new
]

{ #category : #defaults }
BrTriangleAptitude >> defaultExpandedStencil [
	^ BrExpandedTriangleStencil new
]

{ #category : #'api - expandable' }
BrTriangleAptitude >> expand [
	self isExpanded ifTrue: [ ^ self ].
	isExpanded := true.
	self updateVisibleTriangle.
]

{ #category : #'private - ui' }
BrTriangleAptitude >> expandWidget: aWidget [
	self collapsedTriangle removeFromParent.
	self expandedTriangle removeFromParent.
	self widgetContent addChild: self expandedTriangle as: #triangle.
	isExpanded := true
]

{ #category : #accessing }
BrTriangleAptitude >> expandedStencil [
	^ expandedStencil
]

{ #category : #accessing }
BrTriangleAptitude >> expandedStencil: aStencil [
	expandedStencil := aStencil.
	expandedTriangle ifNotNil: [ :aTriangle | aTriangle removeFromParent ].
	expandedTriangle := nil.
	self updateVisibleTriangle.
]

{ #category : #accessing }
BrTriangleAptitude >> expandedTriangle [
	expandedTriangle ifNil: [ 
		expandedTriangle := self expandedStencil asElement.
		self initializeTriangle: expandedTriangle ].
	^ expandedTriangle.
]

{ #category : #initialization }
BrTriangleAptitude >> initialize [
	super initialize.
	
	isExpanded := false.
	
	collapsedStencil := self defaultCollapsedStencil.
	expandedStencil := self defaultExpandedStencil.
	
	self 
		addChangeAddChildAs: #(content triangle) 
		with: [ self triangle ]
]

{ #category : #initialization }
BrTriangleAptitude >> initializeListeners [
	super initializeListeners.
	
	self when: BrTriangleStencilsChanged do: [ :anEvent | self onStencilsChanged: anEvent ].
	self when: BrExpandedEvent do: [ :anEvent | self expandWidget: self widget ].
	self when: BrCollapsedEvent do: [ :anEvent | self collapseWidget: self widget ]
]

{ #category : #initialization }
BrTriangleAptitude >> initializeRequests [
	super initializeRequests.
	
	self request: BrTriangleStencilsRequest new.
]

{ #category : #initialization }
BrTriangleAptitude >> initializeTriangle: aTriangle [
	"subclasses may configure collapsed and expanded triangle elements"
]

{ #category : #'api - expandable' }
BrTriangleAptitude >> isExpanded [
	<return: #Boolean>
	^ isExpanded
]

{ #category : #hooks }
BrTriangleAptitude >> onStencilsChanged: anEvent [
	self collapsedStencil: anEvent collapsedStencil.
	self expandedStencil: anEvent expandedStencil.
]

{ #category : #'api - expandable' }
BrTriangleAptitude >> toggle [
	isExpanded := isExpanded not.
	self updateVisibleTriangle.
]

{ #category : #accessing }
BrTriangleAptitude >> triangle [
	^ self isExpanded 
		ifTrue: [ self expandedTriangle ]
		ifFalse: [ self collapsedTriangle ] 
]

{ #category : #'private - ui' }
BrTriangleAptitude >> updateVisibleTriangle [
	self widgetDo: [ :aWidget |
		self isExpanded 
			ifTrue: [ self expandWidget: aWidget ]
			ifFalse: [ self collapseWidget: aWidget ] ]
]
