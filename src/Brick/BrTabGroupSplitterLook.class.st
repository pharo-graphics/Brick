Class {
	#name : #BrTabGroupSplitterLook,
	#superclass : #BrLook,
	#instVars : [
		'splitter'
	],
	#category : 'Brick-Tabs - Look'
}

{ #category : #initialization }
BrTabGroupSplitterLook >> initialize [
	super initialize.

	splitter := BlElement new labeled: 'Splitter'.
	splitter background: Color veryVeryLightGray.
	splitter elevation: (BlRelativeElevation elevation: -1).
	splitter constraintsDo: [ :c |
		c horizontal matchParent.
		c vertical exact: 1.
		c ignoreByLayout.
		c ignored vertical alignBottom ].

	self addChangeAddChildAs: #(header splitter) with: [ splitter ]
]

{ #category : #accessing }
BrTabGroupSplitterLook >> splitter [
	^ splitter
]

{ #category : #accessing }
BrTabGroupSplitterLook >> splitter: anObject [
	splitter := anObject
]

{ #category : #accessing }
BrTabGroupSplitterLook >> splitterDo: aBlock [
	aBlock value: self splitter
]
