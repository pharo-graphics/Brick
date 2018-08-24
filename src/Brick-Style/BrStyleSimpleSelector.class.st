Class {
	#name : #BrStyleSimpleSelector,
	#superclass : #BrStyleSelector,
	#instVars : [
		'name',
		'styleClasses',
		'id',
		'pseudoClasses',
		'idCount',
		'styleClassCount',
		'nameCount',
		'pseudoClassCount'
	],
	#category : 'Brick-Style-CSS'
}

{ #category : #testing }
BrStyleSimpleSelector >> = aSelector [
	^ (aSelector isSimpleSelector) and:[
		((self name = aSelector name 
		and: [ self id = aSelector id ]) 
		and: [ self pseudoClasses = aSelector pseudoClasses ])
		and: [ self styleClasses = aSelector styleClasses ]]
]

{ #category : #accessing }
BrStyleSimpleSelector >> id [
	^ id
]

{ #category : #accessing }
BrStyleSimpleSelector >> id: anObject [
	id := anObject
]

{ #category : #accessing }
BrStyleSimpleSelector >> idCount [
	^ idCount
]

{ #category : #accessing }
BrStyleSimpleSelector >> initialize [
	super initialize.
	pseudoClasses := OrderedCollection new.
	styleClasses := OrderedCollection new
]

{ #category : #testing }
BrStyleSimpleSelector >> isSimpleSelector [
	^ true
]

{ #category : #testing }
BrStyleSimpleSelector >> matchesPseudoClasseState: aPseudoClassState [
	^ aPseudoClassState includesAll: pseudoClasses
]

{ #category : #testing }
BrStyleSimpleSelector >> matchesStyleClasses: aStyleClassList [
	^ aStyleClassList includesAll: styleClasses
]

{ #category : #testing }
BrStyleSimpleSelector >> matchesStyleable: aStyleable [
	self matchesOnName
		ifTrue: [ (self nameMatches: aStyleable className) ifFalse: [ ^ false ] ].
	self matchesOnId
		ifTrue: [self id = aStyleable styleId ifFalse: [ ^ false ] ].
	self matchesOnStyleClass
		ifTrue:[(self matchesStyleClasses: aStyleable styleClasses ) ifFalse: [ ^ false ] ].
	^ true
]

{ #category : #testing }
BrStyleSimpleSelector >> matchesStyleable: aStyleable pseudoClassStates: aPseudoClassStateList [
	^ self
		matchesStyleable: aStyleable
		pseudoClassStates: aPseudoClassStateList
		selectorIndex: aPseudoClassStateList size
]

{ #category : #testing }
BrStyleSimpleSelector >> matchesStyleable: aStyleable pseudoClassStates: aPseudoClassStateList selectorIndex: aSelectorIndex [
	(self matchesStyleable: aStyleable) ifFalse: [ ^ false ].
	aPseudoClassStateList ifNotEmpty:
			[ :c | (self matchesPseudoClasseState: (c last)) ifFalse: [ ^ false ] ].
	^ true
]

{ #category : #accessing }
BrStyleSimpleSelector >> name [
	^ name
]

{ #category : #accessing }
BrStyleSimpleSelector >> name: anObject [
	name := anObject
]

{ #category : #accessing }
BrStyleSimpleSelector >> nameCount [
	^ nameCount
]

{ #category : #testing }
BrStyleSimpleSelector >> nameMatches: aClassName [
	matchOnName
		ifFalse: [ ^ false ].
	^ name = aClassName
]

{ #category : #'as yet unclassified' }
BrStyleSimpleSelector >> printOn: aStream [
	self name ifNotNil: [ :n | aStream nextPutAll: n ].
	self id ifNotNil: [ :i | aStream nextPutAll: i ].
	self styleClasses
		ifNotEmpty: [ :cls | 
			aStream
				nextPut: $.;
				nextPutAll: (cls joinUsing: '.') ].
	self pseudoClasses
		ifNotEmpty: [ :pcls | 
			aStream
				nextPut: $:;
				nextPutAll: (pcls joinUsing: ':') ]
]

{ #category : #accessing }
BrStyleSimpleSelector >> pseudoClassCount [
	^ pseudoClassCount
]

{ #category : #accessing }
BrStyleSimpleSelector >> pseudoClasses [
	^ pseudoClasses
]

{ #category : #accessing }
BrStyleSimpleSelector >> pseudoClasses: anObject [
	pseudoClasses := anObject
]

{ #category : #accessing }
BrStyleSimpleSelector >> styleClassCount [
	^ styleClassCount
]

{ #category : #accessing }
BrStyleSimpleSelector >> styleClasses [
	^ styleClasses
]

{ #category : #accessing }
BrStyleSimpleSelector >> styleClasses: anObject [
	styleClasses := anObject
]

{ #category : #updating }
BrStyleSimpleSelector >> updateMatching [
	matchOnId := id isNotNil and: [ id isNotEmpty ].
	matchOnName := name isNotNil and: [ name isNotEmpty and: [ (name = '*') not ] ].
	matchOnStyleClass := styleClasses isNotEmpty.
]

{ #category : #updating }
BrStyleSimpleSelector >> updateSpecificity [
	idCount := self matchesOnId asBit.
	styleClassCount := self styleClasses size.
	pseudoClassCount := self pseudoClasses size.
	nameCount := self matchesOnName asBit.
	specificity := idCount << 8 | (pseudoClassCount << 4) | styleClassCount | nameCount
]
