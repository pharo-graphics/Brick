Class {
	#name : #BrDevScripterButtonWithLabelChildEventTarget,
	#superclass : #BlDevScripterEventTarget,
	#instVars : [
		'buttonLabel'
	],
	#category : #'Brick-Examples-Scripter'
}

{ #category : #asserting }
BrDevScripterButtonWithLabelChildEventTarget >> assertButtonLabel: aString [ 
	self assert: aString isString description: 'Button label must be defined'.
	self assert: aString isNotEmpty description: 'Button label must be non-empty string'.

]

{ #category : #accessing }
BrDevScripterButtonWithLabelChildEventTarget >> buttonLabel [
	<return: #String>
	^ buttonLabel
]

{ #category : #accessing }
BrDevScripterButtonWithLabelChildEventTarget >> buttonLabel: aString [
	self assertButtonLabel: aString.
	buttonLabel := aString
]

{ #category : #searching }
BrDevScripterButtonWithLabelChildEventTarget >> findTargetIn: anElement [
	<return: #BlElement>
	self assertButtonLabel: self buttonLabel.
	^ BlDevScripterBlockSelectorEventTarget new 
		block: [ :aChild | aChild class = BrButton and: [ aChild label asString = self buttonLabel ] ];
		findTargetIn: anElement
]

{ #category : #accessing }
BrDevScripterButtonWithLabelChildEventTarget >> identifier [
	^ self buttonLabel 
		ifNotNil: [ BrButton name asString, ' label: ', self buttonLabel asString ]
		ifNil: [ self ]
]

{ #category : #printing }
BrDevScripterButtonWithLabelChildEventTarget >> printOn: aStream [
	self buttonLabel ifNil: [ ^ super printOn: aStream ].
	aStream 
		nextPutAll: 'Button Child: ';
		nextPutAll: self buttonLabel asString
]
