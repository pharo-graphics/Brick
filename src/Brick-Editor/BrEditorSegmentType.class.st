"
I represent a segment type and is responsible for creating a segment holder of desired type.

We don't want to restrict text editor to work only with one  type of segments. In order to support multiple segment types override ===BrTextEditor>>#itemTypeAt:=== and return a custom type for a segment at an index.
"
Class {
	#name : #BrEditorSegmentType,
	#superclass : #BlInfiniteItemType,
	#classInstVars : [
		'uniqueInstance'
	],
	#category : 'Brick-Editor-Model - Segment'
}

{ #category : #cleanup }
BrEditorSegmentType class >> cleanUp [
	super cleanUp.
	
	uniqueInstance := nil
]

{ #category : #accessing }
BrEditorSegmentType class >> uniqueInstance [
	"Return a unique instance of my type. Since there may be a lot of
	segments of the same type it is better to refer to the same type object
	for memory usage and performance reasons"
	<return: #BrEditorSegmentType>

	^ uniqueInstance ifNil: [ uniqueInstance := self new ]
]

{ #category : #accessing }
BrEditorSegmentType >> holder [
	"Instantiate and return a new segment holder based on my type"
	<return: #BrEditorSegmentHolder>
	
	^ self subclassResponsibility
]
