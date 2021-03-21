Class {
	#name : #BrTaggerLook,
	#superclass : #BrLook,
	#category : #'Brick-Tagger - Look'
}

{ #category : #accessing }
BrTaggerLook >> amountOfTags [
	<return: #Number>

	^ (self request: BrTaggerTagsRequest new oneWay) tags size
]

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
	self when: BrTaggerTagRenamed do: [ :anEvent | self onTagRenamed: anEvent tag to: anEvent newName ].
	self when: BrTaggerAllowedTagsChanged do: [ :anEvent | self onAllowedTagsChanged: anEvent allowedTags ]
]

{ #category : #initialization }
BrTaggerLook >> initializeRequests [
	super initializeRequests.
	
	self request: BrTaggerTagsRequest new.
	self request: BrTaggerAllowedTagsRequest new
]

{ #category : #hooks }
BrTaggerLook >> onAllowedTagsChanged: theAllowedTags [
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
