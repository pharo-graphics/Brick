Class {
	#name : #BrGlamorousTabGroupSwitcherLook,
	#superclass : #BrLook,
	#instVars : [
		'headerLook'
	],
	#category : #'Brick-Glamorous-Tabs'
}

{ #category : #'api - style' }
BrGlamorousTabGroupSwitcherLook >> headerBackground: aBackground [
	headerLook headerDo: [ :aHeaderElement | aHeaderElement background: aBackground ]
]

{ #category : #accessing }
BrGlamorousTabGroupSwitcherLook >> headerLook [
	<return: #BrGlamorousTabGroupSwitcherHeaderLook>
	^ headerLook
]

{ #category : #initialization }
BrGlamorousTabGroupSwitcherLook >> initialize [
	super initialize.

	self addAll: {
		BrTabGroupContentLook new.
		headerLook := BrGlamorousTabGroupSwitcherHeaderLook new.
		BrLayoutResizerLook inherit }.
	
	headerLook headerDo: [ :aHeader | 
		aHeader 
			constraintsDo: [ :c | 
				"c margin: (BlInsets all: -10)."
				c ignoreByLayout.
				c ignored horizontal alignCenter.
				c ignored vertical "alignTop" alignCenterAt: 0 ] ].
	
	self addChangeProperty: #(widget clipChildren) with: [ false ].
	self addChangeProperty: #(widget layout) with: [ BlLinearLayout vertical ].
]
