Class {
	#name : #BrMatchedRule,
	#superclass : #Object,
	#instVars : [
		'selector',
		'declarations',
		'transitions',
		'conditions'
	],
	#classVars : [
		'AkStyleTransition'
	],
	#category : 'Brick-Style-Util'
}

{ #category : #'as yet unclassified' }
BrMatchedRule >> computedStyles [
	^ self declarations
		collect: [ :d | 
			BrStyle new
				selector: self selector;
				declaration: d;
				conditions: self conditions;
				yourself ]
]

{ #category : #'as yet unclassified' }
BrMatchedRule >> computedTransitions [
	^ self transitions
		collect: [ :t | BrStyleTransition new
				selector: self selector;
				transition: t;
				yourself ]
]

{ #category : #accessing }
BrMatchedRule >> conditions [
	^ conditions
]

{ #category : #accessing }
BrMatchedRule >> conditions: anObject [
	conditions := anObject
]

{ #category : #accessing }
BrMatchedRule >> declarations [
	^ declarations
]

{ #category : #accessing }
BrMatchedRule >> declarations: anObject [
	declarations := anObject
]

{ #category : #accessing }
BrMatchedRule >> selector [
	^ selector
]

{ #category : #accessing }
BrMatchedRule >> selector: anObject [
	selector := anObject
]

{ #category : #accessing }
BrMatchedRule >> specificity [
	^ selector specificity
]

{ #category : #accessing }
BrMatchedRule >> transitions [
	^ transitions
]

{ #category : #accessing }
BrMatchedRule >> transitions: anObject [
	transitions := anObject
]
