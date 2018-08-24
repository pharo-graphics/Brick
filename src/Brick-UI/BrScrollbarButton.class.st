Class {
	#name : #BrScrollbarButton,
	#superclass : #BlElement,
	#category : 'Brick-UI-Scrollbar'
}

{ #category : #'as yet unclassified' }
BrScrollbarButton >> beAtBottom [
	self constraintsDo: [ :c | c linear vertical alignBottom ].
	self geometry: BrMdIcons chevronDownSvg
]

{ #category : #'as yet unclassified' }
BrScrollbarButton >> beAtLeft [
	self constraintsDo: [ :c | 
		c linear vertical alignCenter.
		c linear horizontal alignLeft ].
	self geometry: BrMdIcons chevronLeftSvg
]

{ #category : #'as yet unclassified' }
BrScrollbarButton >> beAtRight [
	self constraintsDo: [ :c | 
		c linear vertical alignCenter.
		c linear horizontal alignRight  ].
	self geometry: BrMdIcons chevronRightSvg
]

{ #category : #'as yet unclassified' }
BrScrollbarButton >> beAtTop [
	self constraintsDo: [ :c | c linear vertical alignTop ].
	self geometry: BrMdIcons chevronUpSvg
]

{ #category : #'as yet unclassified' }
BrScrollbarButton >> initialize [
	super initialize.
	self background: Color lightGray
]
