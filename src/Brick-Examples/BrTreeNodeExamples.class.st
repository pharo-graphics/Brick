Class {
	#name : #BrTreeNodeExamples,
	#superclass : #Object,
	#category : #'Brick-Examples-Tree'
}

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
