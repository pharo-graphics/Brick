Class {
	#name : #BrGlamorousTabGroupLook,
	#superclass : #BrLook,
	#instVars : [
		'headerLook'
	],
	#category : #'Brick-Glamorous-Tabs'
}

{ #category : #'api - style' }
BrGlamorousTabGroupLook >> headerBackground: aBackground [
	headerLook headerDo: [ :aHeaderElement | aHeaderElement background: aBackground ]
]

{ #category : #initialization }
BrGlamorousTabGroupLook >> initialize [
	super initialize.

	self addAll: {
		headerLook := BrGlamorousTabGroupHeaderLook new.
		BrTabGroupSplitterLook new.
		BrTabGroupContentLook new.
		BrLayoutResizerLook inherit }.

	self addChangeProperty: #(widget layout) with: [ BlLinearLayout vertical ]
]
