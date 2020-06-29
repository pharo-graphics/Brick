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

{ #category : #initialization }
BrGlamorousTabGroupSwitcherLook >> initialize [
	super initialize.

	self addAll: {
		headerLook := BrGlamorousTabGroupSwitcherHeaderLook new.
		BrTabGroupSplitterLook new.
		BrTabGroupContentLook new.
		BrLayoutResizerLook inherit }.
	
	self addChangeProperty: #(widget layout) with: [ BlLinearLayout vertical ]
]
