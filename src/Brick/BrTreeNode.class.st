Class {
	#name : #BrTreeNode,
	#superclass : #Object,
	#instVars : [
		'value',
		'parent',
		'size',
		'indexInChildren',
		'computation',
		'isExpanded',
		'childrenValues',
		'childrenNodes',
		'indexInTree'
	],
	#category : #'Brick-Tree - Model'
}

{ #category : #enumeration }
BrTreeNode >> allChildrenNodesBreadthFirst [
	| nodes |
	nodes := OrderedCollection new.
	self allChildrenNodesBreadthFirstDo: [ :e | nodes add: e ].
	^ nodes
]

{ #category : #enumeration }
BrTreeNode >> allChildrenNodesBreadthFirstDo: aBlock [ 
	self childrenNodesDo: aBlock.
	self childrenNodesDo: [ :eachNode | eachNode allChildrenNodesBreadthFirstDo: aBlock ].
]

{ #category : #enumeration }
BrTreeNode >> allChildrenNodesDepthFirstDo: aBlock [ 
	self childrenNodesDo: [ :eachNode | eachNode allChildrenNodesDepthFirstDo: aBlock ].
	self childrenNodesDo: aBlock
]

{ #category : #enumeration }
BrTreeNode >> allChildrenNodesLinearDo: aBlock [
	self childrenNodesDo:  [ :eachChild |
		aBlock value: eachChild.
		eachChild allChildrenNodesLinearDo: aBlock ]
]

{ #category : #accessing }
BrTreeNode >> at: aTreeIndex [
	"Return a child node at a tree index"
	<return: #BrTreeNode>
	
	aTreeIndex = self indexInTree
		ifTrue: [ ^ self ].
		
	self childrenNodes
		findBinary: [ :eachNode | aTreeIndex - eachNode indexInTree ]
		do: [ :aFoundNode | ^ aFoundNode ]
		ifNone: [ :aLeftNode :aRightNode |
			aLeftNode ifNotNil: [
				(aTreeIndex between: aLeftNode indexInTree and: aLeftNode indexInTree + aLeftNode size - 1)
					ifTrue: [ ^ aLeftNode at: aTreeIndex ] ].
			aRightNode ifNotNil: [
				(aTreeIndex between: aRightNode indexInTree and: aRightNode indexInTree + aRightNode size - 1)
					ifTrue: [ ^ aRightNode at: aTreeIndex ] ] ].
	
	self error: 'Must not reach'
]

{ #category : #testing }
BrTreeNode >> canBeExpanded [
	"Return true if I can be expanded (e.g. I can have children).
	The check requires computation (if not already) of children values"
	<return: #Boolean>
	
	self ensureChildrenValues.
	^ childrenValues isNotEmpty
]

{ #category : #accessing }
BrTreeNode >> children [
	<return: #Collection of: #Object>

	self
		deprecated: 'Use #childrenValues instead'
		transformWith: '`@receiver children' -> '`@receiver childrenValues'.

	^ self childrenValues
]

{ #category : #initialization }
BrTreeNode >> children: aCollectionOfValues computed: aComputationBlock [

	self
		deprecated: 'Use #value:computation:'
		transformWith: '`@receiver children: `@statements1 computed: `@statements2' -> '`@receiver value: `@statements1 computation: `@statements2'.

	self value: aCollectionOfValues computation: aComputationBlock
]

{ #category : #enumeration }
BrTreeNode >> childrenDo: aBlock [
	self
		deprecated: 'Use #childrenValuesDo:'
		transformWith: '`@receiver childrenDo: `@statements1' -> '`@receiver childrenValuesDo: `@statements1'.
	
	self childrenValuesDo: aBlock
]

{ #category : #accessing }
BrTreeNode >> childrenNodes [
	<return: #Collection of: #BrTreeNode>

	^ self isExpanded
		ifTrue: [ childrenNodes ]
		ifFalse: [ #() ]
]

{ #category : #enumeration }
BrTreeNode >> childrenNodesDo: aBlock [
	self childrenNodes do: aBlock
]

{ #category : #accessing }
BrTreeNode >> childrenValues [
	<return: #Collection of: #Object>

	^ self isExpanded
		ifTrue: [ childrenValues ]
		ifFalse: [ #() ]
]

{ #category : #enumeration }
BrTreeNode >> childrenValuesDo: aBlock [
	self childrenValues do: aBlock
]

{ #category : #'api - expandable' }
BrTreeNode >> collapse [
	| aChildrenSize |
	
	self isCollapsed
		ifTrue: [ ^ self ].

	self ensureChildrenNodes.

	aChildrenSize := self computeChildrenSize.
	size := size - aChildrenSize.
	self
		assert: [ size >= 0 ]
		description: [ 'Size can not be negative' ].

	isExpanded := false.
	
	self hasParent
		ifTrue: [ self parent onNodesDisappearedAfter: self amount: aChildrenSize ].
	
	self
		onChildCollapsed: self
		from: self
		size: aChildrenSize
]

{ #category : #accessing }
BrTreeNode >> computation [
	^ computation
]

{ #category : #private }
BrTreeNode >> computeChildrenSize [
	<return: #Number>

	^ childrenNodes inject: 0 into: [ :aTotalSize :eachChild | aTotalSize + eachChild size ]
]

{ #category : #accessing }
BrTreeNode >> depth [
	^ self hasParent
		ifTrue: [ self parent depth + 1 ]
		ifFalse: [ self isAccountedForSelf asBit ]
]

{ #category : #private }
BrTreeNode >> ensureChildrenNodes [
	childrenNodes
		ifNotNil: [ ^ self ].
	
	self ensureChildrenValues.
	
	"we do not use withIndexCollect: or collect: in order to rely on as simple Collection api as possible"
	childrenNodes := Array streamContents: [ :aStream |
		| eachIndex |
		eachIndex := 0.
		childrenValues do: [ :eachValue |
			eachIndex := eachIndex + 1.
			aStream nextPut: ((self newSubNode: eachValue computation: self computation)
				parent: self;
				indexInChildren: eachIndex;
				shiftIndexInTreeBy: indexInTree + eachIndex - 1) ] ]
]

{ #category : #private }
BrTreeNode >> ensureChildrenValues [
	childrenValues
		ifNotNil: [ ^ self ].

	childrenValues := self computation value: self value
]

{ #category : #'api - expandable' }
BrTreeNode >> expand [
	| aChildrenSize |

	self isExpanded
		ifTrue: [ ^ self ].

	self canBeExpanded
		ifFalse: [ ^ self ].

	self ensureChildrenNodes.
	aChildrenSize := self computeChildrenSize.

	size := size + aChildrenSize.
	self
		assert: [ size >= 0 ]
		description: [ 'Size can not be negative' ].

	isExpanded := true.
	
	self hasParent
		ifTrue: [ self parent onNodesAppearedAfter: self amount: aChildrenSize ].
	
	self
		onChildExpanded: self
		from: self
		size: aChildrenSize
]

{ #category : #enumeration }
BrTreeNode >> expandUpTo: aLevelIndex [
	"#expandUpTo: 1 is the same as just #expand"
	self upToDepth: aLevelIndex do: [ :eachNode | eachNode expand ]
]

{ #category : #accessing }
BrTreeNode >> globalIndexInTree [
	
	self
		deprecated: 'Use #indexInTree'
		transformWith: '`@receiver globalIndexInTree' -> '`@receiver indexInTree'.

   ^ self indexInTree
]

{ #category : #'gt-extension' }
BrTreeNode >> gtNodesFor: aView [
	<gtView>
	
	^ aView columnedTree
		title: 'Nodes';
		priority: 1;
		items: [ { self } ];
		children: [ :anItem | anItem childrenNodes ];
		expandAll;
		column: 'Item' item: [ :anItem | anItem ];
		column: 'Index' item: [ :anItem | anItem indexInTree ] width: 80
]

{ #category : #'gt-extension' }
BrTreeNode >> gtRawNodesFor: aView [
	<gtView>
	
	^ aView columnedTree
		title: 'Raw Nodes';
		priority: 2;
		items: [ { self } ];
		children: [ :anItem | (anItem instVarNamed: #childrenNodes) ifNil: [ #() ] ];
		expandAll;
		column: 'Item' item: [ :anItem | anItem ];
		column: 'Index' item: [ :anItem | anItem indexInTree ] width: 80
]

{ #category : #testing }
BrTreeNode >> hasParent [
	<return: #Boolean>

	^ parent isNotNil
]

{ #category : #accessing }
BrTreeNode >> indexInChildren [
	"index in a children collection in the parent"
	<return: #Number>

	^ indexInChildren
]

{ #category : #accessing }
BrTreeNode >> indexInChildren: aNumber [
	<return: #Number>

	indexInChildren := aNumber
]

{ #category : #accessing }
BrTreeNode >> indexInTree [
	"Global index in the tree"
	<return: #Number>

	^ indexInTree
]

{ #category : #accessing }
BrTreeNode >> indexInTree: aNumber [
	indexInTree := aNumber
]

{ #category : #initialization }
BrTreeNode >> initialize [
	super initialize.

	isExpanded := false.
	indexInChildren := 1.
	indexInTree := 1.
	size := 1.
	childrenValues := nil.
	childrenNodes := nil.

	computation := [ #() ]
]

{ #category : #'api - adding / removing' }
BrTreeNode >> insert: anObject atChildIndex: aChildIndex [
	| aNewNode |

	"If children values are not computed we should not insert anything because values will be properly computed lazily later"
	childrenValues
		ifNil: [ ^ self onNodeChanged: self ].

	childrenValues := childrenValues
		copyReplaceFrom: aChildIndex
		to: aChildIndex - 1
		with: {anObject}.

	"there are no children nodes, they will be computed later from updated children values"
	childrenNodes
		ifNil: [ ^ self onNodeChanged: self ].

	aNewNode := self newSubNode: anObject computation: self computation.
	aNewNode
		parent: self;
		indexInChildren: aChildIndex;
		shiftIndexInTreeBy: self indexInTree + aChildIndex - 1.

	"shift the indices of the rest of my children by 1"
	aChildIndex to: childrenNodes size do: [ :eachChildIndex | 
		(childrenNodes at: eachChildIndex)
			shiftIndexInChildrenBy: 1;
			shiftIndexInTreeBy: aNewNode size ].

	childrenNodes := childrenNodes
		copyReplaceFrom: aChildIndex
		to: aChildIndex - 1
		with: {aNewNode}.

	"do not update my size if I am not expanded"
	self isExpanded
		ifTrue: [ size := size + aNewNode size.
			self hasParent
				ifTrue: [ self parent onNodesAppearedAfter: self amount: aNewNode size ] ].

	self onNodeChanged: self.
	self isExpanded
		ifTrue: [ self onChildInserted: aNewNode size: aNewNode size ]
]

{ #category : #testing }
BrTreeNode >> isAccountedForSelf [
	^ true
]

{ #category : #testing }
BrTreeNode >> isCollapsed [
	^ self isExpanded not
]

{ #category : #testing }
BrTreeNode >> isEmpty [
	<return: #Boolean>
	
	self
		deprecated: 'Use #canBeExpanded'
		transformWith: '`@receiver isEmpty' -> '`@receiver canBeExpanded not'.

	^ self canBeExpanded not
]

{ #category : #testing }
BrTreeNode >> isExpanded [
	^ isExpanded
]

{ #category : #initialization }
BrTreeNode >> newSubNode: anObject computation: aComputationBlock [
	^ self subclassResponsibility
]

{ #category : #hooks }
BrTreeNode >> onChildCollapsed: aChildNode from: anOriginNode size: anAmount [
	self hasParent
		ifFalse: [ ^ self ].
	
	self parent
		onChildCollapsed: self
		from: anOriginNode
		size: anAmount
]

{ #category : #hooks }
BrTreeNode >> onChildExpanded: aChildNode from: anOriginNode size: anAmount [
	self hasParent
		ifFalse: [ ^ self ].

	self parent
		onChildExpanded: self
		from: anOriginNode
		size: anAmount
]

{ #category : #hooks }
BrTreeNode >> onChildInserted: anOriginNode size: anAmount [
	self hasParent
		ifFalse: [ ^ self ].
	self parent onChildInserted: anOriginNode size: anAmount
]

{ #category : #hooks }
BrTreeNode >> onChildRemoved: anOriginNode size: anAmount [
	self hasParent
		ifFalse: [ ^ self ].
	self parent onChildRemoved: anOriginNode size: anAmount
]

{ #category : #hooks }
BrTreeNode >> onNodeChanged: aTreeNode [
	self onNodeChanged: aTreeNode payload: nil
]

{ #category : #hooks }
BrTreeNode >> onNodeChanged: aTreeNode payload: anObject [
	self hasParent
		ifFalse: [ ^ self ].
	self parent onNodeChanged: aTreeNode payload: anObject
]

{ #category : #hooks }
BrTreeNode >> onNodesAppearedAfter: aChildNode amount: anAmount [
	self
		assert: [ aChildNode hasParent and: [ self == aChildNode parent ] ]
		description: [ 'A node should be my child' ].

	self isExpanded
		ifFalse: [ ^ self ].

	size := size + anAmount.
	self
		assert: [ size >= 0 ]
		description: [ 'Size can not be negative' ].
	
	childrenNodes ifNotNil: [ :theNodes |
		aChildNode indexInChildren + 1 to: theNodes size do: [ :eachChildIndex |
			(theNodes at: eachChildIndex)
				shiftIndexInTreeBy: anAmount ] ].

	self hasParent
		ifFalse: [ ^ self ].

	self parent onNodesAppearedAfter: self amount: anAmount
]

{ #category : #hooks }
BrTreeNode >> onNodesDisappearedAfter: aChildNode amount: anAmount [
	self
		assert: [ aChildNode hasParent and: [ self == aChildNode parent ] ]
		description: [ 'A node should be my child' ].

	self isExpanded
		ifFalse: [ ^ self ].

	size := size - anAmount.
	self
		assert: [ size >= 0 ]
		description: [ 'Size can not be negative' ].
	
	childrenNodes ifNotNil: [ :theNodes |
		aChildNode indexInChildren + 1 to: theNodes size do: [ :eachChildIndex |
			(theNodes at: eachChildIndex)
				shiftIndexInTreeBy: anAmount negated ] ].

	self hasParent
		ifFalse: [ ^ self ].

	self parent onNodesDisappearedAfter: self amount: anAmount
]

{ #category : #accessing }
BrTreeNode >> parent [
	<return: #BrTreeNode>

	^ parent
]

{ #category : #accessing }
BrTreeNode >> parent: aBrTreeNode [
	parent := aBrTreeNode
]

{ #category : #printing }
BrTreeNode >> printOn: aStream [
	aStream print: self value
]

{ #category : #'api - adding / removing' }
BrTreeNode >> removeChildAt: aChildIndex [
	"If children values are not computed we should not delete anything because values will be properly computed lazily later"
	| aRemovedNode |
	childrenValues
		ifNil: [ ^ self onNodeChanged: self ].
	
	childrenValues := childrenValues
		copyReplaceFrom: aChildIndex
		to: aChildIndex
		with: #().

	"there are no children nodes, they will be computed later from updated children values"
	childrenNodes
		ifNil: [ ^ self onNodeChanged: self ].
	
	aRemovedNode := childrenNodes at: aChildIndex.
	
	"shift the indices of the rest of my children by -1"
	aChildIndex + 1 to: childrenNodes size do: [ :eachChildIndex | 
		(childrenNodes at: eachChildIndex)
			shiftIndexInChildrenBy: -1;
			shiftIndexInTreeBy: aRemovedNode size negated ].
		
	childrenNodes := childrenNodes
		copyReplaceFrom: aChildIndex
		to: aChildIndex
		with: #().

	"do not update my size if I am not expanded"
	self isExpanded
		ifTrue: [
			size := size - aRemovedNode size.
			self hasParent
				ifTrue: [ self parent onNodesDisappearedAfter: self amount: aRemovedNode size ] ].

	self onNodeChanged: self.
	self isExpanded
		ifTrue: [ self onChildRemoved: aRemovedNode size: aRemovedNode size ]
]

{ #category : #'api - adding / removing' }
BrTreeNode >> removeFromParent [
	self hasParent
		ifTrue: [ self parent removeChildAt: self indexInChildren ]
]

{ #category : #accessing }
BrTreeNode >> root [
	^ self hasParent
		ifTrue: [ self parent root ]
		ifFalse: [ self ]
]

{ #category : #private }
BrTreeNode >> shiftIndexInChildrenBy: aNumber [
	indexInChildren := indexInChildren + aNumber.
	self
		assert: [ indexInChildren >= 0 ]
		description: [ 'Index can not be negative' ].
]

{ #category : #private }
BrTreeNode >> shiftIndexInTreeBy: aNumber [
	indexInTree := indexInTree + aNumber.
	self
		assert: [ indexInTree >= 0 ]
		description: [ 'Index can not be negative' ].

	childrenNodes
		ifNotNil: [ :theNodes | theNodes do: [ :eachNode | eachNode shiftIndexInTreeBy: aNumber ] ]
]

{ #category : #accessing }
BrTreeNode >> size [
	"Return the current amount of expanded items in the tree"
	<return: #Number>
	
	^ size
]

{ #category : #'api - expandable' }
BrTreeNode >> toggle [
	self isExpanded
		ifTrue: [ self collapse ]
		ifFalse: [ self expand ]
]

{ #category : #enumeration }
BrTreeNode >> upToDepth: aMaxDepthLevel do: anOneArgBlock [
	self 
		assert: [ aMaxDepthLevel isInteger and: [ aMaxDepthLevel > 0 ] ] 
		description: [ 'Level index must be a natural number' ].

	self withAllChildrenNodesBreadthFirstDo: [ :eachNode | 
		eachNode depth >= aMaxDepthLevel
			ifTrue: [ ^ self ].
		anOneArgBlock value: eachNode ]
]

{ #category : #accessing }
BrTreeNode >> value [
	^ value
]

{ #category : #initialization }
BrTreeNode >> value: anObject computation: aComputationBlock [
	self value: anObject computation: aComputationBlock withSelf: true
]

{ #category : #initialization }
BrTreeNode >> value: anObject computation: aComputationBlock withSelf: shouldAccountForSelf [
	value := anObject.
	computation := aComputationBlock.
	
	size := shouldAccountForSelf asBit.
	indexInChildren := shouldAccountForSelf asBit.
	indexInTree := shouldAccountForSelf asBit
]

{ #category : #enumeration }
BrTreeNode >> withAllChildrenNodesBreadthFirst [
	| nodes |
	nodes := OrderedCollection new.
	self withAllChildrenNodesBreadthFirstDo: [ :e | nodes add: e ].
	^ nodes
]

{ #category : #enumeration }
BrTreeNode >> withAllChildrenNodesBreadthFirstDo: aBlock [ 
	aBlock value: self.
	self allChildrenNodesBreadthFirstDo: aBlock
]

{ #category : #enumeration }
BrTreeNode >> withAllChildrenNodesDepthFirstDo: aBlock [ 
	self allChildrenNodesDepthFirstDo: aBlock.
	aBlock value: self
]

{ #category : #enumeration }
BrTreeNode >> withAllChildrenNodesLinearDo: aBlock [
	aBlock value: self.
	self allChildrenNodesLinearDo: aBlock
]

{ #category : #enumeration }
BrTreeNode >> withAllParentNodes [
	| nodes |
	nodes := OrderedCollection new.
	self withAllParentNodesDo: [ :e | nodes add: e ].
	^ nodes
]

{ #category : #enumeration }
BrTreeNode >> withAllParentNodesDo: aBlock [
	self hasParent
		ifTrue: [ self parent withAllParentNodesDo: aBlock ].
	aBlock value: self
]
