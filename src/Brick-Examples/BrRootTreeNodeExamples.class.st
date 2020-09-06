Class {
	#name : #BrRootTreeNodeExamples,
	#superclass : #BrTreeNodeExamples,
	#category : #'Brick-Examples-Tree'
}

{ #category : #examples }
BrRootTreeNodeExamples >> onMany [
	<gtExample>
	| aNode |
	
	aNode := BrRootTreeNode onMany: { Collection } computed: [ :eachClass | eachClass subclasses ].
	aNode expand.
	
	self assert: aNode size equals: 1.
	self assert: aNode childrenNodes size equals: 1.
	self assert: aNode depth equals: 0.

	aNode expandUpTo: 2.
	
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

	aNode expandUpTo: 2.
	
	self assert: aNode size equals: 0.
	self assert: aNode childrenNodes size equals: 0.
	self assert: aNode depth equals: 0.

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

	aNode expandUpTo: 2.
	
	self assert: aNode size equals: Collection subclasses size + 1.
	self assert: aNode childrenNodes size equals: 1.
	self assert: aNode depth equals: 0.

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

	aNode expandUpTo: 2.
	
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
	self assert: aNode depth equals: 1.
	
	aNode expandUpTo: 2.
	
	self assert: aNode size equals: Collection subclasses size + 1.
	self assert: aNode childrenNodes size equals: Collection subclasses size.
	self assert: aNode depth equals: 1.
	
	^ aNode
]
