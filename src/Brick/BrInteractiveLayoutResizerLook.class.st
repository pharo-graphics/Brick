Class {
	#name : #BrInteractiveLayoutResizerLook,
	#superclass : #BrInteractiveLook,
	#category : #'Brick-! Core'
}

{ #category : #'api - style' }
BrInteractiveLayoutResizerLook >> hExact: aBlock [
	self
		when: self state horizontal exact
		style: aBlock
]

{ #category : #'api - style' }
BrInteractiveLayoutResizerLook >> hExactToMatchParent [
	"Match parent if model specifies exact size horizontally"

	self
		when: self state horizontal exact
		style: [ :aWidget | aWidget constraintsDo: [ :c | c horizontal matchParent ] ]
]

{ #category : #'api - style' }
BrInteractiveLayoutResizerLook >> hFitContent: aBlock [
	self
		when: self state horizontal fitContent
		style: aBlock
]

{ #category : #'api - style' }
BrInteractiveLayoutResizerLook >> hMatchParent [
	"Inherit match parent horizontally if model says so"
	self
		when: self state horizontal matchParent
		style: [ :aWidget | aWidget constraintsDo: [ :c | c horizontal matchParent ] ]
]

{ #category : #'api - style' }
BrInteractiveLayoutResizerLook >> hMatchParent: aBlock [
	self
		when: self state horizontal matchParent
		style: aBlock
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
	"Match parent if model specifies exact size horizontally"

	self
		when: self state vertical exact
		style: [ :aWidget | aWidget constraintsDo: [ :c | c vertical matchParent ] ]
]

{ #category : #'api - style' }
BrInteractiveLayoutResizerLook >> vFitContent: aBlock [
	self
		when: self state vertical fitContent
		style: aBlock
]

{ #category : #'api - style' }
BrInteractiveLayoutResizerLook >> vMatchParent [
	"Inherit match parent vertically if model says so"
	self
		when: self state vertical matchParent
		style: [ :aWidget | aWidget constraintsDo: [ :c | c vertical matchParent ] ]
]

{ #category : #'api - style' }
BrInteractiveLayoutResizerLook >> vMatchParent: aBlock [
	self
		when: self state vertical matchParent
		style: aBlock
]
