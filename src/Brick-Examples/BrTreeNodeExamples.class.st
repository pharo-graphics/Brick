Class {
	#name : #BrTreeNodeExamples,
	#superclass : #Object,
	#category : #'Brick-Examples-Tree'
}

{ #category : #'instance creation' }
BrTreeNodeExamples >> collapse_depth_1 [
	<noTest>
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
BrTreeNodeExamples >> depth_1 [
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
BrTreeNodeExamples >> depth_2 [
	<gtExample>
	| aRope aNode |
	aRope := BlConcatenationRope
		left:
			(BlConcatenationRope
				left:
					(BlConcatenationRope
						left:
							(BlConcatenationRope
								left: (BlCollectionRope collection: 'H')
								right: (BlCollectionRope collection: 'e'))
						right: (BlCollectionRope collection: 'l'))
				right:
					(BlConcatenationRope
						left: (BlCollectionRope collection: 'l')
						right: (BlCollectionRope collection: 'o')))
		right:
			(BlConcatenationRope
				left:
					(BlConcatenationRope
						left:
							(BlConcatenationRope
								left: (BlCollectionRope collection: 'W')
								right: (BlCollectionRope collection: 'o'))
						right: (BlCollectionRope collection: 'r'))
				right:
					(BlConcatenationRope
						left: (BlCollectionRope collection: 'l')
						right: (BlCollectionRope collection: 'd'))).
	aNode := BrRootTreeNode
		onMany: aRope
		computed: [ :eachRope | eachRope children ].
	self assert: aNode isExpanded not.
	self assert: aNode childrenValues equals: #().

	"they have never been expanded, so empty"
	self assert: aNode childrenNodes equals: #().
	self assert: aNode size equals: 0.
	self assert: aNode value == aRope.
	self assert: aNode hasParent not.
	^ aNode
]

{ #category : #'instance creation' }
BrTreeNodeExamples >> depth_5_rope [
	<gtExample>

	^ BlConcatenationRope
		left: (BlConcatenationRope
			left: (BlConcatenationRope
				left: (BlConcatenationRope
					left: (BlCollectionRope collection: 'H')
					right: (BlCollectionRope collection: 'e'))
				right: (BlCollectionRope collection: 'l'))
			right: (BlConcatenationRope
				left: (BlCollectionRope collection: 'l')
				right: (BlCollectionRope collection: 'o')))
		right: (BlConcatenationRope
			left: (BlConcatenationRope
				left: (BlConcatenationRope
					left: (BlCollectionRope collection: 'W')
					right: (BlCollectionRope collection: 'o'))
				right: (BlCollectionRope collection: 'r'))
			right: (BlConcatenationRope
				left: (BlCollectionRope collection: 'l')
				right: (BlCollectionRope collection: 'd')))
]

{ #category : #'instance creation' }
BrTreeNodeExamples >> expand_depth_1 [
	<noTest>
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
