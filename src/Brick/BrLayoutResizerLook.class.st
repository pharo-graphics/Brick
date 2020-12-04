Class {
	#name : #BrLayoutResizerLook,
	#superclass : #BrStyleLook,
	#category : #'Brick-! Core - Layout Resizer'
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
BrLayoutResizerLook >> anyToFitContent: anElement [
	"Always fit content vertically and horizontally irrelevant from what model says"

	self hAnyToFitContent: anElement.
	self vAnyToFitContent: anElement
]

{ #category : #'api - to fit content block' }
BrLayoutResizerLook >> anyToFitContentIn: aBlock [
	"Always fit content in both directtions irrelevant from what model says"

	self hAnyToFitContentIn: aBlock.
	self vAnyToFitContentIn: aBlock.
]

{ #category : #'private - testing' }
BrLayoutResizerLook >> canRedirectTo: anElement [
	self widget == anElement
		ifTrue: [ ^ false ].
		
	anElement isAttachedToSceneGraph
		ifFalse: [ ^ true ].

	^ true
]

{ #category : #'api - to fit content' }
BrLayoutResizerLook >> exactToFitContent [
	self hExactToFitContent.
	self vExactToFitContent
]

{ #category : #'api - to match parent element' }
BrLayoutResizerLook >> exactToMatchParent: anElement [
	self hExactToMatchParent: anElement.
	self vExactToMatchParent: anElement
]

{ #category : #'api - to match parent block' }
BrLayoutResizerLook >> exactToMatchParentIn: aBlock [
	"Match parent if model specifies exact size in both dimensions"

	self hExactToMatchParentIn: aBlock.
	self vExactToMatchParentIn: aBlock
]

{ #category : #'api - to fit content limited element' }
BrLayoutResizerLook >> fitContentLimitedToFitContentLimited: anElement [
	"Inherit fit content limited in both directions if model says so"
		
	self hFitContentLimitedToFitContentLimited: anElement.
	self vFitContentLimitedToFitContentLimited: anElement.
]

{ #category : #'api - to fit content block' }
BrLayoutResizerLook >> fitContentLimitedToFitContentLimitedIn: aBlock [
	"Inherit fit content limited in both directions if model says so"

	self hFitContentLimitedToFitContentLimitedIn: aBlock.
	self vFitContentLimitedToFitContentLimitedIn: aBlock
]

{ #category : #'api - to fit content' }
BrLayoutResizerLook >> fitContentToFitContent [
	self hFitContentToFitContent.
	self vFitContentToFitContent
]

{ #category : #'api - to fit content element' }
BrLayoutResizerLook >> fitContentToFitContent: anElement [
	"Inherit fit content in both directions if model says so"
	
	self hFitContentToFitContent: anElement.
	self vFitContentToFitContent: anElement
]

{ #category : #'api - to fit content block' }
BrLayoutResizerLook >> fitContentToFitContentIn: aBlock [
	"Inherit fit content in both directions if model says so"

	self hFitContentToFitContentIn: aBlock.
	self vFitContentToFitContentIn: aBlock
]

{ #category : #'api - style' }
BrLayoutResizerLook >> hAny [
	^ self styleFor: BrLayoutHorizontalResizerState any
]

{ #category : #'api - style' }
BrLayoutResizerLook >> hAny: anElement [
	^ (self for: anElement) styleFor: BrLayoutHorizontalResizerState any
]

{ #category : #'api - to fit content' }
BrLayoutResizerLook >> hAnyToFitContent [
	"Always fit content horizontally irrelevant from what model says"

	self hAny hFitContent
]

{ #category : #'api - to fit content element' }
BrLayoutResizerLook >> hAnyToFitContent: anElement [
	"Always fit content horizontally irrelevant from what model says"

	(self hAny: anElement) hFitContent
]

{ #category : #'api - to fit content block' }
BrLayoutResizerLook >> hAnyToFitContentIn: aBlock [
	"Always fit content horizontally irrelevant from what model says"

	self hExactToFitContentIn: aBlock.
	self hFitContentToFitContentIn: aBlock.
	self hMatchParentToFitContentIn: aBlock.
]

{ #category : #'api - to match parent' }
BrLayoutResizerLook >> hAnyToMatchParent [
	"Always match parent horizontally irrelevant from what model says"

	self hAny hMatchParent
]

{ #category : #'api - style' }
BrLayoutResizerLook >> hExact [
	^ self styleFor: BrLayoutHorizontalResizerState exact
]

{ #category : #'api - style' }
BrLayoutResizerLook >> hExact: anElement [
	^ (self for: anElement) styleFor: BrLayoutHorizontalResizerState exact
]

{ #category : #'api - to fit content' }
BrLayoutResizerLook >> hExactToFitContent [
	"Fit content if model specifies exact size horizontally"

	self hExact hFitContent
]

{ #category : #'api - to fit content element' }
BrLayoutResizerLook >> hExactToFitContent: anElement [
	"Fit content horizontally if model says to be exact size"	

	(self hExact: anElement) hFitContent
]

{ #category : #'api - to fit content block' }
BrLayoutResizerLook >> hExactToFitContentIn: aBlock [
	"Fit content horizontally if model says to be exact size"

	self hExact: [ aBlock value: [ :anElement | self makeFitContentHorizontally: anElement ] ]
]

{ #category : #'api - to match parent' }
BrLayoutResizerLook >> hExactToMatchParent [
	"Match parent if model specifies exact size horizontally"

	self hExact hMatchParent
]

{ #category : #'api - to match parent element' }
BrLayoutResizerLook >> hExactToMatchParent: anElement [
	"Match parent if model specifies exact size horizontally"

	(self hExact: anElement) hMatchParent
]

{ #category : #'api - to match parent block' }
BrLayoutResizerLook >> hExactToMatchParentIn: aBlock [
	"Match parent if model specifies exact size horizontally"

	self hExact: [ aBlock value: [ :anElement | self makeMatchParentHorizontally: anElement ] ]
]

{ #category : #'api - style' }
BrLayoutResizerLook >> hFitContent [
	^ self styleFor: BrLayoutHorizontalResizerState fitContent
]

{ #category : #'api - style' }
BrLayoutResizerLook >> hFitContent: anElement [
	^ (self for: anElement) styleFor: BrLayoutHorizontalResizerState fitContent
]

{ #category : #'api - style' }
BrLayoutResizerLook >> hFitContentLimited [
	^ self styleFor: BrLayoutHorizontalResizerState fitContentLimited
]

{ #category : #'api - style' }
BrLayoutResizerLook >> hFitContentLimited: anElement [
	^ (self for: anElement) styleFor: BrLayoutHorizontalResizerState fitContentLimited
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
BrLayoutResizerLook >> hFitContentLimitedToFitContentLimited: anElement [
	"Inherit fit content limited horizontally if model says so"

	(self hFitContentLimited: anElement) hFitContentLimited
]

{ #category : #'api - to fit content block' }
BrLayoutResizerLook >> hFitContentLimitedToFitContentLimitedIn: aBlock [
	"Inherit fit content limited horizontally if model says so"

	self hFitContentLimited: [ aBlock value: [ :anElement | self makeFitContentLimitedHorizontally: anElement ] ]
]

{ #category : #'api - to fit content' }
BrLayoutResizerLook >> hFitContentToFitContent [
	"Inherit fit content horizontally if model says so"

	self hFitContent hFitContent
]

{ #category : #'api - to fit content element' }
BrLayoutResizerLook >> hFitContentToFitContent: anElement [
	"Inherit fit content horizontally if model says so"
		
	(self hFitContent: anElement) hFitContent
]

{ #category : #'api - to fit content block' }
BrLayoutResizerLook >> hFitContentToFitContentIn: aBlock [
	"Inherit fit content horizontally if model says so"

	self hFitContent: [ aBlock value: [ :anElement | self makeFitContentHorizontally: anElement ] ]
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
BrLayoutResizerLook >> hInherit: anElement [	
	
	self hExactToMatchParent: anElement.
	self hMatchParentToMatchParent: anElement.
	self hFitContentToFitContent: anElement.
	self hFitContentLimitedToFitContentLimited: anElement
]

{ #category : #'api - inherit' }
BrLayoutResizerLook >> hInheritIn: aBlock [

	self
		hExactToMatchParentIn: aBlock;
		hMatchParentToMatchParentIn: aBlock;
		hFitContentToFitContentIn: aBlock;
		hFitContentLimitedToFitContentLimitedIn: aBlock
]

{ #category : #'api - style' }
BrLayoutResizerLook >> hMatchParent [
	^ self styleFor: BrLayoutHorizontalResizerState matchParent
]

{ #category : #'api - style' }
BrLayoutResizerLook >> hMatchParent: anElement [
	^ (self for: anElement) styleFor: BrLayoutHorizontalResizerState matchParent
]

{ #category : #'api - to fit content' }
BrLayoutResizerLook >> hMatchParentToFitContent [
	"Fit content if model specifies match parent parent horizontally"

	self hMatchParent hFitContent
]

{ #category : #'api - to fit content element' }
BrLayoutResizerLook >> hMatchParentToFitContent: anElement [
	"Fit content horizontally if model says match parent"

	(self hMatchParent: anElement) hFitContent
]

{ #category : #'api - to fit content block' }
BrLayoutResizerLook >> hMatchParentToFitContentIn: aBlock [
	"Fit content horizontally if model says match parent"
		
	self hMatchParent: [ aBlock value: [ :anElement | self makeFitContentHorizontally: anElement ] ]
]

{ #category : #'api - to match parent' }
BrLayoutResizerLook >> hMatchParentToMatchParent [
	"Inherit match parent horizontally if model says so"

	self hMatchParent hMatchParent
]

{ #category : #'api - to match parent element' }
BrLayoutResizerLook >> hMatchParentToMatchParent: anElement [
	"Match parent if model specifies match parent horizontally"

	(self hMatchParent: anElement) hMatchParent
]

{ #category : #'api - to match parent block' }
BrLayoutResizerLook >> hMatchParentToMatchParentIn: aBlock [
	"Match parent if model specifies match parent horizontally"

	self hMatchParent: [ aBlock value: [ :anElement | self makeMatchParentHorizontally: anElement ] ]
]

{ #category : #'api - inherit' }
BrLayoutResizerLook >> inherit [
	self hInherit.
	self vInherit.
]

{ #category : #'api - inherit' }
BrLayoutResizerLook >> inherit: anElement [
	self hInherit: anElement.
	self vInherit: anElement
]

{ #category : #'api - inherit' }
BrLayoutResizerLook >> inheritIn: aBlock [

	self
		exactToMatchParentIn: aBlock;
		matchParentToMatchParentIn: aBlock;
		fitContentToFitContentIn: aBlock;
		fitContentLimitedToFitContentLimitedIn: aBlock
]

{ #category : #'private - resizer' }
BrLayoutResizerLook >> makeFitContentHorizontally: anElement [
	anElement constraints horizontal resizer isFitContent
		ifFalse: [ anElement constraintsDo: [ :c | c horizontal fitContent ] ].

	"we try to redirect it to the element's layout resizer model"
	(self canRedirectTo: anElement)
		ifTrue: [ anElement states addState: BrLayoutHorizontalResizerState fitContent ]
]

{ #category : #'private - resizer' }
BrLayoutResizerLook >> makeFitContentLimitedHorizontally: anElement [
	anElement constraints horizontal resizer isFitContentLimited
		ifFalse: [ anElement constraintsDo: [ :c | c horizontal fitContentLimited ] ].
	
	"we try to redirect it to the element's layout resizer model"
	(self canRedirectTo: anElement)
		ifTrue: [ anElement states addState: BrLayoutHorizontalResizerState fitContentLimited ]
]

{ #category : #'private - resizer' }
BrLayoutResizerLook >> makeFitContentLimitedVertically: anElement [
	anElement constraints vertical resizer isFitContentLimited
		ifFalse: [ anElement constraintsDo: [ :c | c vertical fitContentLimited ] ].
	
	"we try to redirect it to the element's layout resizer model"
	(self canRedirectTo: anElement)
		ifTrue: [ anElement states addState: BrLayoutVerticalResizerState fitContentLimited ]
]

{ #category : #'private - resizer' }
BrLayoutResizerLook >> makeFitContentVertically: anElement [
	anElement constraints vertical resizer isFitContent
		ifFalse: [ anElement constraintsDo: [ :c | c vertical fitContent ] ].

	"we try to redirect it to the element's layout resizer model"
	(self canRedirectTo: anElement)
		ifTrue: [ anElement states addState: BrLayoutVerticalResizerState fitContent ]
]

{ #category : #'private - resizer' }
BrLayoutResizerLook >> makeMatchParentHorizontally: anElement [
	anElement constraints horizontal resizer isMatchParent
		ifFalse: [ anElement constraintsDo: [ :c | c horizontal matchParent ] ].

	"we try to redirect it to the element's layout resizer model"
	(self canRedirectTo: anElement)
		ifTrue: [ anElement states addState: BrLayoutHorizontalResizerState matchParent ]
]

{ #category : #'private - resizer' }
BrLayoutResizerLook >> makeMatchParentVertically: anElement [
	anElement constraints vertical resizer isMatchParent
		ifFalse: [ anElement constraintsDo: [ :c | c vertical matchParent ] ].
	
	"we try to redirect it to the element's layout resizer model"
	(self canRedirectTo: anElement)
		ifTrue: [ anElement states addState: BrLayoutVerticalResizerState matchParent ]
]

{ #category : #'api - to match parent element' }
BrLayoutResizerLook >> matchParentToMatchParent: anElement [
	"Match parent if model specifies match parent in both dimensions"

	self hMatchParentToMatchParent: anElement.
	self vMatchParentToMatchParent: anElement
]

{ #category : #'api - to match parent block' }
BrLayoutResizerLook >> matchParentToMatchParentIn: aBlock [
	"Match parent if model specifies match parent in both dimensions"

	self hMatchParentToMatchParentIn: aBlock.
	self vMatchParentToMatchParentIn: aBlock
]

{ #category : #'api - style' }
BrLayoutResizerLook >> vAny [
	^ self styleFor: BrLayoutVerticalResizerState any
]

{ #category : #'api - style' }
BrLayoutResizerLook >> vAny: anElement [
	^ (self for: anElement) styleFor: BrLayoutVerticalResizerState any
]

{ #category : #'api - to fit content' }
BrLayoutResizerLook >> vAnyToFitContent [
	"Always fit content vertically irrelevant from what model says"

	self vAny vFitContent
]

{ #category : #'api - to fit content element' }
BrLayoutResizerLook >> vAnyToFitContent: anElement [
	"Always fit content vertically irrelevant from what model says"

	(self vAny: anElement) vFitContent
]

{ #category : #'api - to fit content block' }
BrLayoutResizerLook >> vAnyToFitContentIn: aBlock [
	"Always fit content vertically irrelevant from what model says"

	self vExactToFitContentIn: aBlock.
	self vFitContentToFitContentIn: aBlock.
	self vMatchParentToFitContentIn: aBlock.
]

{ #category : #'api - style' }
BrLayoutResizerLook >> vExact [
	^ self styleFor: BrLayoutVerticalResizerState exact
]

{ #category : #'api - style' }
BrLayoutResizerLook >> vExact: anElement [
	^ (self for: anElement) styleFor: BrLayoutVerticalResizerState exact
]

{ #category : #'api - to fit content' }
BrLayoutResizerLook >> vExactToFitContent [
	"Fit content if model specifies exact size vertically"

	self vExact vFitContent
]

{ #category : #'api - to fit content element' }
BrLayoutResizerLook >> vExactToFitContent: anElement [
	"Fit content vertically if model says to be exact size"	

	(self vExact: anElement) vFitContent
]

{ #category : #'api - to fit content block' }
BrLayoutResizerLook >> vExactToFitContentIn: aBlock [
	"Fit content vertically if model says to be exact size"

	self vExact: [ aBlock value: [ :anElement | self makeFitContentVertically: anElement ] ]
]

{ #category : #'api - to match parent' }
BrLayoutResizerLook >> vExactToMatchParent [
	"Match parent if model specifies exact size vertically"

	self vExact vMatchParent
]

{ #category : #'api - to match parent element' }
BrLayoutResizerLook >> vExactToMatchParent: anElement [
	"Match parent if model specifies exact size horizontally"

	(self vExact: anElement) vMatchParent
]

{ #category : #'api - to match parent block' }
BrLayoutResizerLook >> vExactToMatchParentIn: aBlock [
	"Match parent if model specifies exact size horizontally"

	self vExact: [ aBlock value: [ :anElement | self makeMatchParentVertically: anElement ] ]
]

{ #category : #'api - style' }
BrLayoutResizerLook >> vFitContent [
	^ self styleFor: BrLayoutVerticalResizerState fitContent
]

{ #category : #'api - style' }
BrLayoutResizerLook >> vFitContent: anElement [
	^ (self for: anElement) styleFor: BrLayoutVerticalResizerState fitContent
]

{ #category : #'api - style' }
BrLayoutResizerLook >> vFitContentLimited [
	^ self styleFor: BrLayoutVerticalResizerState fitContentLimited
]

{ #category : #'api - style' }
BrLayoutResizerLook >> vFitContentLimited: anElement [
	^ (self for: anElement) styleFor: BrLayoutVerticalResizerState fitContentLimited
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
BrLayoutResizerLook >> vFitContentLimitedToFitContentLimited: anElement [
	"Inherit fit content limited vertically if model says so"
		
	(self vFitContentLimited: anElement) vFitContentLimited
]

{ #category : #'api - to fit content block' }
BrLayoutResizerLook >> vFitContentLimitedToFitContentLimitedIn: aBlock [
	"Inherit fit content limited vertically if model says so"
		
	self vFitContentLimited: [ aBlock value: [ :anElement | self makeFitContentLimitedVertically: anElement ] ]
]

{ #category : #'api - to fit content' }
BrLayoutResizerLook >> vFitContentToFitContent [
	"Fit content if model specifies fit content vertically"

	self vFitContent vFitContent
]

{ #category : #'api - to fit content element' }
BrLayoutResizerLook >> vFitContentToFitContent: anElement [
	"Inherit fit content vertically if model says so"
		
	(self vFitContent: anElement) vFitContent
]

{ #category : #'api - to fit content block' }
BrLayoutResizerLook >> vFitContentToFitContentIn: aBlock [
	"Inherit fit content vertically if model says so"
		
	self vFitContent: [ aBlock value: [ :anElement | self makeFitContentVertically: anElement ] ]
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
BrLayoutResizerLook >> vInherit: anElement [
	self vExactToMatchParent: anElement.
	self vMatchParentToMatchParent: anElement.
	self vFitContentToFitContent: anElement.
	self vFitContentLimitedToFitContentLimited: anElement
]

{ #category : #'api - inherit' }
BrLayoutResizerLook >> vInheritIn: aBlock [

	self
		vExactToMatchParentIn: aBlock;
		vMatchParentToMatchParentIn: aBlock;
		vFitContentToFitContentIn: aBlock;
		vFitContentLimitedToFitContentLimitedIn: aBlock
]

{ #category : #'api - style' }
BrLayoutResizerLook >> vMatchParent [
	^ self styleFor: BrLayoutVerticalResizerState matchParent
]

{ #category : #'api - style' }
BrLayoutResizerLook >> vMatchParent: anElement [
	^ (self for: anElement) styleFor: BrLayoutVerticalResizerState matchParent
]

{ #category : #'api - to fit content' }
BrLayoutResizerLook >> vMatchParentToFitContent [
	"Fit content if model specifies match parent parent vertically"

	self vMatchParent vFitContent
]

{ #category : #'api - to fit content element' }
BrLayoutResizerLook >> vMatchParentToFitContent: anElement [
	"Fit content vertically if model says match parent"
	
	(self vMatchParent: anElement) vFitContent
]

{ #category : #'api - to fit content block' }
BrLayoutResizerLook >> vMatchParentToFitContentIn: aBlock [
	"Fit content vertically if model says match parent"
		
	self vMatchParent: [ aBlock value: [ :anElement | self makeFitContentVertically: anElement ] ]
]

{ #category : #'api - to match parent' }
BrLayoutResizerLook >> vMatchParentToMatchParent [
	"Inherit match parent vertical if model says so"

	self vMatchParent vMatchParent
]

{ #category : #'api - to match parent element' }
BrLayoutResizerLook >> vMatchParentToMatchParent: anElement [
	"Match parent if model specifies match parent vertically"

	(self vMatchParent: anElement) vMatchParent
]

{ #category : #'api - to match parent block' }
BrLayoutResizerLook >> vMatchParentToMatchParentIn: aBlock [
	"Match parent if model specifies match parent vertically"

	self vMatchParent: [ aBlock value: [ :anElement | self makeMatchParentVertically: anElement ] ]
]
