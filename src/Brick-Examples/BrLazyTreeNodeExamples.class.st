Class {
	#name : #BrLazyTreeNodeExamples,
	#superclass : #BrTreeNodeExamples,
	#category : #'Brick-Examples-Tree'
}

{ #category : #'instance creation' }
BrLazyTreeNodeExamples >> depth_1 [
	<gtExample>
	| aRope aNode |
	aRope := BlConcatenationRope
		left: (BlCollectionRope collection: 'Hello')
		right: (BlCollectionRope collection: 'World').
	aNode := BrLazyTreeNode new
		value: aRope
		computation: [ :eachRope | eachRope children ].
	self assert: aNode isExpanded not.
	self
		assert: aNode childrenValues
		equals: #().

	"they have never been expanded, so empty"
	self assert: aNode childrenNodes equals: #().
	self assert: aNode size equals: 1.
	self assert: aNode value == aRope.
	self assert: aNode hasParent not.
	self assert: (aNode at: 1) equals: aNode.
	^ aNode
]

{ #category : #'depth 5' }
BrLazyTreeNodeExamples >> depth_5 [
	<gtExample>
	| aRope aNode |
	aRope := self depth_5_rope.
	aNode := BrLazyTreeNode new
		value: aRope
		computation: [ :eachRope | eachRope children ].
	self assert: aNode isExpanded not.
	self
		assert: aNode childrenValues
		equals: #().

	"they have never been expanded, so empty"
	self assert: aNode childrenNodes equals: #().
	self assert: aNode size equals: 1.
	self assert: aNode value == aRope.
	self assert: aNode hasParent not.
	
	self assert: (aNode at: 1) equals: aNode.
	self assert: (aNode at: 1) indexInTree equals: 1.
	self assert: (aNode at: 1) indexInChildren equals: 1.

	^ aNode
]

{ #category : #'depth 5' }
BrLazyTreeNodeExamples >> depth_5_expand_1 [
	<gtExample>
	| aNode |

	aNode := self depth_5.
	aNode expand.

	self assert: aNode isExpanded.

	self assert: aNode size equals: 3.
	self assert: aNode hasParent not.
	self assert: aNode childrenNodes size equals: 2.
	
	self assert: (aNode at: 1) equals: aNode.
	self assert: (aNode at: 2) equals: aNode childrenNodes first.
	self assert: (aNode at: 3) equals: aNode childrenNodes second.
	
	self assert: (aNode at: 1) indexInChildren equals: 1.
	self assert: (aNode at: 2) indexInChildren equals: 1.
	self assert: (aNode at: 3) indexInChildren equals: 2.

	self assert: (aNode at: 1) indexInTree equals: 1.
	self assert: (aNode at: 2) indexInTree equals: 2.
	self assert: (aNode at: 3) indexInTree equals: 3.
	
	^ aNode
]

{ #category : #'depth 5' }
BrLazyTreeNodeExamples >> depth_5_expand_1_twice [
	<gtExample>
	| aNode |

	aNode := self depth_5_expand_1.
	aNode expand.

	self assert: aNode isExpanded.

	self assert: aNode size equals: 3.
	self assert: aNode hasParent not.
	self assert: aNode childrenNodes size equals: 2.

	self assert: (aNode at: 1) equals: aNode.
	self assert: (aNode at: 2) equals: aNode childrenNodes first.
	self assert: (aNode at: 3) equals: aNode childrenNodes second.
	
	self assert: (aNode at: 1) indexInChildren equals: 1.
	self assert: (aNode at: 2) indexInChildren equals: 1.
	self assert: (aNode at: 3) indexInChildren equals: 2.

	self assert: (aNode at: 1) indexInTree equals: 1.
	self assert: (aNode at: 2) indexInTree equals: 2.
	self assert: (aNode at: 3) indexInTree equals: 3.

	^ aNode
]

{ #category : #'depth 5' }
BrLazyTreeNodeExamples >> depth_5_expand_2 [
	<gtExample>
	| aNode aSubNode |

	aNode := self depth_5_expand_1.
	aSubNode := aNode at: 2.
	
	aSubNode expand.

	self assert: aNode isExpanded.
	self assert: aSubNode isExpanded.

	self assert: aNode size equals: 5.
	self assert: aNode hasParent not.
	self assert: aNode childrenNodes size equals: 2.
	self assert: aSubNode childrenNodes size equals: 2.

	self assert: (aNode at: 1) equals: aNode.
	self assert: (aNode at: 2) equals: aNode childrenNodes first.
	self assert: (aNode at: 2) equals: aSubNode.
	self assert: (aNode at: 3) equals: aSubNode childrenNodes first.
	self assert: (aNode at: 4) equals: aSubNode childrenNodes second.
	self assert: (aNode at: 5) equals: aNode childrenNodes second.
	
	self assert: (aNode at: 1) indexInChildren equals: 1.
	self assert: (aNode at: 2) indexInChildren equals: 1.
	self assert: (aNode at: 3) indexInChildren equals: 1.
	self assert: (aNode at: 4) indexInChildren equals: 2.
	self assert: (aNode at: 5) indexInChildren equals: 2.
	
	self assert: (aNode at: 1) indexInTree equals: 1.
	self assert: (aNode at: 2) indexInTree equals: 2.
	self assert: (aNode at: 3) indexInTree equals: 3.
	self assert: (aNode at: 4) indexInTree equals: 4.
	self assert: (aNode at: 5) indexInTree equals: 5.
	

	^ aNode
]
