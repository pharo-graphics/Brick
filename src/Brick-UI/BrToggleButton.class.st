Class {
	#name : #BrToggleButton,
	#superclass : #BrButtonBase,
	#instVars : [
		'groupProperty',
		'selectedProperty'
	],
	#category : 'Brick-UI-Toggle'
}

{ #category : #'as yet unclassified' }
BrToggleButton >> defaultController [
	^ BrToggleButtonController new 
]

{ #category : #'as yet unclassified' }
BrToggleButton >> defaultSkin [
	^ BrToggleButtonSkin new
]

{ #category : #accessing }
BrToggleButton >> group [
	^ self groupProperty value
]

{ #category : #accessing }
BrToggleButton >> group: aGroup [
	aGroup addToggle: self.
	self groupProperty value: aGroup
]

{ #category : #accessing }
BrToggleButton >> groupProperty [
	^ groupProperty ifNil: [ groupProperty := BlObjectProperty on: self named: #group ]
]

{ #category : #accessing }
BrToggleButton >> groupProperty: anObject [
	groupProperty := anObject
]

{ #category : #accessing }
BrToggleButton >> isSelected [
	^ self selected
]

{ #category : #accessing }
BrToggleButton >> selected [
	 ^ self selectedProperty value
]

{ #category : #accessing }
BrToggleButton >> selected: aBoolean [
	self selectedProperty value: aBoolean
]

{ #category : #accessing }
BrToggleButton >> selectedProperty [
	^ selectedProperty
		ifNil: [ selectedProperty := BlObjectProperty on: self named: #selected default: false ]
]

{ #category : #accessing }
BrToggleButton >> selectedProperty: anObject [
	selectedProperty := anObject
]
