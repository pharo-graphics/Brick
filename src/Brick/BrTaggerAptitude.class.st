Class {
	#name : #BrTaggerAptitude,
	#superclass : #BrAptitude,
	#category : #'Brick-Tagger - Look'
}

{ #category : #accessing }
BrTaggerAptitude >> amountOfTags [
	<return: #Number>

	^ (self request: BrTaggerTagsRequest new oneWay) tags size
]

{ #category : #initialization }
BrTaggerAptitude >> initialize [
	super initialize.
	
	
]

{ #category : #initialization }
BrTaggerAptitude >> initializeListeners [
	super initializeListeners.
	
	self when: BrTaggerTagsChanged do: [ :anEvent | self onTagsChanged: anEvent tags ].
	self when: BrTaggerTagAdded do: [ :anEvent | self onTagAdded: anEvent tag at: anEvent index ].
	self when: BrTaggerTagRemoved do: [ :anEvent | self onTagRemoved: anEvent tag at: anEvent index ].
	self when: BrTaggerTagRenamed do: [ :anEvent | self onTagRenamed: anEvent tag to: anEvent newName ].
	self when: BrTaggerAllowedTagsChanged do: [ :anEvent | self onAllowedTagsChanged: anEvent allowedTags ]
]

{ #category : #initialization }
BrTaggerAptitude >> initializeRequests [
	super initializeRequests.
	
	self request: BrTaggerTagsRequest new.
	self request: BrTaggerAllowedTagsRequest new
]

{ #category : #hooks }
BrTaggerAptitude >> onAllowedTagsChanged: theAllowedTags [
]

{ #category : #hooks }
BrTaggerAptitude >> onTagAdded: aTaggerTag at: anIndex [
]

{ #category : #hooks }
BrTaggerAptitude >> onTagRemoved: aTaggerTag at: anIndex [
]

{ #category : #hooks }
BrTaggerAptitude >> onTagRenamed: aTaggerTag to: aNewTagName [
]

{ #category : #hooks }
BrTaggerAptitude >> onTagsChanged: theTags [
]
