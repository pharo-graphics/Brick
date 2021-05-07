Class {
	#name : #BrTabGroupSplitterAptitude,
	#superclass : #BrAptitude,
	#instVars : [
		'splitter'
	],
	#category : #'Brick-Tabs - Look'
}

{ #category : #initialization }
BrTabGroupSplitterAptitude >> initialize [
	super initialize.

	splitter := BlElement new labeled: 'Splitter'.
	splitter background: BrGlamorousColors lightBorderColor.
	splitter elevation: (BlRelativeElevation elevation: -1).
	splitter constraintsDo: [ :c |
		c horizontal matchParent.
		c vertical exact: 1.
		c ignoreByLayout.
		c ignored vertical alignBottom ].

	self addChangeAddChildAs: #(header splitter) with: [ splitter ]
]

{ #category : #accessing }
BrTabGroupSplitterAptitude >> splitter [
	^ splitter
]

{ #category : #accessing }
BrTabGroupSplitterAptitude >> splitter: anObject [
	splitter := anObject
]

{ #category : #accessing }
BrTabGroupSplitterAptitude >> splitterDo: aBlock [
	aBlock value: self splitter
]
