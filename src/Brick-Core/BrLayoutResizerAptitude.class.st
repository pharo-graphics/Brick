Class {
	#name : #BrLayoutResizerAptitude,
	#superclass : #BrStyleAptitude,
	#instVars : [
		'propagations'
	],
	#category : #'Brick-Core-Layout Resizer'
}

{ #category : #'api - style' }
BrLayoutResizerAptitude class >> inherit [
	^ self new inherit
]

{ #category : #'api - to fit content' }
BrLayoutResizerAptitude >> anyToFitContent [
	"Always fit content irrelevant from what model says"

	self
		hAnyToFitContent;
		vAnyToFitContent
]

{ #category : #'api - to fit content element' }
BrLayoutResizerAptitude >> anyToFitContent: aChildElementOrBlock [
	"Always fit content vertically and horizontally irrelevant from what model says"

	propagations anyToFitContent: aChildElementOrBlock
]

{ #category : #'api - style' }
BrLayoutResizerAptitude >> exactDo: aBlock [
	aBlock value: (self styleFor: (BrLayoutHorizontalResizerState exact and: BrLayoutVerticalResizerState exact))
]

{ #category : #'api - to fit content' }
BrLayoutResizerAptitude >> exactToFitContent [
	self hExactToFitContent.
	self vExactToFitContent
]

{ #category : #'api - to match parent element' }
BrLayoutResizerAptitude >> exactToMatchParent: aChildElementOrBlock [
	propagations exactToMatchParent: aChildElementOrBlock
]

{ #category : #'api - style' }
BrLayoutResizerAptitude >> fitContentDo: aBlock [
	aBlock value: (self styleFor: (BrLayoutHorizontalResizerState fitContent and: BrLayoutVerticalResizerState fitContent))
]

{ #category : #'api - to fit content limited element' }
BrLayoutResizerAptitude >> fitContentLimitedToFitContentLimited: aChildElementOrBlock [
	"Inherit fit content limited in both directions if model says so"
		
	propagations fitContentLimitedToFitContentLimited: aChildElementOrBlock
]

{ #category : #'api - to fit content' }
BrLayoutResizerAptitude >> fitContentToFitContent [
	self hFitContentToFitContent.
	self vFitContentToFitContent
]

{ #category : #'api - to fit content element' }
BrLayoutResizerAptitude >> fitContentToFitContent: aChildElementOrBlock [
	"Inherit fit content in both directions if model says so"
	
	propagations fitContentToFitContent: aChildElementOrBlock
]

{ #category : #'api - style' }
BrLayoutResizerAptitude >> hAny [
	^ self styleFor: BrLayoutHorizontalResizerState any
]

{ #category : #'api - to fit content' }
BrLayoutResizerAptitude >> hAnyToFitContent [
	"Always fit content horizontally irrelevant from what model says"

	self hAny hFitContent
]

{ #category : #'api - to fit content element' }
BrLayoutResizerAptitude >> hAnyToFitContent: aChildElementOrBlock [
	"Always fit content horizontally irrelevant from what model says"

	propagations hAnyToFitContent: aChildElementOrBlock
]

{ #category : #'api - to match parent' }
BrLayoutResizerAptitude >> hAnyToMatchParent [
	"Always match parent horizontally irrelevant from what model says"

	self hAny hMatchParent
]

{ #category : #'api - to match parent element' }
BrLayoutResizerAptitude >> hAnyToMatchParent: aChildElementOrBlock [
	"Match parent horizontally"

	propagations hAnyToMatchParent: aChildElementOrBlock
]

{ #category : #'api - style' }
BrLayoutResizerAptitude >> hExact [
	^ self styleFor: BrLayoutHorizontalResizerState exact
]

{ #category : #'api - style' }
BrLayoutResizerAptitude >> hExactDo: aBlock [
	aBlock value: self hExact
]

{ #category : #'api - to fit content' }
BrLayoutResizerAptitude >> hExactToFitContent [
	"Fit content if model specifies exact size horizontally"

	self hExact hFitContent
]

{ #category : #'api - to fit content element' }
BrLayoutResizerAptitude >> hExactToFitContent: aChildElementOrBlock [
	"Fit content horizontally if model says to be exact size"	

	propagations hExactToFitContent: aChildElementOrBlock
]

{ #category : #'api - to match parent' }
BrLayoutResizerAptitude >> hExactToMatchParent [
	"Match parent if model specifies exact size horizontally"

	self hExact hMatchParent
]

{ #category : #'api - to match parent element' }
BrLayoutResizerAptitude >> hExactToMatchParent: aChildElementOrBlock [
	"Match parent if model specifies exact size horizontally"

	propagations hExactToMatchParent: aChildElementOrBlock
]

{ #category : #'api - style' }
BrLayoutResizerAptitude >> hFitContent [
	^ self styleFor: BrLayoutHorizontalResizerState fitContent
]

{ #category : #'api - style' }
BrLayoutResizerAptitude >> hFitContentLimited [
	^ self styleFor: BrLayoutHorizontalResizerState fitContentLimited
]

{ #category : #'api - to fit content' }
BrLayoutResizerAptitude >> hFitContentLimitedToFitContent [
	"Fit content if model specifies fit content limited horizontally"

	self hFitContentLimited hFitContent
]

{ #category : #'api - to fit content limited' }
BrLayoutResizerAptitude >> hFitContentLimitedToFitContentLimited [
	"Inherit fit content limited horizontally if model says so"

	self hFitContentLimited hFitContentLimited
]

{ #category : #'api - to fit content limited element' }
BrLayoutResizerAptitude >> hFitContentLimitedToFitContentLimited: aChildElementOrBlock [
	"Inherit fit content limited horizontally if model says so"

	propagations hFitContentLimitedToFitContentLimited: aChildElementOrBlock
]

{ #category : #'api - to fit content' }
BrLayoutResizerAptitude >> hFitContentToFitContent [
	"Inherit fit content horizontally if model says so"

	self hFitContent hFitContent
]

{ #category : #'api - to fit content element' }
BrLayoutResizerAptitude >> hFitContentToFitContent: aChildElementOrBlock [
	"Inherit fit content horizontally if model says so"
		
	propagations hFitContentToFitContent: aChildElementOrBlock
]

{ #category : #'api - to match parent' }
BrLayoutResizerAptitude >> hFitContentToMatchParent [
	"Match parent if model specifies fit content horizontally"

	self hFitContent hMatchParent
]

{ #category : #'api - inherit' }
BrLayoutResizerAptitude >> hInherit [
	self
		hMatchParentToMatchParent;
		hFitContentToFitContent;
		hFitContentLimitedToFitContentLimited
]

{ #category : #'api - inherit' }
BrLayoutResizerAptitude >> hInherit: aChildElementOrBlock [
	propagations hInherit: aChildElementOrBlock
]

{ #category : #'api - style' }
BrLayoutResizerAptitude >> hMatchParent [
	^ self styleFor: BrLayoutHorizontalResizerState matchParent
]

{ #category : #'api - to fit content' }
BrLayoutResizerAptitude >> hMatchParentToFitContent [
	"Fit content if model specifies match parent parent horizontally"

	self hMatchParent hFitContent
]

{ #category : #'api - to fit content element' }
BrLayoutResizerAptitude >> hMatchParentToFitContent: aChildElementOrBlock [
	"Fit content horizontally if model says match parent"

	propagations hMatchParentToFitContent: aChildElementOrBlock
]

{ #category : #'api - to match parent' }
BrLayoutResizerAptitude >> hMatchParentToMatchParent [
	"Inherit match parent horizontally if model says so"

	self hMatchParent hMatchParent
]

{ #category : #'api - to match parent element' }
BrLayoutResizerAptitude >> hMatchParentToMatchParent: aChildElementOrBlock [
	"Match parent if model specifies match parent horizontally"

	propagations hMatchParentToMatchParent: aChildElementOrBlock
]

{ #category : #'api - inherit' }
BrLayoutResizerAptitude >> inherit [
	self hInherit.
	self vInherit.
]

{ #category : #'api - inherit' }
BrLayoutResizerAptitude >> inherit: aChildElementOrBlock [
	propagations inherit: aChildElementOrBlock
]

{ #category : #initialization }
BrLayoutResizerAptitude >> initialize [
	super initialize.

	propagations := BrLayoutResizerPropagations new.

	self addChange:
		(BrLookChange new
			up: [ :thisLook | thisLook widget layoutResizerPropagations addPropagations: propagations ];
			down: [ :thisLook | thisLook widget layoutResizerPropagations removePropagations: propagations ];
			yourself)
]

{ #category : #'api - style' }
BrLayoutResizerAptitude >> matchParentDo: aBlock [
	aBlock value: (self styleFor: (BrLayoutHorizontalResizerState matchParent and: BrLayoutVerticalResizerState matchParent))
]

{ #category : #'api - to match parent element' }
BrLayoutResizerAptitude >> matchParentToMatchParent: aChildElementOrBlock [
	"Match parent if model specifies match parent in both dimensions"

	propagations matchParentToMatchParent: aChildElementOrBlock
]

{ #category : #'api - style' }
BrLayoutResizerAptitude >> vAny [
	^ self styleFor: BrLayoutVerticalResizerState any
]

{ #category : #'api - to fit content' }
BrLayoutResizerAptitude >> vAnyToFitContent [
	"Always fit content vertically irrelevant from what model says"

	self vAny vFitContent
]

{ #category : #'api - to fit content element' }
BrLayoutResizerAptitude >> vAnyToFitContent: aChildElementOrBlock [
	"Always fit content vertically irrelevant from what model says"

	propagations vAnyToFitContent: aChildElementOrBlock
]

{ #category : #'api - style' }
BrLayoutResizerAptitude >> vExact [
	^ self styleFor: BrLayoutVerticalResizerState exact
]

{ #category : #'api - style' }
BrLayoutResizerAptitude >> vExactDo: aBlock [
	aBlock value: self vExact
]

{ #category : #'api - to fit content' }
BrLayoutResizerAptitude >> vExactToFitContent [
	"Fit content if model specifies exact size vertically"

	self vExact vFitContent
]

{ #category : #'api - to fit content element' }
BrLayoutResizerAptitude >> vExactToFitContent: aChildElementOrBlock [
	"Fit content vertically if model says to be exact size"	

	propagations vExactToFitContent: aChildElementOrBlock
]

{ #category : #'api - to match parent' }
BrLayoutResizerAptitude >> vExactToMatchParent [
	"Match parent if model specifies exact size vertically"

	self vExact vMatchParent
]

{ #category : #'api - to match parent element' }
BrLayoutResizerAptitude >> vExactToMatchParent: aChildElementOrBlock [
	"Match parent if model specifies exact size horizontally"

	propagations vExactToMatchParent: aChildElementOrBlock
]

{ #category : #'api - style' }
BrLayoutResizerAptitude >> vFitContent [
	^ self styleFor: BrLayoutVerticalResizerState fitContent
]

{ #category : #'api - style' }
BrLayoutResizerAptitude >> vFitContentLimited [
	^ self styleFor: BrLayoutVerticalResizerState fitContentLimited
]

{ #category : #'api - to fit content' }
BrLayoutResizerAptitude >> vFitContentLimitedToFitContent [
	"Fit content if model specifies fit content limited vertically"

	self vFitContentLimited vFitContent
]

{ #category : #'api - to fit content limited' }
BrLayoutResizerAptitude >> vFitContentLimitedToFitContentLimited [
	"Inherit fit content limited horizontally if model says so"

	self vFitContentLimited vFitContentLimited
]

{ #category : #'api - to fit content limited element' }
BrLayoutResizerAptitude >> vFitContentLimitedToFitContentLimited: aChildElementOrBlock [
	"Inherit fit content limited vertically if model says so"
		
	propagations vFitContentLimitedToFitContentLimited: aChildElementOrBlock
]

{ #category : #'api - to fit content' }
BrLayoutResizerAptitude >> vFitContentToFitContent [
	"Fit content if model specifies fit content vertically"

	self vFitContent vFitContent
]

{ #category : #'api - to fit content element' }
BrLayoutResizerAptitude >> vFitContentToFitContent: aChildElementOrBlock [
	"Inherit fit content vertically if model says so"
		
	propagations vFitContentToFitContent: aChildElementOrBlock
]

{ #category : #'api - to match parent' }
BrLayoutResizerAptitude >> vFitContentToMatchParent [
	"Match parent if model specifies fit content vertically"

	self vFitContent vMatchParent
]

{ #category : #'api - inherit' }
BrLayoutResizerAptitude >> vInherit [
	self
		vMatchParentToMatchParent;
		vFitContentToFitContent;
		vFitContentLimitedToFitContentLimited
]

{ #category : #'api - inherit' }
BrLayoutResizerAptitude >> vInherit: aChildElementOrBlock [
	propagations vInherit: aChildElementOrBlock
]

{ #category : #'api - style' }
BrLayoutResizerAptitude >> vMatchParent [
	^ self styleFor: BrLayoutVerticalResizerState matchParent
]

{ #category : #'api - to fit content' }
BrLayoutResizerAptitude >> vMatchParentToFitContent [
	"Fit content if model specifies match parent parent vertically"

	self vMatchParent vFitContent
]

{ #category : #'api - to fit content element' }
BrLayoutResizerAptitude >> vMatchParentToFitContent: aChildElementOrBlock [
	"Fit content vertically if model says match parent"
	
	propagations vMatchParentToFitContent: aChildElementOrBlock
]

{ #category : #'api - to match parent' }
BrLayoutResizerAptitude >> vMatchParentToMatchParent [
	"Inherit match parent vertical if model says so"

	self vMatchParent vMatchParent
]

{ #category : #'api - to match parent element' }
BrLayoutResizerAptitude >> vMatchParentToMatchParent: aChildElementOrBlock [
	"Match parent if model specifies match parent vertically"

	propagations vMatchParentToMatchParent: aChildElementOrBlock
]
