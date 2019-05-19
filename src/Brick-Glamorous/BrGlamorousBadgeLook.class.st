Class {
	#name : #BrGlamorousBadgeLook,
	#superclass : #BrInteractiveCommonLook,
	#instVars : [
		'contentContainer'
	],
	#category : #'Brick-Glamorous-Badge'
}

{ #category : #initialization }
BrGlamorousBadgeLook >> initialize [
	super initialize.
	self default: [ :aWidget | aWidget background: Color orange ].
	contentContainer := BlScalableElement new clipChildren: false.
	self
		add:
			(BrLayoutResizerLook new
				inherit;
				"for myself"
					inherit: contentContainer;
				exact: [ :aWidget | aWidget layoutDo: [ :aLayout | aLayout beLoose ] ];
				fitContent: [ :aWidget | aWidget layoutDo: [ :aLayout | aLayout beLoose ] ];
				matchParent: [ :aWidget | aWidget layoutDo: [ :aLayout | aLayout beTight ] ]).
	self addChangeAddChildAs: #(content) with: [ contentContainer ].
	self
		addChangeProperty: #(widget layout)
		with: [ (BlSquaredLayout on: BlLinearLayout vertical alignCenter) beLoose ]
]
