Class {
	#name : #BrLayoutResizerLook,
	#superclass : #BrStyleLook,
	#instVars : [
		'propagations'
	],
	#category : #'Brick-Core-Layout Resizer'
}

{ #category : #'api - style' }
BrLayoutResizerLook class >> inherit [
	^ self new inherit
]

{ #category : #'api - to fit content' }
BrLayoutResizerLook >> anyToFitContent [
	"Always fit content irrelevant from what model says"

	self
		hAnyToFitContent;
		vAnyToFitContent
]

{ #category : #'api - to fit content element' }
BrLayoutResizerLook >> anyToFitContent: aChildElementOrBlock [
	"Always fit content vertically and horizontally irrelevant from what model says"

	propagations anyToFitContent: aChildElementOrBlock
]

{ #category : #'api - style' }
BrLayoutResizerLook >> exactDo: aBlock [
	aBlock value: (self styleFor: (BrLayoutHorizontalResizerState exact and: BrLayoutVerticalResizerState exact))
]

{ #category : #'api - to fit content' }
BrLayoutResizerLook >> exactToFitContent [
	self hExactToFitContent.
	self vExactToFitContent
]

{ #category : #'api - to match parent element' }
BrLayoutResizerLook >> exactToMatchParent: aChildElementOrBlock [
	propagations exactToMatchParent: aChildElementOrBlock
]

{ #category : #'api - style' }
BrLayoutResizerLook >> fitContentDo: aBlock [
	aBlock value: (self styleFor: (BrLayoutHorizontalResizerState fitContent and: BrLayoutVerticalResizerState fitContent))
]

{ #category : #'api - to fit content limited element' }
BrLayoutResizerLook >> fitContentLimitedToFitContentLimited: aChildElementOrBlock [
	"Inherit fit content limited in both directions if model says so"
		
	propagations fitContentLimitedToFitContentLimited: aChildElementOrBlock
]

{ #category : #'api - to fit content' }
BrLayoutResizerLook >> fitContentToFitContent [
	self hFitContentToFitContent.
	self vFitContentToFitContent
]

{ #category : #'api - to fit content element' }
BrLayoutResizerLook >> fitContentToFitContent: aChildElementOrBlock [
	"Inherit fit content in both directions if model says so"
	
	propagations fitContentToFitContent: aChildElementOrBlock
]

{ #category : #'api - style' }
BrLayoutResizerLook >> hAny [
	^ self styleFor: BrLayoutHorizontalResizerState any
]

{ #category : #'api - to fit content' }
BrLayoutResizerLook >> hAnyToFitContent [
	"Always fit content horizontally irrelevant from what model says"

	self hAny hFitContent
]

{ #category : #'api - to fit content element' }
BrLayoutResizerLook >> hAnyToFitContent: aChildElementOrBlock [
	"Always fit content horizontally irrelevant from what model says"

	propagations hAnyToFitContent: aChildElementOrBlock
]

{ #category : #'api - to match parent' }
BrLayoutResizerLook >> hAnyToMatchParent [
	"Always match parent horizontally irrelevant from what model says"

	self hAny hMatchParent
]

{ #category : #'api - to match parent element' }
BrLayoutResizerLook >> hAnyToMatchParent: aChildElementOrBlock [
	"Match parent horizontally"

	propagations hAnyToMatchParent: aChildElementOrBlock
]

{ #category : #'api - style' }
BrLayoutResizerLook >> hExact [
	^ self styleFor: BrLayoutHorizontalResizerState exact
]

{ #category : #'api - style' }
BrLayoutResizerLook >> hExactDo: aBlock [
	aBlock value: self hExact
]

{ #category : #'api - to fit content' }
BrLayoutResizerLook >> hExactToFitContent [
	"Fit content if model specifies exact size horizontally"

	self hExact hFitContent
]

{ #category : #'api - to fit content element' }
BrLayoutResizerLook >> hExactToFitContent: aChildElementOrBlock [
	"Fit content horizontally if model says to be exact size"	

	propagations hExactToFitContent: aChildElementOrBlock
]

{ #category : #'api - to match parent' }
BrLayoutResizerLook >> hExactToMatchParent [
	"Match parent if model specifies exact size horizontally"

	self hExact hMatchParent
]

{ #category : #'api - to match parent element' }
BrLayoutResizerLook >> hExactToMatchParent: aChildElementOrBlock [
	"Match parent if model specifies exact size horizontally"

	propagations hExactToMatchParent: aChildElementOrBlock
]

{ #category : #'api - style' }
BrLayoutResizerLook >> hFitContent [
	^ self styleFor: BrLayoutHorizontalResizerState fitContent
]

{ #category : #'api - style' }
BrLayoutResizerLook >> hFitContentLimited [
	^ self styleFor: BrLayoutHorizontalResizerState fitContentLimited
]

{ #category : #'api - to fit content' }
BrLayoutResizerLook >> hFitContentLimitedToFitContent [
	"Fit content if model specifies fit content limited horizontally"

	self hFitContentLimited hFitContent
]

{ #category : #'api - to fit content limited' }
BrLayoutResizerLook >> hFitContentLimitedToFitContentLimited [
	"Inherit fit content limited horizontally if model says so"

	self hFitContentLimited hFitContentLimited
]

{ #category : #'api - to fit content limited element' }
BrLayoutResizerLook >> hFitContentLimitedToFitContentLimited: aChildElementOrBlock [
	"Inherit fit content limited horizontally if model says so"

	propagations hFitContentLimitedToFitContentLimited: aChildElementOrBlock
]

{ #category : #'api - to fit content' }
BrLayoutResizerLook >> hFitContentToFitContent [
	"Inherit fit content horizontally if model says so"

	self hFitContent hFitContent
]

{ #category : #'api - to fit content element' }
BrLayoutResizerLook >> hFitContentToFitContent: aChildElementOrBlock [
	"Inherit fit content horizontally if model says so"
		
	propagations hFitContentToFitContent: aChildElementOrBlock
]

{ #category : #'api - to match parent' }
BrLayoutResizerLook >> hFitContentToMatchParent [
	"Match parent if model specifies fit content horizontally"

	self hFitContent hMatchParent
]

{ #category : #'api - inherit' }
BrLayoutResizerLook >> hInherit [
	self
		hMatchParentToMatchParent;
		hFitContentToFitContent;
		hFitContentLimitedToFitContentLimited
]

{ #category : #'api - inherit' }
BrLayoutResizerLook >> hInherit: aChildElementOrBlock [
	propagations hInherit: aChildElementOrBlock
]

{ #category : #'api - style' }
BrLayoutResizerLook >> hMatchParent [
	^ self styleFor: BrLayoutHorizontalResizerState matchParent
]

{ #category : #'api - to fit content' }
BrLayoutResizerLook >> hMatchParentToFitContent [
	"Fit content if model specifies match parent parent horizontally"

	self hMatchParent hFitContent
]

{ #category : #'api - to fit content element' }
BrLayoutResizerLook >> hMatchParentToFitContent: aChildElementOrBlock [
	"Fit content horizontally if model says match parent"

	propagations hMatchParentToFitContent: aChildElementOrBlock
]

{ #category : #'api - to match parent' }
BrLayoutResizerLook >> hMatchParentToMatchParent [
	"Inherit match parent horizontally if model says so"

	self hMatchParent hMatchParent
]

{ #category : #'api - to match parent element' }
BrLayoutResizerLook >> hMatchParentToMatchParent: aChildElementOrBlock [
	"Match parent if model specifies match parent horizontally"

	propagations hMatchParentToMatchParent: aChildElementOrBlock
]

{ #category : #'api - inherit' }
BrLayoutResizerLook >> inherit [
	self hInherit.
	self vInherit.
]

{ #category : #'api - inherit' }
BrLayoutResizerLook >> inherit: aChildElementOrBlock [
	propagations inherit: aChildElementOrBlock
]

{ #category : #initialization }
BrLayoutResizerLook >> initialize [
	super initialize.

	propagations := BrLayoutResizerPropagations new.

	self addChange:
		(BrLookChange new
			up: [ :thisLook | thisLook widget layoutResizerPropagations addPropagations: propagations ];
			down: [ :thisLook | thisLook widget layoutResizerPropagations removePropagations: propagations ];
			yourself)
]

{ #category : #'api - style' }
BrLayoutResizerLook >> matchParentDo: aBlock [
	aBlock value: (self styleFor: (BrLayoutHorizontalResizerState matchParent and: BrLayoutVerticalResizerState matchParent))
]

{ #category : #'api - to match parent element' }
BrLayoutResizerLook >> matchParentToMatchParent: aChildElementOrBlock [
	"Match parent if model specifies match parent in both dimensions"

	propagations matchParentToMatchParent: aChildElementOrBlock
]

{ #category : #'api - style' }
BrLayoutResizerLook >> vAny [
	^ self styleFor: BrLayoutVerticalResizerState any
]

{ #category : #'api - to fit content' }
BrLayoutResizerLook >> vAnyToFitContent [
	"Always fit content vertically irrelevant from what model says"

	self vAny vFitContent
]

{ #category : #'api - to fit content element' }
BrLayoutResizerLook >> vAnyToFitContent: aChildElementOrBlock [
	"Always fit content vertically irrelevant from what model says"

	propagations vAnyToFitContent: aChildElementOrBlock
]

{ #category : #'api - style' }
BrLayoutResizerLook >> vExact [
	^ self styleFor: BrLayoutVerticalResizerState exact
]

{ #category : #'api - style' }
BrLayoutResizerLook >> vExactDo: aBlock [
	aBlock value: self vExact
]

{ #category : #'api - to fit content' }
BrLayoutResizerLook >> vExactToFitContent [
	"Fit content if model specifies exact size vertically"

	self vExact vFitContent
]

{ #category : #'api - to fit content element' }
BrLayoutResizerLook >> vExactToFitContent: aChildElementOrBlock [
	"Fit content vertically if model says to be exact size"	

	propagations vExactToFitContent: aChildElementOrBlock
]

{ #category : #'api - to match parent' }
BrLayoutResizerLook >> vExactToMatchParent [
	"Match parent if model specifies exact size vertically"

	self vExact vMatchParent
]

{ #category : #'api - to match parent element' }
BrLayoutResizerLook >> vExactToMatchParent: aChildElementOrBlock [
	"Match parent if model specifies exact size horizontally"

	propagations vExactToMatchParent: aChildElementOrBlock
]

{ #category : #'api - style' }
BrLayoutResizerLook >> vFitContent [
	^ self styleFor: BrLayoutVerticalResizerState fitContent
]

{ #category : #'api - style' }
BrLayoutResizerLook >> vFitContentLimited [
	^ self styleFor: BrLayoutVerticalResizerState fitContentLimited
]

{ #category : #'api - to fit content' }
BrLayoutResizerLook >> vFitContentLimitedToFitContent [
	"Fit content if model specifies fit content limited vertically"

	self vFitContentLimited vFitContent
]

{ #category : #'api - to fit content limited' }
BrLayoutResizerLook >> vFitContentLimitedToFitContentLimited [
	"Inherit fit content limited horizontally if model says so"

	self vFitContentLimited vFitContentLimited
]

{ #category : #'api - to fit content limited element' }
BrLayoutResizerLook >> vFitContentLimitedToFitContentLimited: aChildElementOrBlock [
	"Inherit fit content limited vertically if model says so"
		
	propagations vFitContentLimitedToFitContentLimited: aChildElementOrBlock
]

{ #category : #'api - to fit content' }
BrLayoutResizerLook >> vFitContentToFitContent [
	"Fit content if model specifies fit content vertically"

	self vFitContent vFitContent
]

{ #category : #'api - to fit content element' }
BrLayoutResizerLook >> vFitContentToFitContent: aChildElementOrBlock [
	"Inherit fit content vertically if model says so"
		
	propagations vFitContentToFitContent: aChildElementOrBlock
]

{ #category : #'api - to match parent' }
BrLayoutResizerLook >> vFitContentToMatchParent [
	"Match parent if model specifies fit content vertically"

	self vFitContent vMatchParent
]

{ #category : #'api - inherit' }
BrLayoutResizerLook >> vInherit [
	self
		vMatchParentToMatchParent;
		vFitContentToFitContent;
		vFitContentLimitedToFitContentLimited
]

{ #category : #'api - inherit' }
BrLayoutResizerLook >> vInherit: aChildElementOrBlock [
]

{ #category : #'api - style' }
BrLayoutResizerLook >> vMatchParent [
	^ self styleFor: BrLayoutVerticalResizerState matchParent
]

{ #category : #'api - to fit content' }
BrLayoutResizerLook >> vMatchParentToFitContent [
	"Fit content if model specifies match parent parent vertically"

	self vMatchParent vFitContent
]

{ #category : #'api - to fit content element' }
BrLayoutResizerLook >> vMatchParentToFitContent: aChildElementOrBlock [
	"Fit content vertically if model says match parent"
	
	propagations vMatchParentToFitContent: aChildElementOrBlock
]

{ #category : #'api - to match parent' }
BrLayoutResizerLook >> vMatchParentToMatchParent [
	"Inherit match parent vertical if model says so"

	self vMatchParent vMatchParent
]

{ #category : #'api - to match parent element' }
BrLayoutResizerLook >> vMatchParentToMatchParent: aChildElementOrBlock [
	"Match parent if model specifies match parent vertically"

	propagations vMatchParentToMatchParent: aChildElementOrBlock
]
