Class {
	#name : #BrInteractiveLayoutResizerLook,
	#superclass : #BrInteractiveLook,
	#category : #'Brick-Layout Resizer - Look'
}

{ #category : #'private - testing' }
BrInteractiveLayoutResizerLook >> canRedirectTo: anElement [
	self widget == anElement
		ifTrue: [ ^ false ].
		
	anElement isAttachedToSceneGraph
		ifFalse: [ ^ true ].

	^ true
]

{ #category : #'api - style' }
BrInteractiveLayoutResizerLook >> hExact: aBlock [
	self
		when: self state horizontal exact
		style: aBlock
]

{ #category : #'api - style' }
BrInteractiveLayoutResizerLook >> hExactToMatchParent [
	"Match parent if model specifies exact size horizontally"

	self hExact: [ :aWidget | self makeMatchParentHorizontally: aWidget ]
]

{ #category : #'api - inherit' }
BrInteractiveLayoutResizerLook >> hExactToMatchParentIn: aBlock [
	"Match parent if model specifies exact size horizontally"

	self hExact: [ aBlock value: [ :anElement | self makeMatchParentHorizontally: anElement ] ]
]

{ #category : #'api - style' }
BrInteractiveLayoutResizerLook >> hFitContent: aBlock [
	self
		when: self state horizontal fitContent
		style: aBlock
]

{ #category : #'api - inherit' }
BrInteractiveLayoutResizerLook >> hFitContentIn: aBlock [
	"Inherit fit content horizontally if model says so"

	self hFitContent: [ aBlock value: [ :anElement | self makeFitContentHorizontally: anElement ] ]
]

{ #category : #'api - style' }
BrInteractiveLayoutResizerLook >> hMatchParent [
	"Inherit match parent horizontally if model says so"

	self hMatchParent: [ :aWidget | self makeMatchParentHorizontally: aWidget ]
]

{ #category : #'api - style' }
BrInteractiveLayoutResizerLook >> hMatchParent: aBlock [
	self
		when: self state horizontal matchParent
		style: aBlock
]

{ #category : #'api - inherit' }
BrInteractiveLayoutResizerLook >> hMatchParentIn: aBlock [
	"Inherit match parent horizontally if model says so"

	self hMatchParent: [ aBlock value: [ :anElement | self makeMatchParentHorizontally: anElement ] ]
]

{ #category : #'api - style' }
BrInteractiveLayoutResizerLook >> inherit [
	self
		when: self state horizontal any
		style: [ :aWidget | aWidget constraintsDo: [ :c | c horizontal resizer: (self request: BrLayoutHorizontalResizerRequest new oneWay) resizer ] ].

	self
		when: self state vertical any
		style: [ :aWidget | aWidget constraintsDo: [ :c | c vertical resizer: (self request: BrLayoutVerticalResizerRequest new oneWay) resizer ] ].
]

{ #category : #'private - resizer' }
BrInteractiveLayoutResizerLook >> makeFitContentHorizontally: anElement [
	anElement constraintsDo: [ :c | c horizontal fitContent ].
	
	"we try to redirect it to the element's layout resizer model"
	(self canRedirectTo: anElement)
		ifTrue: [ anElement dispatchEvent: (BrLayoutHorizontalResizerWish fitContent) ]
]

{ #category : #'private - resizer' }
BrInteractiveLayoutResizerLook >> makeFitContentVertically: anElement [
	anElement constraintsDo: [ :c | c vertical fitContent ].
	
	"we try to redirect it to the element's layout resizer model"
	(self canRedirectTo: anElement)
		ifTrue: [ anElement dispatchEvent: (BrLayoutVerticalResizerWish fitContent) ]
]

{ #category : #'private - resizer' }
BrInteractiveLayoutResizerLook >> makeMatchParentHorizontally: anElement [
	anElement constraintsDo: [ :c | c horizontal matchParent ].

	"we try to redirect it to the element's layout resizer model"
	(self canRedirectTo: anElement)
		ifTrue: [ anElement dispatchEvent: (BrLayoutHorizontalResizerWish matchParent) ]
]

{ #category : #'private - resizer' }
BrInteractiveLayoutResizerLook >> makeMatchParentVertically: anElement [
	anElement constraintsDo: [ :c | c vertical matchParent ].
	
	"we try to redirect it to the element's layout resizer model"
	(self canRedirectTo: anElement)
		ifTrue: [ anElement dispatchEvent: (BrLayoutVerticalResizerWish matchParent) ]
]

{ #category : #accessing }
BrInteractiveLayoutResizerLook >> state [
	^ BrLayoutResizerState
]

{ #category : #'api - style' }
BrInteractiveLayoutResizerLook >> vExact: aBlock [
	self
		when: self state vertical exact
		style: aBlock
]

{ #category : #'api - style' }
BrInteractiveLayoutResizerLook >> vExactToMatchParent [
	"Match parent if model specifies exact size vertically"

	self vExact: [ :aWidget | self makeMatchParentVertically: aWidget ]
]

{ #category : #'api - inherit' }
BrInteractiveLayoutResizerLook >> vExactToMatchParentIn: aBlock [
	"Match parent if model specifies exact size horizontally"

	self vExact: [ aBlock value: [ :anElement | self makeMatchParentVertically: anElement ] ]
]

{ #category : #'api - style' }
BrInteractiveLayoutResizerLook >> vFitContent: aBlock [
	self
		when: self state vertical fitContent
		style: aBlock
]

{ #category : #'api - inherit' }
BrInteractiveLayoutResizerLook >> vFitContentIn: aBlock [
	"Inherit fit content vertically if model says so"
		
	self vFitContent: [ aBlock value: [ :anElement | self makeFitContentVertically: anElement ] ]
]

{ #category : #'api - style' }
BrInteractiveLayoutResizerLook >> vMatchParent [
	"Inherit match parent vertically if model says so"

	self vMatchParent: [ :aWidget | self makeMatchParentVertically: aWidget ]
]

{ #category : #'api - style' }
BrInteractiveLayoutResizerLook >> vMatchParent: aBlock [
	self
		when: self state vertical matchParent
		style: aBlock
]

{ #category : #'api - inherit' }
BrInteractiveLayoutResizerLook >> vMatchParentIn: aBlock [
	"Inherit match parent vertically if model says so"

	self vMatchParent: [ aBlock value: [ :anElement | self makeMatchParentVertically: anElement ] ]
]
