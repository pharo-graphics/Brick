Class {
	#name : #BrSimpleTreeExamples,
	#superclass : #Object,
	#category : #'Brick-Examples-Tree'
}

{ #category : #examples }
BrSimpleTreeExamples >> subclassesOfCollection [
	<gtExample>
	| aTree |
	aTree := BrSimpleTree new
		nodeStencil: [ BrLabel new look: BrGlamorousLabelLook ];
		nodeDataBinder: [ :aNodeElement :aClass | aNodeElement text: aClass name ];
		items: {Collection} lazy: [ :eachClass | eachClass subclasses ].
	^ aTree
]

{ #category : #examples }
BrSimpleTreeExamples >> subclassesOfCollection_InefficientUse [
	<gtExample>
	| aTree |
	aTree := BrSimpleTree new
		stencil: [ :eachClass :eachIndex | 
			BrLabel new
				look: BrGlamorousLabelLook;
				text: eachClass name;
				fitContent ];
		items: {Collection} lazy: [ :eachClass | eachClass subclasses ].
	^ aTree
]

{ #category : #examples }
BrSimpleTreeExamples >> subclassesOfCollection_immediate [
	<gtExample>
	| aTree |

	aTree := BrSimpleTree new.
	aTree
		nodeStencil: [
			BrHorizontalPane new
				vFitContent;
				hMatchParent;
				alignCenterLeft;
				cellSpacing: 5;
				addChild: (BrLabel new look: BrGlamorousLabelLook) as: #label;
				addChild: (BrButton new beTiny; look: BrGlamorousButtonWithLabelLook new; label: 'Add child') as: #add;
				addChild: (BrButton new beTiny; look: BrGlamorousButtonWithLabelLook new; label: 'Delete') as: #delete ];
		nodeDataBinder: [ :aNodeElement :aClass :aTreeNode |
			(aNodeElement childNamed: #label) text: aClass printString.
			(aNodeElement childNamed: #delete)
				action: [ aTreeNode removeFromParent ].
			(aNodeElement childNamed: #add)
				action: [
					aTreeNode
						insert: Smalltalk allClasses atRandom
						atChildIndex: 1.
					aTreeNode expand ] ];
		items: { Collection }
			immediate: [ :eachClass | eachClass subclasses ].

	^ aTree
]

{ #category : #examples }
BrSimpleTreeExamples >> subropesTree [
	<gtExample>
	| aRope aTree |
	aRope := BlConcatenationRopeExamples new attributes_small_2_to_3.
	
	aTree := BrSimpleTree new
		nodeStencil: [ 
			BrLabel new 
			look: BrGlamorousLabelLook ];
		nodeDataBinder: [ :aNodeElement :eachaRope | aNodeElement text: eachaRope ].
		
	aTree 
		items: {aRope} 
		lazy: [ :eachRope | eachRope children ].
	^ aTree
]
