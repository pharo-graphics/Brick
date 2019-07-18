"
I am a segment holder and is responsible for binding it to its visual representation.
I am also responsible for caching functionality in order to reduce amount of instantiated objects.
"
Class {
	#name : #BrEditorSegmentHolder,
	#superclass : #BlInfiniteHolder,
	#category : 'Brick-Editor-Model - Segment'
}

{ #category : #initialization }
BrEditorSegmentHolder >> createSegmentElement [
	"Create and return an that should represent a segment that I will hold.
	An element can be any of `BlElement withAllSubclasses`"
	<return: #BlElement>
	
	^ self subclassResponsibility
]

{ #category : #accessing }
BrEditorSegmentHolder >> editor [
	"Return the attached text editor instance.
	Editor can not be nil"
	<return: #BrTextEditor>

	^ self infiniteElement editor
]

{ #category : #initialization }
BrEditorSegmentHolder >> initialize [
	super initialize.

	itemElement := self createSegmentElement
]

{ #category : #'as yet unclassified' }
BrEditorSegmentHolder >> onRecycled [
]

{ #category : #accessing }
BrEditorSegmentHolder >> segment: aBrEditorSegment [
	^ self subclassResponsibility
]
