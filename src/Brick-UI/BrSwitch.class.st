Class {
	#name : #BrSwitch,
	#superclass : #BrButtonBase,
	#instVars : [
		'checked'
	],
	#category : 'Brick-UI-Switch'
}

{ #category : #accessing }
BrSwitch >> checked [
	^ self checkedProperty value
]

{ #category : #accessing }
BrSwitch >> checked: aBoolean [
	self checkedProperty value: aBoolean
]

{ #category : #accessing }
BrSwitch >> checkedProperty [
	^ checked ifNil: [ checked := BlObjectProperty on: self named: #checked default: false ]
]

{ #category : #'as yet unclassified' }
BrSwitch >> defaultController [
	^ BrSwitchController new 
]

{ #category : #'as yet unclassified' }
BrSwitch >> defaultSkin [
	^ BrSwitchSkin new
]
