Class {
	#name : #BrStylesheet,
	#superclass : #Object,
	#instVars : [
		'name',
		'file',
		'rules',
		'medias',
		'origin'
	],
	#category : 'Brick-Style-CSS'
}

{ #category : #'as yet unclassified' }
BrStylesheet class >> origin: anOrigin [
	^ self new
		origin: anOrigin;
		yourself
]

{ #category : #comparing }
BrStylesheet >> <= aStylesheet [
	^ self origin <= aStylesheet origin
]

{ #category : #comparing }
BrStylesheet >> >= aStylesheet [
	^ self origin >= aStylesheet origin
]

{ #category : #accessing }
BrStylesheet >> file [
	^ file
]

{ #category : #accessing }
BrStylesheet >> file: anObject [
	file := anObject
]

{ #category : #'as yet unclassified' }
BrStylesheet >> for: aSelectorString style: aBlock [
	| theSelectors theRule |
	theSelectors := BlStylesheetLoader parseSelectors: aSelectorString.
	theRule := BrStyleRule new.
	theRule
		selectors: theSelectors;
		stylesheet: self.
	aBlock value: theRule.
	self rules add: theRule
]

{ #category : #'initialize-release' }
BrStylesheet >> initialize [
	super initialize.
	rules := OrderedCollection new.
	medias := OrderedCollection new.
	origin := BrStyleOrigin USER
]

{ #category : #'as yet unclassified' }
BrStylesheet >> matchingMediaRulesFor: aStyleable [
	| matchedRules |
	matchedRules := SortedCollection sortBlock: [ :r1 :r2 | r1 specificity <= r2 specificity ].
	self medias do: [ :m |  m rules do: [ :r | 
					r selectors
						detect: [ :s | s matchesStyleable: aStyleable ]
						ifFound: [ :s |  matchedRules add:
									(BrMatchedRule new
										selector: s;
										declarations: r declarations;
										transitions: r transitions;
										conditions: m conditions;
										yourself) ] ] ].
	^ matchedRules
]

{ #category : #'as yet unclassified' }
BrStylesheet >> matchingRulesFor: aStyleable [
	| matchedRules |
	matchedRules := SortedCollection sortBlock: [ :r1 :r2 | r1 specificity <= r2 specificity ].
	self rules do: [ :r |  r selectors
				select: [ :s | s matchesStyleable: aStyleable ]
				thenDo: [ :s |  matchedRules add:
							(BrMatchedRule new
								selector: s;
								declarations: r declarations;
								transitions: r transitions;
								yourself) ] ].
	matchedRules addAll: (self matchingMediaRulesFor: aStyleable).
	^ matchedRules
]

{ #category : #accessing }
BrStylesheet >> medias [
	^ medias
]

{ #category : #accessing }
BrStylesheet >> medias: aCollection [
	aCollection
		do: [ :r | 
			r stylesheet: self.
			self medias add: r ]
]

{ #category : #accessing }
BrStylesheet >> name [
	^ name
]

{ #category : #accessing }
BrStylesheet >> name: anObject [
	name := anObject
]

{ #category : #accessing }
BrStylesheet >> origin [
	^ origin
]

{ #category : #accessing }
BrStylesheet >> origin: anObject [
	origin := anObject
]

{ #category : #accessing }
BrStylesheet >> rules [
	^ rules
]

{ #category : #accessing }
BrStylesheet >> rules: aCollection [
	aCollection
		do: [ :r | 
			r stylesheet: self.
			self rules add: r ]
]
