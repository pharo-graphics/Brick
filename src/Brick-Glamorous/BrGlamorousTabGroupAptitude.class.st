Class {
	#name : #BrGlamorousTabGroupAptitude,
	#superclass : #BrAptitude,
	#instVars : [
		'headerLook'
	],
	#category : #'Brick-Glamorous-Tabs'
}

{ #category : #'api - style' }
BrGlamorousTabGroupAptitude >> headerBackground: aBackground [
	headerLook headerDo: [ :aHeaderElement | aHeaderElement background: aBackground ]
]

{ #category : #initialization }
BrGlamorousTabGroupAptitude >> initialize [
	super initialize.

	self addAll: {
		headerLook := BrGlamorousTabGroupHeaderAptitude new.
		BrTabGroupSplitterAptitude new.
		BrTabGroupContentAptitude new.
		BrLayoutResizerAptitude inherit }.

	self addChangeProperty: #(widget layout) with: [ BlLinearLayout vertical ]
]
