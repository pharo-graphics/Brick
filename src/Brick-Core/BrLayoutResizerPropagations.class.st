Class {
	#name : #BrLayoutResizerPropagations,
	#superclass : #Object,
	#instVars : [
		'propagations',
		'propagationMap'
	],
	#category : #'Brick-Core-Layout Resizer'
}

{ #category : #'api - layout resizeable' }
BrLayoutResizerPropagations class >> hAll [
	^ { self hFitContent . self hFitContentLimited . self hExact . self hMatchParent }
]

{ #category : #'api - layout resizeable' }
BrLayoutResizerPropagations class >> hExact [
	^ BrLayoutHorizontalResizerState exact
]

{ #category : #'api - layout resizeable' }
BrLayoutResizerPropagations class >> hFitContent [
	^ BrLayoutHorizontalResizerState fitContent
]

{ #category : #'api - layout resizeable' }
BrLayoutResizerPropagations class >> hFitContentLimited [
	^ BrLayoutHorizontalResizerState fitContentLimited
]

{ #category : #'api - layout resizeable' }
BrLayoutResizerPropagations class >> hMatchParent [
	^ BrLayoutHorizontalResizerState matchParent
]

{ #category : #'api - layout resizeable' }
BrLayoutResizerPropagations class >> vAll [
	^ { self vFitContent . self vFitContentLimited . self vExact . self vMatchParent }
]

{ #category : #'api - layout resizeable' }
BrLayoutResizerPropagations class >> vExact [
	^ BrLayoutVerticalResizerState exact
]

{ #category : #'api - layout resizeable' }
BrLayoutResizerPropagations class >> vFitContent [
	^ BrLayoutVerticalResizerState fitContent
]

{ #category : #'api - layout resizeable' }
BrLayoutResizerPropagations class >> vFitContentLimited [
	^ BrLayoutVerticalResizerState fitContentLimited
]

{ #category : #'api - layout resizeable' }
BrLayoutResizerPropagations class >> vMatchParent [
	^ BrLayoutVerticalResizerState matchParent
]

{ #category : #'adding / removing' }
BrLayoutResizerPropagations >> addPropagation: aBrLayoutResizerPropagation [
	propagations add: aBrLayoutResizerPropagation
]

{ #category : #'private - insance creation' }
BrLayoutResizerPropagations >> addPropagationFor: aChildOrCollectionOrBlock [
	<return: #BrLayoutResizerPropagation>
	| aPropagation |

	self addPropagation: (aPropagation := self newPropagationFor: aChildOrCollectionOrBlock).
	^ aPropagation
]

{ #category : #'adding / removing' }
BrLayoutResizerPropagations >> addPropagations: aBrLayoutResizerPropagations [
	propagations addAll: aBrLayoutResizerPropagations
]

{ #category : #'api - to fit content' }
BrLayoutResizerPropagations >> anyToFitContent: aChildElementOrBlock [
	(self addPropagationFor: aChildElementOrBlock)
		fromAll: self class hAll
			to: self class hFitContent;
		fromAll: self class vAll
			to: self class vFitContent
]

{ #category : #accessing }
BrLayoutResizerPropagations >> clearPropagationRules: aParentElement [
	propagationMap removeAll
]

{ #category : #accessing }
BrLayoutResizerPropagations >> do: aBlock [
	propagations do: aBlock
]

{ #category : #'api - to match parent' }
BrLayoutResizerPropagations >> exactToMatchParent: aChildElementOrBlock [
	(self addPropagationFor: aChildElementOrBlock)
		from: self class hExact
			to: self class hMatchParent;
		from: self class vExact
			to: self class vMatchParent
]

{ #category : #'api - to fit content limited' }
BrLayoutResizerPropagations >> fitContentLimitedToFitContentLimited: aChildElementOrBlock [
	(self addPropagationFor: aChildElementOrBlock)
		from: self class hFitContentLimited
			to: self class hFitContentLimited;
		from: self class vFitContentLimited
			to: self class vFitContentLimited
]

{ #category : #'api - to fit content' }
BrLayoutResizerPropagations >> fitContentToFitContent: aChildElementOrBlock [
	(self addPropagationFor: aChildElementOrBlock)
		from: self class hFitContent
			to: self class hFitContent;
		from: self class vFitContent
			to: self class vFitContent
]

{ #category : #'api - to fit content' }
BrLayoutResizerPropagations >> hAnyToFitContent: aChildElementOrBlock [
	(self addPropagationFor: aChildElementOrBlock)
		fromAll: self class hAll
		to: self class hFitContent
]

{ #category : #'api - to fit content limited' }
BrLayoutResizerPropagations >> hAnyToFitContentLimited: aChildElementOrBlock [
	(self addPropagationFor: aChildElementOrBlock)
		fromAll: self class hAll
		to: self class hFitContentLimited
]

{ #category : #'api - to match parent' }
BrLayoutResizerPropagations >> hAnyToMatchParent: aChildElementOrBlock [
	(self addPropagationFor: aChildElementOrBlock)
		fromAll: self class hAll
		to: self class hMatchParent
]

{ #category : #'api - to fit content' }
BrLayoutResizerPropagations >> hExactToFitContent: aChildElementOrBlock [
	(self addPropagationFor: aChildElementOrBlock)
		from: self class hExact
		to: self class hFitContent
]

{ #category : #'api - to fit content limited' }
BrLayoutResizerPropagations >> hExactToFitContentLimited: aChildElementOrBlock [
	(self addPropagationFor: aChildElementOrBlock)
		from: self class hExact
		to: self class hFitContentLimited
]

{ #category : #'api - to match parent' }
BrLayoutResizerPropagations >> hExactToMatchParent: aChildElementOrBlock [
	(self addPropagationFor: aChildElementOrBlock)
		from: self class hExact
		to: self class hMatchParent
]

{ #category : #'api - to fit content' }
BrLayoutResizerPropagations >> hFitContentLimitedToFitContent: aChildElementOrBlock [
	(self addPropagationFor: aChildElementOrBlock)
		from: self class hFitContentLimited
		to: self class hFitContent
]

{ #category : #'api - to fit content limited' }
BrLayoutResizerPropagations >> hFitContentLimitedToFitContentLimited: aChildElementOrBlock [
	(self addPropagationFor: aChildElementOrBlock)
		from: self class hFitContentLimited
		to: self class hFitContentLimited
]

{ #category : #'api - to match parent' }
BrLayoutResizerPropagations >> hFitContentLimitedToMatchParent: aChildElementOrBlock [
	(self addPropagationFor: aChildElementOrBlock)
		from: self class hFitContentLimited
		to: self class hMatchParent
]

{ #category : #'api - to fit content' }
BrLayoutResizerPropagations >> hFitContentToFitContent: aChildElementOrBlock [
	(self addPropagationFor: aChildElementOrBlock)
		from: self class hFitContent
		to: self class hFitContent
]

{ #category : #'api - to fit content limited' }
BrLayoutResizerPropagations >> hFitContentToFitContentLimited: aChildElementOrBlock [
	(self addPropagationFor: aChildElementOrBlock)
		from: self class hFitContent
		to: self class hFitContentLimited
]

{ #category : #'api - to match parent' }
BrLayoutResizerPropagations >> hFitContentToMatchParent: aChildElementOrBlock [
	(self addPropagationFor: aChildElementOrBlock)
		from: self class hFitContent
		to: self class hMatchParent
]

{ #category : #'api - inherit' }
BrLayoutResizerPropagations >> hInherit: aChildElementOrBlock [
	(self addPropagationFor: aChildElementOrBlock)
		from: self class hExact
			to: self class hMatchParent;
		from: self class hFitContent
			to: self class hFitContent;
		from: self class hFitContentLimited
			to: self class hFitContentLimited;
		from: self class hMatchParent
			to: self class hMatchParent
]

{ #category : #'api - to fit content' }
BrLayoutResizerPropagations >> hMatchParentToFitContent: aChildElementOrBlock [
	(self addPropagationFor: aChildElementOrBlock)
		from: self class hMatchParent
		to: self class hFitContent
]

{ #category : #'api - to fit content limited' }
BrLayoutResizerPropagations >> hMatchParentToFitContentLimited: aChildElementOrBlock [
	(self addPropagationFor: aChildElementOrBlock)
		from: self class hFitContentLimited
		to: self class hFitContentLimited
]

{ #category : #'api - to match parent' }
BrLayoutResizerPropagations >> hMatchParentToMatchParent: aChildElementOrBlock [
	(self addPropagationFor: aChildElementOrBlock)
		from: self class hMatchParent
		to: self class hMatchParent
]

{ #category : #'api - inherit' }
BrLayoutResizerPropagations >> inherit: aChildElementOrBlock [
	(self addPropagationFor: aChildElementOrBlock)
		from: self class hExact
			to: self class hMatchParent;
		from: self class hFitContent
			to: self class hFitContent;
		from: self class hFitContentLimited
			to: self class hFitContentLimited;
		from: self class hMatchParent
			to: self class hMatchParent;
		from: self class vExact
			to: self class vMatchParent;
		from: self class vFitContent
			to: self class vFitContent;
		from: self class vFitContentLimited
			to: self class vFitContentLimited;
		from: self class vMatchParent
			to: self class vMatchParent
]

{ #category : #initialization }
BrLayoutResizerPropagations >> initialize [
	super initialize.
	
	propagations := OrderedCollection new.
	propagationMap := IdentityDictionary new
]

{ #category : #'api - to match parent' }
BrLayoutResizerPropagations >> matchParentToMatchParent: aChildElementOrBlock [
	(self addPropagationFor: aChildElementOrBlock)
		from: self class hMatchParent
			to: self class hMatchParent;
		from: self class vMatchParent
			to: self class vMatchParent
]

{ #category : #'private - insance creation' }
BrLayoutResizerPropagations >> newPropagationFor: aChildOrCollectionOrBlock [
	<return: #BrLayoutResizerPropagation>

	aChildOrCollectionOrBlock isBlock
		ifTrue: [ ^ BrLayoutResizerDynamicPropagation new childrenBlock: aChildOrCollectionOrBlock ].

	aChildOrCollectionOrBlock isCollection
		ifTrue: [ ^ BrLayoutResizerChildrenPropagation new childrenElements: aChildOrCollectionOrBlock ].

	(aChildOrCollectionOrBlock respondsTo: #asBlocElementId)
		ifTrue: [ ^ BrLayoutResizerChildByIdPropagation new childId: aChildOrCollectionOrBlock ].

	^ BrLayoutResizerChildPropagation new childElement: aChildOrCollectionOrBlock
]

{ #category : #accessing }
BrLayoutResizerPropagations >> precomputePropagationRules: aParentElement [
	propagationMap
		ifNotEmpty: [ ^ self ].

	propagationMap removeAll.

	propagations do: [ :eachPropagation |
		eachPropagation
			childrenToPropagateFrom: aParentElement
			do: [ :eachChildElement |
				| eachPropagationMap |

				eachPropagationMap := propagationMap
					at: eachChildElement
					ifAbsentPut: [ Dictionary new ].
					
				eachPropagation propagationAssociations do: [ :eachAssociation |
					eachPropagationMap at: eachAssociation key put: eachAssociation value ] ] ]
]

{ #category : #accessing }
BrLayoutResizerPropagations >> propagateState: aBrLayoutResizerState from: aParentElement to: aChildElement [

	^ propagationMap
		at: aChildElement
		ifPresent: [ :aPropagationMap |
			aPropagationMap
				at: aBrLayoutResizerState asNotPropagated
				ifPresent: [ :aMappedState | aMappedState asPropagated ]
				ifAbsent: [ aBrLayoutResizerState asNotPropagated ] ]
		ifAbsent: [ aBrLayoutResizerState asNotPropagated ]
]

{ #category : #'adding / removing' }
BrLayoutResizerPropagations >> removePropagation: aBrLayoutResizerPropagation [
	propagations remove: aBrLayoutResizerPropagation ifAbsent: [  ]
]

{ #category : #'adding / removing' }
BrLayoutResizerPropagations >> removePropagations: aBrLayoutResizerPropagations [
	propagations removeAll: aBrLayoutResizerPropagations
]

{ #category : #'api - to fit content' }
BrLayoutResizerPropagations >> vAnyToFitContent: aChildElementOrBlock [
	(self addPropagationFor: aChildElementOrBlock)
		fromAll: self class vAll
		to: self class vFitContent
]

{ #category : #'api - to fit content limited' }
BrLayoutResizerPropagations >> vAnyToFitContentLimited: aChildElementOrBlock [
	(self addPropagationFor: aChildElementOrBlock)
		fromAll: self class vAll
		to: self class vFitContentLimited
]

{ #category : #'api - to match parent' }
BrLayoutResizerPropagations >> vAnyToMatchParent: aChildElementOrBlock [
	(self addPropagationFor: aChildElementOrBlock)
		fromAll: self class vAll
		to: self class vMatchParent
]

{ #category : #'api - to fit content' }
BrLayoutResizerPropagations >> vExactToFitContent: aChildElementOrBlock [
	(self addPropagationFor: aChildElementOrBlock)
		from: self class vExact
		to: self class vFitContent
]

{ #category : #'api - to fit content limited' }
BrLayoutResizerPropagations >> vExactToFitContentLimited: aChildElementOrBlock [
	(self addPropagationFor: aChildElementOrBlock)
		from: self class vExact
		to: self class vFitContentLimited
]

{ #category : #'api - to match parent' }
BrLayoutResizerPropagations >> vExactToMatchParent: aChildElementOrBlock [
	(self addPropagationFor: aChildElementOrBlock)
		from: self class vExact
		to: self class vMatchParent
]

{ #category : #'api - to fit content' }
BrLayoutResizerPropagations >> vFitContentLimitedToFitContent: aChildElementOrBlock [
	(self addPropagationFor: aChildElementOrBlock)
		from: self class vFitContentLimited
		to: self class vFitContent
]

{ #category : #'api - to fit content limited' }
BrLayoutResizerPropagations >> vFitContentLimitedToFitContentLimited: aChildElementOrBlock [
	(self addPropagationFor: aChildElementOrBlock)
		from: self class vFitContentLimited
		to: self class vFitContentLimited
]

{ #category : #'api - to match parent' }
BrLayoutResizerPropagations >> vFitContentLimitedToMatchParent: aChildElementOrBlock [
	(self addPropagationFor: aChildElementOrBlock)
		from: self class vFitContentLimited
		to: self class vMatchParent
]

{ #category : #'api - to fit content' }
BrLayoutResizerPropagations >> vFitContentToFitContent: aChildElementOrBlock [
	(self addPropagationFor: aChildElementOrBlock)
		from: self class vFitContent
		to: self class vFitContent
]

{ #category : #'api - to fit content limited' }
BrLayoutResizerPropagations >> vFitContentToFitContentLimited: aChildElementOrBlock [
	(self addPropagationFor: aChildElementOrBlock)
		from: self class vFitContent
		to: self class vFitContentLimited
]

{ #category : #'api - to match parent' }
BrLayoutResizerPropagations >> vFitContentToMatchParent: aChildElementOrBlock [
	(self addPropagationFor: aChildElementOrBlock)
		from: self class vFitContent
		to: self class vMatchParent
]

{ #category : #'api - inherit' }
BrLayoutResizerPropagations >> vInherit: aChildElementOrBlock [
	(self addPropagationFor: aChildElementOrBlock)
		from: self class vExact
			to: self class vMatchParent;
		from: self class vFitContent
			to: self class vFitContent;
		from: self class vFitContentLimited
			to: self class vFitContentLimited;
		from: self class vMatchParent
			to: self class vMatchParent
]

{ #category : #'api - to fit content' }
BrLayoutResizerPropagations >> vMatchParentToFitContent: aChildElementOrBlock [
	(self addPropagationFor: aChildElementOrBlock)
		from: self class vMatchParent
		to: self class vFitContent
]

{ #category : #'api - to fit content limited' }
BrLayoutResizerPropagations >> vMatchParentToFitContentLimited: aChildElementOrBlock [
	(self addPropagationFor: aChildElementOrBlock)
		from: self class vFitContentLimited
		to: self class vFitContentLimited
]

{ #category : #'api - to match parent' }
BrLayoutResizerPropagations >> vMatchParentToMatchParent: aChildElementOrBlock [
	(self addPropagationFor: aChildElementOrBlock)
		from: self class vMatchParent
		to: self class vMatchParent
]
