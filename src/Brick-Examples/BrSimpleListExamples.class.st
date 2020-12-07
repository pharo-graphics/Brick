Class {
	#name : #BrSimpleListExamples,
	#superclass : #Object,
	#category : #'Brick-Examples-List'
}

{ #category : #examples }
BrSimpleListExamples >> allClasses [
	<gtExample>
	^ BrSimpleList new
		itemStencil: [
			BrLabel new
				"hMatchParent;"
				look: BrGlamorousLabelLook new + (BrStyleCommonLook new
					selected: [ :aStyle | aStyle background: Color veryVeryLightGray ]);
				padding: (BlInsets all: 5) ];
		itemDataBinder: [ :eachElement :eachClass :eachIndex | eachElement text: eachClass name ];
		items: (SystemNavigation new allClasses sorted: [ :a :b | a name < b name ])
]
