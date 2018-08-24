Class {
	#name : #BrStyleRule,
	#superclass : #Object,
	#instVars : [
		'selectors',
		'declarations',
		'stylesheet',
		'transitions'
	],
	#category : 'Brick-Style-CSS'
}

{ #category : #'adding/removing' }
BrStyleRule >> addTo: aStylesheet [
	self stylesheet: aStylesheet.
	aStylesheet rules add: self
]

{ #category : #accessing }
BrStyleRule >> declarations [
	^ declarations
]

{ #category : #accessing }
BrStyleRule >> declarations: aDeclarationList [
	aDeclarationList
		do: [ :d | 
			d rule: self.
			d addTo: self ]
]

{ #category : #'as yet unclassified' }
BrStyleRule >> declare: anAssoc [
	self declare: anAssoc important: false
]

{ #category : #'as yet unclassified' }
BrStyleRule >> declare: anAssoc important: aBoolean [
	self declarations
		add:
			(BrStylePropertyDeclaration new
				property: anAssoc key;
				value: anAssoc value asBrStyleValue;
				rule: self;
				important: aBoolean;
				yourself)
]

{ #category : #'as yet unclassified' }
BrStyleRule >> declareTransition: anAssoc [
	self transitions
		add:
			(BrStyleTransitionDeclaration new
				property: anAssoc key;
				valuesFromArray: anAssoc value;
				rule: self;
				yourself)
]

{ #category : #'initialize-release' }
BrStyleRule >> initialize [
	super initialize.
	selectors := SortedCollection sortBlock: [ :s1 :s2 | s1 specificity >= s2 specificity ].
	declarations := OrderedCollection new.
	transitions := OrderedCollection new
]

{ #category : #accessing }
BrStyleRule >> origin [
	^ stylesheet origin
]

{ #category : #accessing }
BrStyleRule >> selectors [
	^ selectors
]

{ #category : #accessing }
BrStyleRule >> selectors: anObject [
	selectors := anObject.
	selectors do: [ :s | s rule: self ]
]

{ #category : #accessing }
BrStyleRule >> stylesheet [
	^ stylesheet
]

{ #category : #accessing }
BrStyleRule >> stylesheet: anObject [
	stylesheet := anObject
]

{ #category : #accessing }
BrStyleRule >> transitions [
	^ transitions
]

{ #category : #accessing }
BrStyleRule >> transitions: aTransitionList [
	aTransitionList
		do: [ :d | 
			d rule: self.
			d addTo: self ]
]
