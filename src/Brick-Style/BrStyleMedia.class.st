Class {
	#name : #BrStyleMedia,
	#superclass : #Object,
	#instVars : [
		'conditions',
		'rules',
		'stylesheet'
	],
	#category : 'Brick-Style-CSS'
}

{ #category : #'adding/removing' }
BrStyleMedia >> addTo: aStylesheet [
	self stylesheet: aStylesheet.
	aStylesheet medias add: self
]

{ #category : #'as yet unclassified' }
BrStyleMedia >> computedStyles [
	
]

{ #category : #accessing }
BrStyleMedia >> conditions [
	^ conditions
]

{ #category : #accessing }
BrStyleMedia >> conditions: aCollection [
	aCollection
		do: [ :item | 
			item media: self.
			self conditions add: item ]
]

{ #category : #'initialize-release' }
BrStyleMedia >> initialize [
	super initialize.
	conditions := OrderedCollection new.
	rules := OrderedCollection new
]

{ #category : #accessing }
BrStyleMedia >> rules [
	^ rules
]

{ #category : #accessing }
BrStyleMedia >> rules: anObject [
	rules := anObject
]

{ #category : #accessing }
BrStyleMedia >> stylesheet [
	^ stylesheet
]

{ #category : #accessing }
BrStyleMedia >> stylesheet: anObject [
	stylesheet := anObject
]
