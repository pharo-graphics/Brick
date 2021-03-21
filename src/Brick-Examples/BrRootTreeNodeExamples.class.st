Class {
	#name : #BrRootTreeNodeExamples,
	#superclass : #BrTreeNodeExamples,
	#category : #'Brick-Examples-Tree'
}

{ #category : #'instance creation' }
BrRootTreeNodeExamples >> collapse_depth_1 [
	<gtExample>
	| aNode aCollapsedSubscription anAnnouncement |

	aNode := self expand_depth_1.
	aCollapsedSubscription := aNode announcer when: BrTreeNodeCollapsed do: [ :ann | anAnnouncement := ann ].
	
	aNode collapse.
	
	aNode announcer removeSubscription: aCollapsedSubscription.
	
	self assert: aNode isExpanded not.
	self assert: aNode childrenNodes size equals: 0.
	self assert: aNode size equals: 1.
	self assert: aNode hasParent not.

	self assert: anAnnouncement isNotNil.
	self assert: anAnnouncement node == aNode.
	self assert: anAnnouncement from equals: 2.
	self assert: anAnnouncement to equals: 3.
	
	^ aNode
]

{ #category : #'instance creation' }
BrRootTreeNodeExamples >> depth_1 [
	<gtExample>
	| aRope aNode |

	aRope := BlConcatenationRope
		left: (BlCollectionRope collection: 'Hello')
		right: (BlCollectionRope collection: 'World').

	aNode := BrRootTreeNode onOne: aRope  computed: [ :eachRope | eachRope children ].

	self assert: aNode isExpanded not.
	self assert: aNode childrenValues equals: #().

	"they have never been expanded, so empty"
	self assert: aNode childrenNodes equals: #().

	self assert: aNode size equals: 1.
	self assert: aNode value == aRope.
	self assert: aNode hasParent not.

	self assert: (aNode at: 1) equals: aNode.

	^ aNode
]

{ #category : #'instance creation' }
BrRootTreeNodeExamples >> expand_depth_1 [
	<gtExample>
	| aNode anExpandedSubscription anAnnouncement |

	aNode := self depth_1.
	anExpandedSubscription := aNode announcer when: BrTreeNodeExpanded do: [ :ann | anAnnouncement := ann ].

	aNode expand.
	
	aNode announcer removeSubscription: anExpandedSubscription.
	
	self assert: aNode isExpanded.
	self assert: aNode childrenNodes size equals: 2.
	self assert: aNode size equals: 3.
	self assert: aNode hasParent not.

	self assert: anAnnouncement isNotNil.
	self assert: anAnnouncement node == aNode.
	self assert: anAnnouncement from equals: 2.
	self assert: anAnnouncement to equals: 3.

	self assert: (aNode at: 1) equals: aNode.
	self assert: (aNode at: 2) equals: aNode childrenNodes first.
	self assert: (aNode at: 3) equals: aNode childrenNodes second.
	

	^ aNode
]

{ #category : #examples }
BrRootTreeNodeExamples >> onMany [
	<gtExample>
	| aNode |
	
	aNode := BrRootTreeNode onMany: { Collection } computed: [ :eachClass | eachClass subclasses ].
	aNode expand.
	
	self assert: aNode size equals: 1.
	self assert: aNode childrenNodes size equals: 1.
	self assert: aNode depth equals: 0.

	aNode expandUpTo: 1.
	
	self assert: aNode size equals: Collection subclasses size + 1.
	self assert: aNode childrenNodes size equals: 1.
	self assert: aNode depth equals: 0.

	^ aNode
]

{ #category : #examples }
BrRootTreeNodeExamples >> onManyEmpty_expandUpTo [
	<gtExample>
	| aNode |
	
	aNode := BrRootTreeNode onMany: { } computed: [ :eachClass | eachClass subclasses ].
	
	self assert: aNode size equals: 0.
	self assert: aNode childrenNodes size equals: 0.
	self assert: aNode depth equals: 0.

	aNode expandUpTo: 1.
	
	self assert: aNode size equals: 0.
	self assert: aNode childrenNodes size equals: 0.
	self assert: aNode depth equals: 0.

	^ aNode
]

{ #category : #examples }
BrRootTreeNodeExamples >> onMany_expandSuchThat [
	<gtExample>
	| aNode expandedCount |
	
	aNode := BrRootTreeNode 
		onMany: { self depth_5_rope } 
		computed: [ :eachRope | eachRope children ].
	
	self assert: aNode isExpanded not.
	self assert: aNode size equals: 0.
	self assert: aNode childrenNodes size equals: 0.
	self assert: aNode depth equals: 0.

	aNode expandSuchThat: [ :eachNode | 
		"all nodes that ends with 'lo' or 'ld'"
		| aRope |
		aRope := eachNode value.
		aRope size > 1 and: [ 
			((aRope at: aRope size - 1) = $l) and: [ 
				#( $o $d ) includes: (aRope at: aRope size) ] ] ].
	
	expandedCount := 0.
	aNode withAllChildrenNodesBreadthFirstDo: [ :eachNode |
		expandedCount := expandedCount + eachNode isExpanded asBit ].
	
	self assert: expandedCount equals: 6.
	
	^ aNode
]

{ #category : #examples }
BrRootTreeNodeExamples >> onMany_expandUpTo [
	<gtExample>
	| aNode |
	
	aNode := BrRootTreeNode onMany: { Collection } computed: [ :eachClass | eachClass subclasses ].
	
	self assert: aNode size equals: 0.
	self assert: aNode childrenNodes size equals: 0.
	self assert: aNode depth equals: 0.

	aNode expandUpTo: 1.
	
	self assert: aNode size equals: Collection subclasses size + 1.
	self assert: aNode childrenNodes size equals: 1.
	self assert: aNode depth equals: 0.

	^ aNode
]

{ #category : #examples }
BrRootTreeNodeExamples >> onMany_immediate_expandSuchThat [
	<gtExample>
	| aNode expandedCount |
	
	aNode := BrRootTreeNode 
		onMany: { self depth_5_rope } 
		immediate: [ :eachRope | eachRope children ].

	self assert: aNode isExpanded not.	
	self assert: aNode size equals: 0.
	self assert: aNode childrenNodes size equals: 0.
	self assert: aNode depth equals: 0.

	aNode expandSuchThat: [ :eachNode | 
		"all nodes that ends with 'lo' or 'ld'"
		| aRope |
		aRope := eachNode value.
		aRope size > 1 and: [ 
			((aRope at: aRope size - 1) = $l) and: [ 
				#( $o $d ) includes: (aRope at: aRope size) ] ] ].
	
	expandedCount := 0.
	aNode withAllChildrenNodesBreadthFirstDo: [ :eachNode |
		expandedCount := expandedCount + eachNode isExpanded asBit ].
	
	self assert: expandedCount equals: 6.

	^ aNode
]

{ #category : #examples }
BrRootTreeNodeExamples >> onMany_immediate_expandUpTo [
	<gtExample>
	| aNode |
	
	aNode := BrRootTreeNode onMany: { Collection } immediate: [ :eachClass | eachClass subclasses ].
	
	self assert: aNode size equals: 0.
	self assert: aNode childrenNodes size equals: 0.
	self assert: aNode depth equals: 0.

	aNode expandUpTo: 1.
	
	self assert: aNode size equals: Collection subclasses size + 1.
	self assert: aNode childrenNodes size equals: 1.
	self assert: aNode depth equals: 0.

	^ aNode
]

{ #category : #examples }
BrRootTreeNodeExamples >> onOne [
	<gtExample>
	| aNode |
	
	aNode := BrRootTreeNode onOne: Collection computed: [ :eachClass | eachClass subclasses ].
	aNode expand.
	
	self assert: aNode size equals: Collection subclasses size + 1.
	self assert: aNode childrenNodes size equals: Collection subclasses size.
	self assert: aNode depth equals: 0.
	
	aNode expandUpTo: 1.
	
	self assert: aNode size equals: Collection subclasses size + 1.
	self assert: aNode childrenNodes size equals: Collection subclasses size.
	self assert: aNode depth equals: 0.
	
	^ aNode
]

{ #category : #examples }
BrRootTreeNodeExamples >> onOne_expandSuchThat [
	<gtExample>
	| aNode expandedCount |
	
	aNode := BrRootTreeNode 
		onOne: self depth_5_rope
		computed: [ :eachRope | eachRope children ].
	
	self assert: aNode isExpanded not.
	self assert: aNode size equals: 1.
	self assert: aNode childrenNodes size equals: 0.
	self assert: aNode depth equals: 0.

	aNode expandSuchThat: [ :eachNode | 
		"all nodes that ends with 'lo' or 'ld'"
		| aRope |
		aRope := eachNode value.
		aRope size > 1 and: [ 
			((aRope at: aRope size - 1) = $l) and: [ 
				#( $o $d ) includes: (aRope at: aRope size) ] ] ].
	
	expandedCount := 0.
	aNode withAllChildrenNodesBreadthFirstDo: [ :eachNode |
		expandedCount := expandedCount + eachNode isExpanded asBit ].
	
	self assert: expandedCount equals: 5.
	
	^ aNode
]

{ #category : #examples }
BrRootTreeNodeExamples >> onOne_immediate_expandSuchThat [
	<gtExample>
	| aNode expandedCount |
	
	aNode := BrRootTreeNode 
		onOne: self depth_5_rope
		immediate: [ :eachRope | eachRope children ].

	self assert: aNode isExpanded not.	
	self assert: aNode size equals: 1.
	self assert: aNode childrenNodes size equals: 0.
	self assert: aNode depth equals: 0.

	aNode expandSuchThat: [ :eachNode | 
		"all nodes that ends with 'lo' or 'ld'"
		| aRope |
		aRope := eachNode value.
		aRope size > 1 and: [ 
			((aRope at: aRope size - 1) = $l) and: [ 
				#( $o $d ) includes: (aRope at: aRope size) ] ] ].
	
	expandedCount := 0.
	aNode withAllChildrenNodesBreadthFirstDo: [ :eachNode |
		expandedCount := expandedCount + eachNode isExpanded asBit ].
	
	self assert: expandedCount equals: 5.

	^ aNode
]
