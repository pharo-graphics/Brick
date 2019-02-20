Class {
	#name : #BrTreeNode,
	#superclass : #Object,
	#instVars : [
		'value',
		'computation',
		'children',
		'isExpanded',
		'parent',
		'announcer'
	],
	#category : #'Brick-Tree - Model'
}

{ #category : #'instance creation' }
BrTreeNode class >> on: anObject computed: aComputationBlock [
	^ self new value: anObject computation: aComputationBlock
]

{ #category : #accessing }
BrTreeNode >> announcer [
	^ announcer ifNil: [ announcer := Announcer new ]
]

{ #category : #accessing }
BrTreeNode >> at: anIndex [
	<return: #BrTreeNode>
	| aLocalIndex |

	self
		assert: [ anIndex between: 1 and: self size ]
		description: [ 'Index must be within node bounds' ].

	anIndex = 1
		ifTrue: [ ^ self ].
	
	aLocalIndex := anIndex - 1.	
	
	self childrenNodesDo: [ :eachNode |
		| aNodeSize |
		
		aNodeSize := eachNode size.
		aLocalIndex <= aNodeSize
			ifTrue: [ ^ eachNode at: aLocalIndex ].
		aLocalIndex := aLocalIndex - aNodeSize ].
	
	self error: 'Must not reach'
]

{ #category : #accessing }
BrTreeNode >> children [
	^ children keys
]

{ #category : #accessing }
BrTreeNode >> childrenDo: aBlock [
	children keysDo: aBlock
]

{ #category : #accessing }
BrTreeNode >> childrenNodes [
	^ children values reject: #isNil
]

{ #category : #accessing }
BrTreeNode >> childrenNodesDo: aBlock [
	children valuesDo: [ :eachNode | eachNode ifNotNil: aBlock ]
]

{ #category : #controlling }
BrTreeNode >> collapse [
	| anExpandedSize |
	self isExpanded
		ifFalse: [ ^ self ].
	
	anExpandedSize := self size.

	isExpanded := false.
	
	self notifyCollapsed: anExpandedSize
]

{ #category : #accessing }
BrTreeNode >> computation [
	^ computation
]

{ #category : #accessing }
BrTreeNode >> depth [
	^ self hasParent
		ifTrue: [ self parent depth + 1 ]
		ifFalse: [ 0 ]
]

{ #category : #controlling }
BrTreeNode >> expand [
	
	self isExpanded
		ifTrue: [ ^ self ].
		
	self isEmpty
		ifTrue: [ ^ self ].

	children keysAndValuesDo: [ :eachValue :eachNode |
		eachNode ifNil: [ children at: eachValue put: (self newSubNode: eachValue) ] ].

	isExpanded := true.
	
	self notifyExpanded
]

{ #category : #testing }
BrTreeNode >> hasParent [
	<return: #Boolean>

	^ parent isNotNil
]

{ #category : #initialization }
BrTreeNode >> initialize [
	super initialize.
	
	children := OrderedIdentityDictionary new.
	computation := [ #() ].
	isExpanded := false
]

{ #category : #testing }
BrTreeNode >> isEmpty [
	<return: #Boolean>

	self childrenDo: [ :eachValue | ^ false ].
	^ true
]

{ #category : #accessing }
BrTreeNode >> isExpanded [
	^ isExpanded
]

{ #category : #private }
BrTreeNode >> localIndexToGlobal: anIndex [
	| anOffset |
	self hasParent
		ifFalse: [ ^ anIndex ].

	anOffset := 0.
	self parent childrenNodesDo: [ :eachNode |
		eachNode == self
			ifFalse: [ anOffset := anOffset + eachNode size ]
			ifTrue: [ ^ self parent localIndexToGlobal: anIndex + anOffset ] ].

	^ self parent localIndexToGlobal: anIndex + anOffset
]

{ #category : #'instance creation' }
BrTreeNode >> newSubNode: aValue [
	^ (self class on: aValue computed: self computation) parent: self
]

{ #category : #notifying }
BrTreeNode >> notifyCollapsed: anExpandedSize [
	| aFromIndex aToIndex |
	
	aFromIndex := self localIndexToGlobal: 1.
	aToIndex := self localIndexToGlobal: anExpandedSize.
	
	self root announcer announce: (BrTreeNodeCollapsed new
		from: aFromIndex;
		to: aToIndex;
		node: self)
]

{ #category : #notifying }
BrTreeNode >> notifyExpanded [
	| aFromIndex aToIndex |
	
	aFromIndex := self localIndexToGlobal: 1.
	aToIndex := self localIndexToGlobal: self size.
	
	self root announcer announce: (BrTreeNodeExpanded new
		from: aFromIndex;
		to: aToIndex;
		node: self)
]

{ #category : #accessing }
BrTreeNode >> parent [
	^ parent
]

{ #category : #accessing }
BrTreeNode >> parent: anObject [
	parent := anObject
]

{ #category : #accessing }
BrTreeNode >> precomputeChildrenValues [
	| theChildren |
	theChildren := self computation glamourValueWithArgs: { self value }.
	theChildren do: [ :eachChild | children at: eachChild put: nil ]
]

{ #category : #accessing }
BrTreeNode >> root [
	^ self hasParent
		ifTrue: [ self parent root ]
		ifFalse: [ self ]
]

{ #category : #accessing }
BrTreeNode >> size [
	"Return the current amount of expanded items in the tree"
	<return: #Number>
	| aSize |
	
	aSize := 1.
	self isExpanded ifTrue: [
		self childrenNodesDo: [ :eachNode | aSize := aSize + eachNode size ] ].
	
	^ aSize
]

{ #category : #controlling }
BrTreeNode >> toggle [
	self isExpanded
		ifTrue: [ self collapse ]
		ifFalse: [ self expand ]
]

{ #category : #accessing }
BrTreeNode >> value [
	^ value
]

{ #category : #initialization }
BrTreeNode >> value: anObject computation: aComputationBlock [
	value := anObject.
	computation := aComputationBlock.
	self precomputeChildrenValues
]
