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

{ #category : #accessing }
BrTreeNode >> computation [
	^ computation
]

{ #category : #controlling }
BrTreeNode >> expand [
	
	self isExpanded
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
