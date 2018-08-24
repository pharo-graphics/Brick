Class {
	#name : #BrTheme,
	#superclass : #Object,
	#category : 'Brick-Style'
}

{ #category : #'as yet unclassified' }
BrTheme class >> load [
	self new load
]

{ #category : #'as yet unclassified' }
BrTheme class >> themeKey [
	self subclassResponsibility 
]

{ #category : #'as yet unclassified' }
BrTheme class >> unload [
	self new unload
]

{ #category : #'as yet unclassified' }
BrTheme >> buildStylesheet [
	| allPragmas aStylesheet |
	
	aStylesheet := self defaultStylesheet.
	allPragmas := SortedCollection
		sortBlock: [ :pr1 :pr2 | (pr1 argumentAt: 2) >= (pr2 argumentAt: 2) ].
	allPragmas
		addAll: (Pragma allNamed: #stylesheet:priority: in: self class).
	allPragmas
		do: [ :pr | 
			(Message selector: pr methodSelector argument: aStylesheet)
				sendTo: self ].
	^ aStylesheet
]

{ #category : #'as yet unclassified' }
BrTheme >> defaultStylesheet [
	^ (BrStylesheet origin: BrStyleOrigin AUTHOR)
		name: self class themeKey;
		yourself
]

{ #category : #loading }
BrTheme >> load [
	| aStylesheet |
	self unload.
	aStylesheet := self buildStylesheet.
	BrRootStyler defaultStylesheet: aStylesheet.
	BlUniverse default allSpacesDo: [ :sp | sp rootStyler reload ]
]

{ #category : #'as yet unclassified' }
BrTheme >> unload [
	BrRootStyler defaultStylesheet: nil.
	BlUniverse default allSpacesDo:[ :sp | sp rootStyler compute ]
]
