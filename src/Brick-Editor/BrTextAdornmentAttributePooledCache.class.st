Class {
	#name : #BrTextAdornmentAttributePooledCache,
	#superclass : #BrTextAdornmentAttributeCache,
	#instVars : [
		'cachePool'
	],
	#category : #'Brick-Editor-Attributes - Support'
}

{ #category : #'private - cache' }
BrTextAdornmentAttributePooledCache >> canElementBeReusedFromCache: anElement [
	"Return true if given element can be reused from the cache"
	<return: #Boolean>

	^ anElement isRemovedFromSceneGraph and: [ anElement hasParent not ]
]

{ #category : #'private - cache' }
BrTextAdornmentAttributePooledCache >> canEntryBeReusedFromCache: aCollectionOfElementsOrElement [
	"Return true if a given cache entry can be reused from the cache"
	<return: #Boolean>

	^ aCollectionOfElementsOrElement isCollection
		ifTrue: [ aCollectionOfElementsOrElement allSatisfy: [ :eachElement | self canElementBeReusedFromCache: eachElement ] ]
		ifFalse: [ self canElementBeReusedFromCache: aCollectionOfElementsOrElement ]
]

{ #category : #'api - cache' }
BrTextAdornmentAttributePooledCache >> ifAbsentPut: aBlock [
	"Return available cached elements previously created by an adornment attribute"
	<return: #SequenceableCollection of: #BlElement>

	^ cachePool
		detect: [ :eachCacheEntry | self canEntryBeReusedFromCache: eachCacheEntry ]
		ifNone: [
			| aNewCacheEntry |
			aNewCacheEntry := aBlock value.
			cachePool add: aNewCacheEntry.
			aNewCacheEntry ]
]

{ #category : #initialization }
BrTextAdornmentAttributePooledCache >> initialize [
	super initialize.
	
	cachePool := OrderedCollection new
]
