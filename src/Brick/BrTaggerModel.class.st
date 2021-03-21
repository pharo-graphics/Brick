Class {
	#name : #BrTaggerModel,
	#superclass : #BrWidgetModel,
	#instVars : [
		'tags',
		'allowedTags'
	],
	#category : #'Brick-Tagger - Model'
}

{ #category : #'api - tags' }
BrTaggerModel >> addTag: aTaggerTag [
	(tags includes: aTaggerTag)
		ifTrue: [ ^ self ].

	tags add: aTaggerTag.
	self notifyTagAdded: aTaggerTag at: tags size
]

{ #category : #'api - tags' }
BrTaggerModel >> addTagNamed: aTagName [
	self addTag: (BrTaggerTag named: aTagName)
]

{ #category : #'api - tags' }
BrTaggerModel >> allowedTags: aBrTaggerAllowedTags [
	allowedTags = aBrTaggerAllowedTags
		ifTrue: [ ^ self ].

	allowedTags := aBrTaggerAllowedTags.
	self notifyAllowedTagsChanged: allowedTags
]

{ #category : #initialization }
BrTaggerModel >> initialize [
	super initialize.

	tags := OrderedCollection new.
	allowedTags := BrTaggerAllowedAnyTags new
]

{ #category : #initialization }
BrTaggerModel >> initializeListeners [
	super initializeListeners.
	
	self when: BrTaggerTagsRequest reply: [ :aResponse | aResponse tags: self tags ].
	self when: BrTaggerAddTagWish do: [ :aWish | self addTag: aWish tag ].
	self when: BrTaggerRemoveTagWish do: [ :aWish | self removeTag: aWish tag ].
	self when: BrTaggerRenameTagWish do: [ :aWish | self renameTag: aWish tag to: aWish newName ]
]

{ #category : #'api - tags' }
BrTaggerModel >> namedTags: aCollectionOfTagNames [
	self tags: (aCollectionOfTagNames collect: [ :eachName | BrTaggerTag named: eachName ])
]

{ #category : #notifying }
BrTaggerModel >> notifyAllowedTagsChanged: aBrTaggerAllowedTags [
	self dispatchEvent: (BrTaggerAllowedTagsChanged new allowedTags: aBrTaggerAllowedTags)
]

{ #category : #notifying }
BrTaggerModel >> notifyTagAdded: aTaggerTag at: anIndex [
	self dispatchEvent: (BrTaggerTagAdded new
		tag: aTaggerTag;
		index: anIndex)
]

{ #category : #notifying }
BrTaggerModel >> notifyTagRemoved: aTaggerTag at: anIndex [
	self dispatchEvent: (BrTaggerTagRemoved new tag: aTaggerTag; index: anIndex)
]

{ #category : #notifying }
BrTaggerModel >> notifyTagRenamed: aTaggerTag from: anOldTagName to: aNewTagName [
	self dispatchEvent: (BrTaggerTagRenamed new
		tag: aTaggerTag;
		oldName: anOldTagName;
		newName: aNewTagName)
]

{ #category : #notifying }
BrTaggerModel >> notifyTagsChanged: theTags [
	self dispatchEvent: (BrTaggerTagsChanged new tags: theTags)
]

{ #category : #'api - tags' }
BrTaggerModel >> removeTag: aTaggerTag [
	| anIndex |
	
	anIndex := tags indexOf: aTaggerTag.
	
	tags
		remove: aTaggerTag
		ifAbsent: [ ^ self ].

	self notifyTagRemoved: aTaggerTag at: anIndex
]

{ #category : #'api - tags' }
BrTaggerModel >> removeTagNamed: aTagName [
	| toBeRemoved |

	toBeRemoved := tags select: [ :eachTag | eachTag name = aTagName ].
	toBeRemoved do: [ :eachTag | self removeTag: eachTag ]
]

{ #category : #'api - tags' }
BrTaggerModel >> renameTag: aTaggerTag to: aNewName [
	| anOldName |

	(tags includes: aTaggerTag)
		ifFalse: [ ^ self ].

	anOldName := aTaggerTag name.
	aTaggerTag name: aNewName.
	
	self notifyTagRenamed: aTaggerTag from: anOldName to: aNewName
]

{ #category : #'api - tags' }
BrTaggerModel >> renameTagNamed: aTagName to: aNewName [
	| toBeRenamed |

	toBeRenamed := tags select: [ :eachTag | eachTag name = aTagName ].
	toBeRenamed do: [ :eachTag | self renameTag: eachTag to: aNewName ]
]

{ #category : #accessing }
BrTaggerModel >> tagNames [
	^ self tags collect: [ :eachTag | eachTag name ]
]

{ #category : #accessing }
BrTaggerModel >> tags [
	^ tags
]

{ #category : #'api - tags' }
BrTaggerModel >> tags: aCollectionOfTaggerTags [
	tags := aCollectionOfTaggerTags asOrderedCollection.
	self notifyTagsChanged: tags
]
