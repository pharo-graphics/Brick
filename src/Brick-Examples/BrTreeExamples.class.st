Class {
	#name : #BrTreeExamples,
	#superclass : #Object,
	#category : #'Brick-Examples-Tree'
}

{ #category : #'as yet unclassified' }
BrTreeExamples >> rawTree [
	<gtExample>
	| treeElement aRope aRootNode |

	treeElement := BrInfiniteTreeElement new.
	treeElement dataSource rowStencilBuilder: [ :aNode :anIndex |
		| aContainer |

		aContainer := BlElement new.
		aContainer padding: (BlInsets left: aNode depth * 15).
		aContainer constraintsDo: [ :c |
			c horizontal matchParent.
			c vertical fitContent ].
		aContainer layout: BlLinearLayout horizontal alignCenterLeft.

		aContainer addChild: (
			BlElement new
				background: (aNode isEmpty ifTrue: [ Color transparent ] ifFalse: [ Color gray ]);
				margin: (BlInsets all: 5);
				when: BlClickEvent do: [ :anEvent | anEvent consumed: true. aNode toggle ];
				size: 12@12).

		aContainer addChild: (BlTextElement new text: aNode value gtDisplayString asRopedText).

		aContainer ].

	treeElement constraintsDo: [ :c |
		c horizontal matchParent.
		c vertical matchParent ].

	aRope := BlConcatenationRopeExamples new attributes_small_2_to_3.

	aRootNode := BrTreeNode on: aRope computed: [ :eachRope | eachRope children ].
	aRootNode expand.

	treeElement dataSource rootNode: aRootNode.
	treeElement dataSource treeElement: treeElement.

	^ treeElement
]

{ #category : #'as yet unclassified' }
BrTreeExamples >> widgetColumnedTree [
	<gtExample>
	|  aRope aTree |
	
	aRope := BlConcatenationRopeExamples new attributes_small_2_to_3.

	aTree := BrColumnedTree new.
	aTree root: aRope computed: [ :eachRope | eachRope children ].
	aTree column
		title: 'Text';
		width: 150;
		stencil: [ :aTreeNode | BrColumnCellLabelStencil new text: aTreeNode value ].
	aTree column
		title: 'Length';
		weight: 2;
		stencil: [ :aTreeNode | BrColumnCellLabelStencil new text: aTreeNode value size asString ].

	^ aTree
]

{ #category : #'as yet unclassified' }
BrTreeExamples >> widgetTree [
	<gtExample>
	|  aRope aTree |
	
	aRope := BlConcatenationRopeExamples new attributes_small_2_to_3.

	aTree := BrSimpleTree new.
	aTree root: aRope computed: [ :eachRope | eachRope children ].

	^ aTree
]
