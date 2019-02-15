Class {
	#name : #BrTreeNodeExamples,
	#superclass : #Object,
	#category : #'Brick-Examples-Tree'
}

{ #category : #'instance creation' }
BrTreeNodeExamples >> depth_1 [
	<gtExample>
	| aRope aNode |
	
	aRope := BlConcatenationRope
		left: (BlCollectionRope collection: 'Hello')
		right: (BlCollectionRope collection: 'World').

	aNode := BrTreeNode on: aRope computed: [ :eachRope | eachRope children ].
	
	self assert: aNode isExpanded not.
	self assert: aNode children equals: { aRope left . aRope right }.
	
	"they have never been expanded, so empty"
	self assert: aNode childrenNodes equals: #().
	
	self assert: aNode size equals: 1.
	self assert: aNode value == aRope.
	self assert: aNode hasParent not.
	
	^ aNode
]

{ #category : #'instance creation' }
BrTreeNodeExamples >> expand_depth_1 [
	<gtExample>
	| aNode |

	aNode := self depth_1.
	aNode expand.
	
	self assert: aNode isExpanded.

	self assert: aNode childrenNodes size equals: 2.
	
	self assert: aNode size equals: 3.
	self assert: aNode hasParent not.

	^ aNode
]
