Class {
	#name : #BrGlamorousBadgeLook,
	#superclass : #BrStyleCommonLook,
	#instVars : [
		'contentContainer'
	],
	#category : #'Brick-Glamorous-Badge'
}

{ #category : #initialization }
BrGlamorousBadgeLook >> initialize [
	super initialize.

	contentContainer := BlScalableElement new clipChildren: false.

	self default: [ :aStyle | aStyle background: Color orange ].
	
	self add: (BrLayoutResizerLook new
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
