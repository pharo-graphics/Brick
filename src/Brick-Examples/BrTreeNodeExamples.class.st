Class {
	#name : #BrTreeNodeExamples,
	#superclass : #Object,
	#category : #'Brick-Examples-Tree'
}

{ #category : #'instance creation' }
BrTreeNodeExamples >> collapse_depth_1 [
	<gtExample>
	| aNode aCollapsedSubscription anAnnouncement |

	aNode := self expand_depth_1.
	aCollapsedSubscription := aNode announcer when: BrTreeNodeCollapsed do: [ :ann | anAnnouncement := ann ].
	
	aNode collapse.
	
	aNode announcer removeSubscription: aCollapsedSubscription.
	
	self assert: aNode isExpanded not.
	self assert: aNode childrenNodes size equals: 2.
	self assert: aNode size equals: 1.
	self assert: aNode hasParent not.

	self assert: anAnnouncement isNotNil.
	self assert: anAnnouncement node == aNode.
	self assert: anAnnouncement from equals: 1.
	self assert: anAnnouncement to equals: 3.
	

	^ aNode
]

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
	self assert: anAnnouncement from equals: 1.
	self assert: anAnnouncement to equals: 3.
	

	^ aNode
]
