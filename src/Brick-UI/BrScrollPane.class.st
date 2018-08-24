Class {
	#name : #BrScrollPane,
	#superclass : #BrPane,
	#instVars : [
		'content',
		'vbarPolicy',
		'hbarPolicy',
		'vMin',
		'vMax',
		'hMin',
		'hMax',
		'vValue',
		'hValue',
		'withButtons'
	],
	#category : 'Brick-UI-ScrollPane'
}

{ #category : #'as yet unclassified' }
BrScrollPane class >> content: anElement [
	^ self new
		content: anElement;
		yourself
]

{ #category : #initialization }
BrScrollPane >> beWithoutButtons [
	self withButtons: false.

]

{ #category : #accessing }
BrScrollPane >> content [
	^ self contentProperty value
]

{ #category : #accessing }
BrScrollPane >> content: anObject [
	 self contentProperty value: anObject
]

{ #category : #'accessing properties' }
BrScrollPane >> contentProperty [
	^ content ifNil: [ content := BlObjectProperty on: self named: #content default:BlElement new ]
]

{ #category : #initialization }
BrScrollPane >> defaultBarPolicy [
	^ BrScrollbarAsNeededPolicy new
]

{ #category : #initialization }
BrScrollPane >> defaultController [
	^ BrScrollPaneController new 
]

{ #category : #initialization }
BrScrollPane >> defaultSkin [
	^ BrScrollPaneSkin new
]

{ #category : #accessing }
BrScrollPane >> hMax [
	^ self hMaxProperty value
]

{ #category : #accessing }
BrScrollPane >> hMax: anObject [
	 self hMaxProperty value: anObject
]

{ #category : #'accessing properties' }
BrScrollPane >> hMaxProperty [
	^ hMax ifNil: [ hMax := BlObjectProperty on: self named: #hMax default: 1 ]
]

{ #category : #accessing }
BrScrollPane >> hMin [
	^ self hMinProperty value
]

{ #category : #accessing }
BrScrollPane >> hMin: anObject [
	 self hMinProperty value: anObject
]

{ #category : #'accessing properties' }
BrScrollPane >> hMinProperty [
	^ hMin ifNil: [ hMin := BlObjectProperty on: self named: #hMin default: 0 ]
]

{ #category : #accessing }
BrScrollPane >> hValue [
	^ self hValueProperty value
]

{ #category : #accessing }
BrScrollPane >> hValue: anObject [
	 self hValueProperty value: anObject
]

{ #category : #'accessing properties' }
BrScrollPane >> hValueProperty [
	^ hValue ifNil: [ hValue := BlObjectProperty on: self named: #hValue default: 0 ]
]

{ #category : #accessing }
BrScrollPane >> hbarPolicy [
	^ self hbarPolicyProperty value
]

{ #category : #accessing }
BrScrollPane >> hbarPolicy: anObject [
	self hbarPolicyProperty value: anObject
]

{ #category : #'accessing properties' }
BrScrollPane >> hbarPolicyProperty [
	^ hbarPolicy ifNil: [ hbarPolicy := BlObjectProperty on: self named: #hbarPolicy default: self defaultBarPolicy ]
]

{ #category : #accessing }
BrScrollPane >> vMax [
	^ self vMaxProperty value
]

{ #category : #accessing }
BrScrollPane >> vMax: anObject [
	 self vMaxProperty value: anObject
]

{ #category : #'accessing properties' }
BrScrollPane >> vMaxProperty [
	^ vMax ifNil: [ vMax := BlObjectProperty on: self named: #vMax default: 1 ]
]

{ #category : #accessing }
BrScrollPane >> vMin [
	^ self vMinProperty value
]

{ #category : #accessing }
BrScrollPane >> vMin: anObject [
	 self vMinProperty value: anObject
]

{ #category : #'accessing properties' }
BrScrollPane >> vMinProperty [
	^ vMin ifNil: [ vMin := BlObjectProperty on: self named: #vMin default: 0 ]
]

{ #category : #accessing }
BrScrollPane >> vValue [
	^ self vValueProperty value
]

{ #category : #accessing }
BrScrollPane >> vValue: anObject [
	 self vValueProperty value: anObject
]

{ #category : #'accessing properties' }
BrScrollPane >> vValueProperty [
	^ vValue ifNil: [ vValue := BlObjectProperty on: self named: #vValue default: 0 ]
]

{ #category : #accessing }
BrScrollPane >> vbarPolicy [
	^ self vbarPolicyProperty value
]

{ #category : #accessing }
BrScrollPane >> vbarPolicy: anObject [
	self vbarPolicyProperty value: anObject
]

{ #category : #'accessing properties' }
BrScrollPane >> vbarPolicyProperty [
	^ vbarPolicy ifNil: [ vbarPolicy := BlObjectProperty on: self named: #vbarPolicy default: self defaultBarPolicy ]
]

{ #category : #accessing }
BrScrollPane >> withButtons [
	^ self withButtonsProperty value
]

{ #category : #accessing }
BrScrollPane >> withButtons: anObject [
	self withButtonsProperty value: anObject
]

{ #category : #'accessing properties' }
BrScrollPane >> withButtonsProperty [
	^ withButtons ifNil: [ withButtons := BlObjectProperty on: self named: #withButtons default: false ]
]
