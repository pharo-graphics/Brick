Class {
	#name : #BrCheckbox,
	#superclass : #BrButtonBase,
	#instVars : [
		'checked',
		'indeterminate'
	],
	#category : 'Brick-UI-Checkbox'
}

{ #category : #accessing }
BrCheckbox >> checked [
	^ self checkedProperty value
]

{ #category : #accessing }
BrCheckbox >> checked: aBoolean [
	self checkedProperty value: aBoolean
]

{ #category : #accessing }
BrCheckbox >> checkedProperty [
	^ checked ifNil: [ checked := BlObjectProperty on: self named: #checked default: false ]
]

{ #category : #'as yet unclassified' }
BrCheckbox >> defaultController [
	^ BrCheckboxController new 
]

{ #category : #'as yet unclassified' }
BrCheckbox >> defaultSkin [
	^ BrCheckboxSkin new
]

{ #category : #accessing }
BrCheckbox >> indeterminate [
	^ self indeterminateProperty value
]

{ #category : #accessing }
BrCheckbox >> indeterminate: aBoolean [
	self indeterminateProperty value: aBoolean
]

{ #category : #accessing }
BrCheckbox >> indeterminateProperty [
	^ indeterminate ifNil: [ indeterminate := BlObjectProperty on: self named: #indeterminate default: false ]
]
