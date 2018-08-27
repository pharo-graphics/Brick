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
	
	splitter := BlElement new.
	splitter background: Color veryVeryLightGray.
	splitter constraintsDo: [ :c |
		c horizontal matchParent.
		c vertical exact: 1 ]
]

{ #category : #initialization }
BrTabGroupSplitterLook >> initializeLook [
	super initializeLook.
	
	self widget addChild: splitter as: #splitter
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
