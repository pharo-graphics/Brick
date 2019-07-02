Class {
	#name : #BrLayoutResizerLook,
	#superclass : #BrInteractiveLook,
	#category : #'Brick-Layout Resizer - Look'
}

{ #category : #'api - style' }
BrLayoutResizerLook class >> inherit [
	^ self new inherit
]

{ #category : #'api - style' }
BrLayoutResizerLook >> anyToFitContent [
	"Always fit content irrelevant from what model says"

	self
		hAnyToFitContent;
		vAnyToFitContent
]

{ #category : #'private - testing' }
BrLayoutResizerLook >> canRedirectTo: anElement [
	self widget == anElement
		ifTrue: [ ^ false ].
		
	anElement isAttachedToSceneGraph
		ifFalse: [ ^ true ].

	^ true
]

{ #category : #'api - style' }
BrLayoutResizerLook >> exact: aBlock [
	self hExact: aBlock.
	self vExact: aBlock
]

{ #category : #'api - style' }
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

{ #category : #'api - style' }
BrLayoutResizerLook >> fitContent: aBlock [
	self hFitContent: aBlock.
	self vFitContent: aBlock
]

{ #category : #'api - to fit content element' }
BrLayoutResizerLook >> fitContentToFitContent: anElement [
	"Inherit fit content in both directions if model says so"
		
	self fitContentToFitContentIn: [ :aBlock | aBlock value: anElement ]
]

{ #category : #'api - to fit content block' }
BrLayoutResizerLook >> fitContentToFitContentIn: aBlock [
	"Inherit fit content in both directions if model says so"

	self hFitContentToFitContentIn: aBlock.
	self vFitContentToFitContentIn: aBlock
]

{ #category : #'api - style' }
BrLayoutResizerLook >> hAnyToFitContent [
	"Always fit content horizontally irrelevant from what model says"

	self
		hExactToFitContent;
		hFitContent;
		hMatchParentToFitContent
]

{ #category : #'api - style' }
BrLayoutResizerLook >> hAnyToMatchParent [
	"Always match parent horizontally irrelevant from what model says"

	self
		hExactToMatchParent;
		hFitContentToMatchParent;
		hMatchParent
]

{ #category : #'api - style' }
BrLayoutResizerLook >> hExact: aBlock [
	self
		when: self state horizontal exact
		style: aBlock
]

{ #category : #'api - style' }
BrLayoutResizerLook >> hExactToFitContent [
	"Fit content if model specifies exact size horizontally"

	self vExact: [ :aWidget | self makeFitContentHorizontally: aWidget ]
]

{ #category : #'api - style' }
BrLayoutResizerLook >> hExactToMatchParent [
	"Match parent if model specifies exact size horizontally"

	self hExact: [ :aWidget | self makeMatchParentHorizontally: aWidget ]
]

{ #category : #'api - to match parent element' }
BrLayoutResizerLook >> hExactToMatchParent: anElement [
	"Match parent if model specifies exact size horizontally"

	self hExactToMatchParentIn: [ :aBlock | aBlock value: anElement ]
]

{ #category : #'api - to match parent block' }
BrLayoutResizerLook >> hExactToMatchParentIn: aBlock [
	"Match parent if model specifies exact size horizontally"

	self hExact: [ aBlock value: [ :anElement | self makeMatchParentHorizontally: anElement ] ]
]

{ #category : #'api - style' }
BrLayoutResizerLook >> hFitContent [
	"Inherit fit content horizontally if model says so"

	self hFitContent: [ :aWidget | self makeFitContentHorizontally: aWidget ]
]

{ #category : #'api - style' }
BrLayoutResizerLook >> hFitContent: aBlock [
	self
		when: self state horizontal fitContent
		style: aBlock
]

{ #category : #'api - to fit content element' }
BrLayoutResizerLook >> hFitContentToFitContent: anElement [
	"Inherit fit content horizontally if model says so"
		
	self hFitContentToFitContentIn: [ :aBlock | aBlock value: anElement ]
]

{ #category : #'api - to fit content block' }
BrLayoutResizerLook >> hFitContentToFitContentIn: aBlock [
	"Inherit fit content horizontally if model says so"

	self hFitContent: [ aBlock value: [ :anElement | self makeFitContentHorizontally: anElement ] ]
]

{ #category : #'api - style' }
BrLayoutResizerLook >> hFitContentToMatchParent [
	"Match parent if model specifies fit content horizontally"

	self hFitContent: [ :aWidget | self makeMatchParentHorizontally: aWidget ]
]

{ #category : #'api - style' }
BrLayoutResizerLook >> hMatchParent [
	"Inherit match parent horizontally if model says so"

	self hMatchParent: [ :aWidget | self makeMatchParentHorizontally: aWidget ]
]

{ #category : #'api - style' }
BrLayoutResizerLook >> hMatchParent: aBlock [
	self
		when: self state horizontal matchParent
		style: aBlock
]

{ #category : #'api - style' }
BrLayoutResizerLook >> hMatchParentToFitContent [
	"Fit content if model specifies match parent parent horizontally"

	self hMatchParent: [ :aWidget | self makeFitContentHorizontally: aWidget ]
]

{ #category : #'api - to match parent element' }
BrLayoutResizerLook >> hMatchParentToMatchParent: anElement [
	"Match parent if model specifies match parent horizontally"

	self hMatchParentToMatchParentIn: [ :aBlock | aBlock value: anElement ]
]

{ #category : #'api - to match parent block' }
BrLayoutResizerLook >> hMatchParentToMatchParentIn: aBlock [
	"Match parent if model specifies match parent horizontally"

	self hMatchParent: [ aBlock value: [ :anElement | self makeMatchParentHorizontally: anElement ] ]
]

{ #category : #'api - style' }
BrLayoutResizerLook >> inherit [
	self
		when: self state horizontal any
		style: [ :aWidget | aWidget constraintsDo: [ :c | c horizontal resizer: (self request: BrLayoutHorizontalResizerRequest new oneWay) resizer ] ].

	self
		when: self state vertical any
		style: [ :aWidget | aWidget constraintsDo: [ :c | c vertical resizer: (self request: BrLayoutVerticalResizerRequest new oneWay) resizer ] ].
]

{ #category : #'api - inherit' }
BrLayoutResizerLook >> inherit: anElement [
	self
		exactToMatchParent: anElement;
		matchParentToMatchParent: anElement;
		fitContentToFitContent: anElement
]

{ #category : #'api - inherit' }
BrLayoutResizerLook >> inheritIn: aBlock [

	self
		exactToMatchParentIn: aBlock;
		matchParentToMatchParentIn: aBlock;
		fitContentToFitContentIn: aBlock
]

{ #category : #'private - resizer' }
BrLayoutResizerLook >> makeFitContentHorizontally: anElement [
	anElement constraintsDo: [ :c | c horizontal fitContent ].
	
	"we try to redirect it to the element's layout resizer model"
	(self canRedirectTo: anElement)
		ifTrue: [ anElement dispatchEvent: (BrLayoutHorizontalResizerWish fitContent) ]
]

{ #category : #'private - resizer' }
BrLayoutResizerLook >> makeFitContentVertically: anElement [
	anElement constraintsDo: [ :c | c vertical fitContent ].
	
	"we try to redirect it to the element's layout resizer model"
	(self canRedirectTo: anElement)
		ifTrue: [ anElement dispatchEvent: (BrLayoutVerticalResizerWish fitContent) ]
]

{ #category : #'private - resizer' }
BrLayoutResizerLook >> makeMatchParentHorizontally: anElement [
	anElement constraintsDo: [ :c | c horizontal matchParent ].

	"we try to redirect it to the element's layout resizer model"
	(self canRedirectTo: anElement)
		ifTrue: [ anElement dispatchEvent: (BrLayoutHorizontalResizerWish matchParent) ]
]

{ #category : #'private - resizer' }
BrLayoutResizerLook >> makeMatchParentVertically: anElement [
	anElement constraintsDo: [ :c | c vertical matchParent ].
	
	"we try to redirect it to the element's layout resizer model"
	(self canRedirectTo: anElement)
		ifTrue: [ anElement dispatchEvent: (BrLayoutVerticalResizerWish matchParent) ]
]

{ #category : #'api - style' }
BrLayoutResizerLook >> matchParent: aBlock [
	self hMatchParent: aBlock.
	self vMatchParent: aBlock
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

{ #category : #accessing }
BrLayoutResizerLook >> state [
	^ BrLayoutResizerState
]

{ #category : #'api - style' }
BrLayoutResizerLook >> vAnyToFitContent [
	"Always fit content vertically irrelevant from what model says"

	self
		vExactToFitContent;
		vFitContent;
		vMatchParentToFitContent
]

{ #category : #'api - style' }
BrLayoutResizerLook >> vExact: aBlock [
	self
		when: self state vertical exact
		style: aBlock
]

{ #category : #'api - style' }
BrLayoutResizerLook >> vExactToFitContent [
	"Fit content if model specifies exact size vertically"

	self vExact: [ :aWidget | self makeFitContentVertically: aWidget ]
]

{ #category : #'api - style' }
BrLayoutResizerLook >> vExactToMatchParent [
	"Match parent if model specifies exact size vertically"

	self vExact: [ :aWidget | self makeMatchParentVertically: aWidget ]
]

{ #category : #'api - to match parent element' }
BrLayoutResizerLook >> vExactToMatchParent: anElement [
	"Match parent if model specifies exact size horizontally"

	self vExactToMatchParentIn: [ :aBlock | aBlock value: anElement ]
]

{ #category : #'api - to match parent block' }
BrLayoutResizerLook >> vExactToMatchParentIn: aBlock [
	"Match parent if model specifies exact size horizontally"

	self vExact: [ aBlock value: [ :anElement | self makeMatchParentVertically: anElement ] ]
]

{ #category : #'api - style' }
BrLayoutResizerLook >> vFitContent [
	"Inherit fit content vertically if model says so"

	self vFitContent: [ :aWidget | self makeFitContentVertically: aWidget ]
]

{ #category : #'api - style' }
BrLayoutResizerLook >> vFitContent: aBlock [
	self
		when: self state vertical fitContent
		style: aBlock
]

{ #category : #'api - to fit content element' }
BrLayoutResizerLook >> vFitContentToFitContent: anElement [
	"Inherit fit content vertically if model says so"
		
	self vFitContentToFitContentIn: [ :aBlock | aBlock value: anElement ]
]

{ #category : #'api - to fit content block' }
BrLayoutResizerLook >> vFitContentToFitContentIn: aBlock [
	"Inherit fit content vertically if model says so"
		
	self vFitContent: [ aBlock value: [ :anElement | self makeFitContentVertically: anElement ] ]
]

{ #category : #'api - style' }
BrLayoutResizerLook >> vFitContentToMatchParent [
	"Match parent if model specifies fit content vertically"

	self vFitContent: [ :aWidget | self makeMatchParentVertically: aWidget ]
]

{ #category : #'api - style' }
BrLayoutResizerLook >> vMatchParent [
	"Inherit match parent vertically if model says so"

	self vMatchParent: [ :aWidget | self makeMatchParentVertically: aWidget ]
]

{ #category : #'api - style' }
BrLayoutResizerLook >> vMatchParent: aBlock [
	self
		when: self state vertical matchParent
		style: aBlock
]

{ #category : #'api - style' }
BrLayoutResizerLook >> vMatchParentToFitContent [
	"Fit content if model specifies match parent parent vertically"

	self vMatchParent: [ :aWidget | self makeFitContentVertically: aWidget ]
]

{ #category : #'api - to match parent element' }
BrLayoutResizerLook >> vMatchParentToMatchParent: anElement [
	"Match parent if model specifies match parent vertically"

	self vMatchParentToMatchParentIn: [ :aBlock | aBlock value: anElement ]
]

{ #category : #'api - to match parent block' }
BrLayoutResizerLook >> vMatchParentToMatchParentIn: aBlock [
	"Match parent if model specifies match parent vertically"

	self vMatchParent: [ aBlock value: [ :anElement | self makeMatchParentVertically: anElement ] ]
]
