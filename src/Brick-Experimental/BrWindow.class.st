Class {
	#name : #BrWindow,
	#superclass : #BrWidget,
	#instVars : [
		'title',
		'borderless',
		'resizable',
		'fullscreen',
		'root'
	],
	#category : 'Brick-Experimental-Window'
}

{ #category : #'as yet unclassified' }
BrWindow class >> in: aParentSpace [
	| w |
	w := self new.
	aParentSpace root: w.
	^ w
]

{ #category : #accessing }
BrWindow >> borderless [
	^ self borderlessProperty value
]

{ #category : #accessing }
BrWindow >> borderless: anObject [
	self borderlessProperty value: anObject
]

{ #category : #'accessing properties' }
BrWindow >> borderlessProperty [
	^ borderless ifNil: [ borderless := BlObjectProperty on: self named: #borderless default: false ]
]

{ #category : #displaying }
BrWindow >> close [
	self space close
]

{ #category : #'initialize-release' }
BrWindow >> defaultController [
	^ BrWindowController new 
]

{ #category : #'initialize-release' }
BrWindow >> defaultSkin [
	^ BrWindowSkin new
]

{ #category : #accessing }
BrWindow >> dirtyAreas [
	^ self space dirtyAreas
]

{ #category : #accessing }
BrWindow >> fullscreen [
	^ 	self space fullscreen
]

{ #category : #accessing }
BrWindow >> fullscreen: aBoolean [
	self space fullscreen: aBoolean
]

{ #category : #displaying }
BrWindow >> hide [
	self space hide
]

{ #category : #'initialize-release' }
BrWindow >> initialize [
	super initialize
]

{ #category : #displaying }
BrWindow >> maximize [ 
	self space maximize
]

{ #category : #displaying }
BrWindow >> minimize [
	self space minimize
]

{ #category : #'focus managing' }
BrWindow >> requestFocusFor: anElement [
	^ self space requestFocusFor: anElement
]

{ #category : #accessing }
BrWindow >> resizable [
	^ self space resizable
]

{ #category : #accessing }
BrWindow >> resizable: aBoolean [
	self space resizable: aBoolean
]

{ #category : #accessing }
BrWindow >> root [
	^ self rootProperty value
]

{ #category : #accessing }
BrWindow >> root: aRootChild [
	aRootChild space: self.
	self rootProperty value: aRootChild
]

{ #category : #'accessing properties' }
BrWindow >> rootProperty [
	^ root ifNil: [ root := BlObjectProperty on: self named: #root default: (BrPane new space: self) ]
]

{ #category : #displaying }
BrWindow >> show [
	self space show
]

{ #category : #accessing }
BrWindow >> title [
	^ self titleProperty value
]

{ #category : #accessing }
BrWindow >> title: anObject [
	self titleProperty value: anObject
]

{ #category : #'accessing properties' }
BrWindow >> titleProperty [
	^ title ifNil: [title := BlObjectProperty on: self named: #title default: 'New Window' ]
]

{ #category : #accessing }
BrWindow >> windowPosition [
	^ self space position
]

{ #category : #accessing }
BrWindow >> windowPosition: aPoint [
	self space position:aPoint
]
