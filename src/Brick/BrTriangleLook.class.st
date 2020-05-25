Class {
	#name : #BrTriangleLook,
	#superclass : #BrInteractiveCommonLook,
	#instVars : [
		'triangle',
		'backgroundColor'
	],
	#category : #'Brick-Triangle - Look'
}

{ #category : #accessing }
BrTriangleLook >> backgroundColor [
	^ backgroundColor
]

{ #category : #accessing }
BrTriangleLook >> backgroundColor: anObject [
	backgroundColor := anObject
]

{ #category : #'api - configuration' }
BrTriangleLook >> beCollapsed [
	triangle 
		relocate: 3@2;
		geometry: (BlPolygon vertices: { 2@2 . 10@6 . 2@10 })
]

{ #category : #'api - configuration' }
BrTriangleLook >> beExpanded [
	triangle 
		relocate: 2@3;
		geometry: (BlPolygon vertices: { 2@2 . 10@2 . 6@10 })
]

{ #category : #defaults }
BrTriangleLook >> defaultTriangleBackgroundColor [
	^ Color gray
]

{ #category : #initialization }
BrTriangleLook >> initialize [
	super initialize.
	self initializeColors.
	self initializeTriangle.
	self initializeWidget.
]

{ #category : #initialization }
BrTriangleLook >> initializeColors [
	backgroundColor := self defaultTriangleBackgroundColor.
]

{ #category : #initialization }
BrTriangleLook >> initializeListeners [
	super initializeListeners.
	
	self when: BrExpansionChanged do: [ :anEvent | self onExpansionChanged: anEvent expanded ].
]

{ #category : #initialization }
BrTriangleLook >> initializeRequests [
	super initializeRequests.
	
	self request: BrExpansionStateRequest new.
]

{ #category : #initialization }
BrTriangleLook >> initializeTriangle [
	triangle := BlElement new.
	triangle size: 12@12.
	triangle background: self backgroundColor.
	self beCollapsed.
]

{ #category : #initialization }
BrTriangleLook >> initializeWidget [
	self 
		addChangeAddChildAs: #(content triangle) with: [ triangle ].
]

{ #category : #hooks }
BrTriangleLook >> onExpansionChanged: aBoolean [
	aBoolean 
		ifTrue: [ self beExpanded ] 
		ifFalse: [ self beCollapsed ]
]
