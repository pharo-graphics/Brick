Class {
	#name : #BrLazyTreeNode,
	#superclass : #BrTreeNode,
	#instVars : [
		'value',
		'computation',
		'children',
		'isExpanded',
		'isHidden',
		'parent',
		'announcer'
	],
	#category : #'Brick-Tree - Model'
}

{ #category : #'instance creation' }
BrLazyTreeNode class >> on: anObject computed: aComputationBlock [
	^ self new value: anObject computation: aComputationBlock
]

{ #category : #enumeration }
BrLazyTreeNode >> allChildrenNodesBreadthFirst [
	| nodes |
	nodes := OrderedCollection new.
	self allChildrenNodesBreadthFirstDo: [ :e | nodes add: e ].
	^ nodes
]

{ #category : #enumeration }
BrLazyTreeNode >> allChildrenNodesBreadthFirstDo: aBlock [ 
	self childrenNodesDo: aBlock.
	self childrenNodesDo: [ :eachNode | eachNode allChildrenNodesBreadthFirstDo: aBlock ].
]

{ #category : #enumeration }
BrLazyTreeNode >> allChildrenNodesDepthFirstDo: aBlock [ 
	self childrenNodesDo: [ :eachNode | eachNode allChildrenNodesDepthFirstDo: aBlock ].
	self childrenNodesDo: aBlock
]

{ #category : #enumeration }
BrLazyTreeNode >> allChildrenNodesLinearDo: aBlock [
	self childrenNodesDo:  [ :eachChild |
		aBlock value: eachChild.
		eachChild  allChildrenNodesLinearDo: aBlock ]
]

{ #category : #accessing }
BrLazyTreeNode >> announcer [
	^ announcer ifNil: [ announcer := Announcer new ]
]

{ #category : #accessing }
BrLazyTreeNode >> at: anIndex [
	<return: #BrLazyTreeNode>
	| aLocalIndex |

	self
		assert: [ anIndex between: 1 and: self size ]
		description: [
			'Index({1}) must be within node bounds ({2})'
				format: { 
					anIndex.
					1 to: self size } ].

	(anIndex + isHidden asBit) = 1
		ifTrue: [ ^ self ].
	
	aLocalIndex := anIndex - 1 + isHidden asBit.	
	
	self childrenNodesDo: [ :eachNode |
		| aNodeSize |
		
		aNodeSize := eachNode size.
		aLocalIndex <= aNodeSize
			ifTrue: [ ^ eachNode at: aLocalIndex ].
		aLocalIndex := aLocalIndex - aNodeSize ].
	
	self error: 'Must not reach'
]

{ #category : #accessing }
BrLazyTreeNode >> children [
	^ children keys
]

{ #category : #'instance creation' }
BrLazyTreeNode >> children: aCollectionOfValues computed: aComputationBlock [
	
	children := OrderedIdentityDictionary new.

	aCollectionOfValues do: [ :eachValue |
		children at: eachValue put: ((self class on: eachValue computed: aComputationBlock) parent: self) ]
]

{ #category : #enumeration }
BrLazyTreeNode >> childrenDo: aBlock [
	children keysDo: aBlock
]

{ #category : #accessing }
BrLazyTreeNode >> childrenNodes [
	^ children values reject: #isNil
]

{ #category : #enumeration }
BrLazyTreeNode >> childrenNodesDo: aBlock [
	children valuesDo: [ :eachNode | eachNode ifNotNil: aBlock ]
]

{ #category : #controlling }
BrLazyTreeNode >> collapse [
	| anExpandedSize |
	self isExpanded
		ifFalse: [ ^ self ].
	
	anExpandedSize := self size.

	isExpanded := false.
	
	self notifyCollapsed: anExpandedSize
]

{ #category : #accessing }
BrLazyTreeNode >> computation [
	^ computation
]

{ #category : #accessing }
BrLazyTreeNode >> depth [
	^ self hasParent
		ifTrue: [ self parent depth + 1 ]
		ifFalse: [ 0 - isHidden asBit ]
]

{ #category : #accessing }
BrLazyTreeNode >> ensureChildNodesComputed [
	"Make sure child nodes are computed."
	children keysAndValuesDo: [ :eachValue :eachNode |
		eachNode ifNil: [ children at: eachValue put: (self newSubNode: eachValue) ] ].

]

{ #category : #controlling }
BrLazyTreeNode >> expand [
	self isExpanded
		ifTrue: [ ^ self ].
	self isEmpty
		ifTrue: [ ^ self ].
	self ensureChildNodesComputed.

	isExpanded := true.
	
	self notifyExpanded
]

{ #category : #accessing }
BrLazyTreeNode >> globalIndexInTree [
   ^ self localIndexToGlobal: 0
]

{ #category : #testing }
BrLazyTreeNode >> hasParent [
	<return: #Boolean>

	^ parent isNotNil
]

{ #category : #controlling }
BrLazyTreeNode >> hide [
	isHidden := true
]

{ #category : #initialization }
BrLazyTreeNode >> initialize [
	super initialize.
	
	children := OrderedIdentityDictionary new.
	computation := [ #() ].
	isExpanded := false.
	isHidden := false
]

{ #category : #testing }
BrLazyTreeNode >> isEmpty [
	<return: #Boolean>

	self childrenDo: [ :eachValue | ^ false ].
	^ true
]

{ #category : #accessing }
BrLazyTreeNode >> isExpanded [
	^ isExpanded
]

{ #category : #testing }
BrLazyTreeNode >> isHidden [
	^ isHidden
]

{ #category : #private }
BrLazyTreeNode >> localIndexToGlobal: anIndex [
	| anOffset |
	self hasParent
		ifFalse: [ ^ anIndex ].

	anOffset := 0.
	self parent childrenNodesDo: [ :eachNode |
		eachNode == self
			ifFalse: [ anOffset := anOffset + eachNode size ]
			ifTrue: [ ^ self parent localIndexToGlobal: anIndex + anOffset + 1 ] ].

	^ self parent localIndexToGlobal: anIndex + anOffset
]

{ #category : #'instance creation' }
BrLazyTreeNode >> newSubNode: aValue [
	^ (self class on: aValue computed: self computation) parent: self
]

{ #category : #notifying }
BrLazyTreeNode >> notifyCollapsed: anExpandedSize [
	| aFromIndex aToIndex |
	
	aFromIndex := self localIndexToGlobal: 1.
	aToIndex := self localIndexToGlobal: anExpandedSize.
	
	self root announcer announce: (BrTreeNodeCollapsed new
		from: aFromIndex;
		to: aToIndex;
		node: self)
]

{ #category : #notifying }
BrLazyTreeNode >> notifyExpanded [
	| aFromIndex aToIndex |
	
	aFromIndex := self localIndexToGlobal: 1.
	aToIndex := self localIndexToGlobal: self size.
	
	self root announcer announce: (BrTreeNodeExpanded new
		from: aFromIndex;
		to: aToIndex;
		node: self)
]

{ #category : #accessing }
BrLazyTreeNode >> parent [
	^ parent
]

{ #category : #accessing }
BrLazyTreeNode >> parent: anObject [
	parent := anObject
]

{ #category : #accessing }
BrLazyTreeNode >> precomputeChildrenValues [
	| theChildren |
	theChildren := self computation glamourValueWithArgs: { self value }.
	theChildren do: [ :eachChild | children at: eachChild put: nil ]
]

{ #category : #printing }
BrLazyTreeNode >> printOn: aStream [
	aStream print: self value
]

{ #category : #accessing }
BrLazyTreeNode >> root [
	^ self hasParent
		ifTrue: [ self parent root ]
		ifFalse: [ self ]
]

{ #category : #accessing }
BrLazyTreeNode >> size [
	"Return the current amount of expanded items in the tree"
	<return: #Number>
	| aSize |
	
	aSize := 1 - isHidden asBit.
	self isExpanded ifTrue: [
		self childrenNodesDo: [ :eachNode | aSize := aSize + eachNode size ] ].
	
	^ aSize
]

{ #category : #controlling }
BrLazyTreeNode >> toggle [
	self isExpanded
		ifTrue: [ self collapse ]
		ifFalse: [ self expand ]
]

{ #category : #accessing }
BrLazyTreeNode >> value [
	^ value
]

{ #category : #initialization }
BrLazyTreeNode >> value: anObject computation: aComputationBlock [
	value := anObject.
	computation := aComputationBlock.
	self precomputeChildrenValues
]

{ #category : #enumeration }
BrLazyTreeNode >> withAllChildrenNodesBreadthFirst [
	| nodes |
	nodes := OrderedCollection new.
	self withAllChildrenNodesBreadthFirstDo: [ :e | nodes add: e ].
	^ nodes
]

{ #category : #enumeration }
BrLazyTreeNode >> withAllChildrenNodesBreadthFirstDo: aBlock [ 
	aBlock value: self.
	self allChildrenNodesBreadthFirstDo: aBlock
]

{ #category : #enumeration }
BrLazyTreeNode >> withAllChildrenNodesDepthFirstDo: aBlock [ 
	self allChildrenNodesDepthFirstDo: aBlock.
	aBlock value: self
]

{ #category : #enumeration }
BrLazyTreeNode >> withAllChildrenNodesLinearDo: aBlock [
	aBlock value: self.
	self allChildrenNodesLinearDo: aBlock
]

{ #category : #enumeration }
BrLazyTreeNode >> withAllParentNodes [
	| nodes |
	nodes := OrderedCollection new.
	self withAllParentNodesDo: [ :e | nodes add: e ].
	^ nodes
]

{ #category : #enumeration }
BrLazyTreeNode >> withAllParentNodesDo: aBlock [
	self hasParent
		ifTrue: [ self parent withAllParentNodesDo: aBlock ].
	aBlock value: self
]
