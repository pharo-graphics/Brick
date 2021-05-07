Class {
	#name : #BrGlamorousTaggerAptitude,
	#superclass : #BrTaggerAptitude,
	#instVars : [
		'tags',
		'shouldGiveFocusToNewTag',
		'separatorStencil',
		'tagElements',
		'margin',
		'tagLabelStencil'
	],
	#category : #'Brick-Glamorous-Tagger'
}

{ #category : #private }
BrGlamorousTaggerAptitude >> addTagElement: aTagElement withSeparatorAt: aTagIndex [
	| aSeparatorIndex aTagElementIndex |
	
	aSeparatorIndex := self separatorChildIndexFor: aTagIndex.
	aTagElementIndex := self tagChildIndexFor: aTagIndex.
	
	aSeparatorIndex isZero
		ifFalse: [ tags addChild: self newSeparatorElement at: aSeparatorIndex ].

	tags addChild: aTagElement at: aTagElementIndex
]

{ #category : #private }
BrGlamorousTaggerAptitude >> assignTag: aTaggerTag toElement: aTagElement [
	aTagElement userData at: #brickTaggerTag put: aTaggerTag
]

{ #category : #initialization }
BrGlamorousTaggerAptitude >> defaultTagLabelStencil [
	^ [ :aTag |
		BrEditor new
			beReadOnlyWithoutSelection;
			aptitude: BrGlamorousEditableLabelAptitude new glamorousRegularFontAndSize;
			fitContent;
			text: aTag name ] asStencilBuilder: BrTaggerTagStencilBuilder
]

{ #category : #private }
BrGlamorousTaggerAptitude >> giveFocusToNewTagDuring: aBlock [
	| previousValue |
	
	previousValue := shouldGiveFocusToNewTag.
	shouldGiveFocusToNewTag := true.
	aBlock ensure: [ shouldGiveFocusToNewTag := previousValue ]
]

{ #category : #testing }
BrGlamorousTaggerAptitude >> hasSeparator [
	^ separatorStencil isNotNil
]

{ #category : #initialization }
BrGlamorousTaggerAptitude >> initialize [
	super initialize.
	
	shouldGiveFocusToNewTag := false.
	separatorStencil := nil.
	margin := BlInsets top: 3 left: 0 bottom: 3 right: 5.
	tagLabelStencil := self defaultTagLabelStencil.

	tags := BlElement new layout: BlFlowLayout horizontal.
	tags focusability: BlFocusability ignore.

	tagElements := OrderedCollection new.
	
	self addChangeAddChildAs: #(tags) with: [ tags ].	
	
	self
		addChangeProperty: #(widget layout)
			with: [ BlLinearLayout horizontal ].

	self
		addChangeProperty: #(widget focusability)
			with: [ BlFocusability ignore ].
	
	self add: BrHorizontalPaneAptitude new.
	self add: (BrLayoutResizerAptitude new
		inherit;
		inherit: tags)
]

{ #category : #'api - style' }
BrGlamorousTaggerAptitude >> margin: aBlInsets [
	margin := aBlInsets
]

{ #category : #'private - instance creation' }
BrGlamorousTaggerAptitude >> newSeparatorElement [
	^ separatorStencil asElement
		focusability: BlFocusability none;
		margin: (BlInsets left: (margin right / 2.0) negated right: (margin right / 2));
		constraintsDo: [ :c | c flow vertical alignCenter ]
]

{ #category : #'private - instance creation' }
BrGlamorousTaggerAptitude >> newTagElementFor: aTaggerTag [
	<return: #BlElement>

	^ (tagLabelStencil tag: aTaggerTag) asElement
		margin: margin
]

{ #category : #hooks }
BrGlamorousTaggerAptitude >> onTagAdded: aTaggerTag at: aTagIndex [
	| aTagElement |

	aTagElement := self newTagElementFor: aTaggerTag.
	self assignTag: aTaggerTag toElement: aTagElement.

	self addTagElement: aTagElement withSeparatorAt: aTagIndex.
	tagElements add: aTagElement beforeIndex: aTagIndex.
	
	shouldGiveFocusToNewTag
		ifTrue: [ aTagElement requestFocus ]
]

{ #category : #hooks }
BrGlamorousTaggerAptitude >> onTagRemoved: aTaggerTag at: anIndex [
	self
		tagElementFor: aTaggerTag
		ifFound: [ :aTagElement |
			aTagElement hasFocus
				ifTrue: [
					anIndex = 1
						ifFalse: [ aTagElement focusPrevious ]
						ifTrue: [ aTagElement focusNext ] ].
			
			tagElements remove: aTagElement.
			self removeTagElement: aTagElement withSeparatorAt: anIndex ]
]

{ #category : #hooks }
BrGlamorousTaggerAptitude >> onTagRenamed: aTaggerTag to: aNewName [
	self
		tagElementFor: aTaggerTag
		ifFound: [ :aTagElement | aTagElement text: aNewName ]
]

{ #category : #hooks }
BrGlamorousTaggerAptitude >> onTagsChanged: theTags [
	tags removeChildren: self tagElements.
	theTags withIndexDo: [ :eachTag :eachIndex | self onTagAdded: eachTag at: eachIndex ]
]

{ #category : #private }
BrGlamorousTaggerAptitude >> removeTagElement: aTagElement withSeparatorAt: aTagIndex [
	| aSeparatorIndex |

	aTagElement removeFromParent.
	
	aSeparatorIndex := self separatorChildIndexFor: aTagIndex.
	aSeparatorIndex isZero
		ifFalse: [ tags removeChildAt: aSeparatorIndex ]
]

{ #category : #'api - style' }
BrGlamorousTaggerAptitude >> separator: aStencil [
	separatorStencil := aStencil asStencil
]

{ #category : #private }
BrGlamorousTaggerAptitude >> separatorChildIndexFor: aTagIndex [
	"I compute an index of a separator when we add a new tag with a given index, assuming that a separator is added before the tag"
	<return: #Number>
	
	self hasSeparator
		ifFalse: [ ^ 0 ].

	aTagIndex = 1
		ifTrue: [
			^ tagElements
				ifEmpty: [ 0 ]
				ifNotEmpty: [ 1 ] ].
	
	^ (aTagIndex - 1) * 2
]

{ #category : #private }
BrGlamorousTaggerAptitude >> separatorForTagElement: aTagElement ifFound: aFoundBlock [
	aTagElement userData
		at: #brickTaggerSeparator
		ifPresent: aFoundBlock
]

{ #category : #private }
BrGlamorousTaggerAptitude >> tagChildIndexFor: aTagIndex [
	<return: #Number>
	
	self hasSeparator
		ifFalse: [ ^ aTagIndex ].

	aTagIndex isZero
		ifTrue: [ ^ 0 ].

	aTagIndex = 1
		ifTrue: [ ^ 1 ].
	
	^ (aTagIndex * 2) - 1
]

{ #category : #private }
BrGlamorousTaggerAptitude >> tagElementFor: aTaggerTag ifFound: aFoundBlock [
	tags children
		detect: [ :eachTagElement |
			eachTagElement userData
				at: #brickTaggerTag
				ifPresent: [ :eachTag | eachTag == aTaggerTag ]
				ifAbsent: [ false ] ]
		ifFound: aFoundBlock
]

{ #category : #private }
BrGlamorousTaggerAptitude >> tagElements [
	^ tags children
		select: [ :eachTagElement |
			eachTagElement userData
				at: #brickTaggerTag
				ifPresent: [ true ]
				ifAbsent: [ false ] ]
]

{ #category : #'api - style' }
BrGlamorousTaggerAptitude >> tagLabel: aBrTaggerTagStencilBuilder [
	tagLabelStencil := aBrTaggerTagStencilBuilder asStencilBuilder: BrTaggerTagStencilBuilder
]
