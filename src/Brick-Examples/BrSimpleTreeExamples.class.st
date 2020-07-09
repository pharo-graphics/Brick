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
		nodeStencil: [
			BrLabel new
				look: BrGlamorousLabelLook ];
		nodeDataBinder: [ :aNodeElement :aClass | aNodeElement text: aClass name ];
		items: { Collection }
		children: [ :eachClass | eachClass subclasses ].

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
		nodeDataBinder: [ :aNodeElement :eachaRope | aNodeElement text:eachaRope ].

	aTree
		items: { aRope }
		children: [ :eachRope | eachRope children ].

	^ aTree
]
