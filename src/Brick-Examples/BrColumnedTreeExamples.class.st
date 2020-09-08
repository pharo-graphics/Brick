Class {
	#name : #BrColumnedTreeExamples,
	#superclass : #Object,
	#category : #'Brick-Examples-Tree'
}

{ #category : #examples }
BrColumnedTreeExamples >> subclassesOfCollection [
	<gtExample>
	| aTree |
	aTree := BrColumnedTree new.
	aTree column
		title: 'Class';
		cellStencil: [ BrLabel new
				look: BrGlamorousLabelLook new;
				hMatchParent;
				vFitContent ];
		dataBinder: [ :aCellElement :aClass | aCellElement text: aClass name asString ].
	aTree column
		title: 'Package';
		cellStencil: [ BrLabel new
				look: BrGlamorousLabelLook new;
				hMatchParent;
				vFitContent ];
		dataBinder:
				[ :aCellElement :aClass | aCellElement text: aClass package name asString ].
	aTree items: {Collection} lazy: [ :eachClass | eachClass subclasses ].
	^ aTree
]

{ #category : #examples }
BrColumnedTreeExamples >> subropesTree [
	<gtExample>
	| aRope aTree |
	aRope := BlConcatenationRopeExamples new attributes_small_2_to_3.
	
	aTree := BrColumnedTree new.
	aTree column
		title: 'Text';
		width: 150;
		cellStencil: [ 
			BrLabel new 
				look: BrGlamorousLabelLook new ];
		dataBinder: [ :eachLabel :eachRope | eachLabel text: eachRope ].
		
	aTree column
		title: 'Length';
		weight: 2;
		cellStencil: [ 
			BrLabel new 
				look: BrGlamorousLabelLook new ];
		dataBinder: [ :eachLabel :eachRope | eachLabel text: eachRope size asString ].
		
	aTree 
		items: {aRope} 
		lazy: [ :eachRope | eachRope children ].
	
	^ aTree
]
