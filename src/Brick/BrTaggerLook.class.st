Class {
	#name : #BrTaggerLook,
	#superclass : #BrLook,
	#category : #'Brick-Tagger - Look'
}

{ #category : #initialization }
BrTaggerLook >> initialize [
	super initialize.
	
	
]

{ #category : #initialization }
BrTaggerLook >> initializeListeners [
	super initializeListeners.
	
	self when: BrTaggerTagsChanged do: [ :anEvent | self onTagsChanged: anEvent tags ].
	self when: BrTaggerTagAdded do: [ :anEvent | self onTagAdded: anEvent tag at: anEvent index ].
	self when: BrTaggerTagRemoved do: [ :anEvent | self onTagRemoved: anEvent tag at: anEvent index ].
	self when: BrTaggerTagRenamed do: [ :anEvent | self onTagRenamed: anEvent tag to: anEvent newName ]
]

{ #category : #initialization }
BrTaggerLook >> initializeRequests [
	super initializeRequests.
	
	self request: BrTaggerTagsRequest new
]

{ #category : #hooks }
BrTaggerLook >> onTagAdded: aTaggerTag at: anIndex [
]

{ #category : #hooks }
BrTaggerLook >> onTagRemoved: aTaggerTag at: anIndex [
]

{ #category : #hooks }
BrTaggerLook >> onTagRenamed: aTaggerTag to: aNewTagName [
]

{ #category : #hooks }
BrTaggerLook >> onTagsChanged: theTags [
]
