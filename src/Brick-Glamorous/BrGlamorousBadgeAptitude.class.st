Class {
	#name : #BrGlamorousBadgeAptitude,
	#superclass : #BrStyleCommonAptitude,
	#instVars : [
		'contentContainer'
	],
	#category : #'Brick-Glamorous-Badge'
}

{ #category : #initialization }
BrGlamorousBadgeAptitude >> initialize [
	super initialize.

	contentContainer := BlScalableElement new clipChildren: false.

	self default: [ :aStyle | aStyle background: Color orange ].
	
	self add: (BrLayoutResizerAptitude new
		inherit;
		"for myself"
		inherit: contentContainer;
		exactDo: [ :aStyle | aStyle do: [ :aWidget | aWidget layoutDo: [ :aLayout | aLayout beLoose ] ] after: [  ] ];
		fitContentDo: [ :aStyle | aStyle do: [ :aWidget | aWidget layoutDo: [ :aLayout | aLayout beLoose ] ] after: [  ] ];
		matchParentDo: [ :aStyle | aStyle do: [ :aWidget | aWidget layoutDo: [ :aLayout | aLayout beTight ] ] after: [  ] ]).
	self addChangeAddChildAs: #(content) with: [ contentContainer ].
	self
		addChangeProperty: #(widget layout)
		with: [ (BlSquaredLayout on: BlLinearLayout vertical alignCenter) beLoose ]
]
