Class {
	#name : #BrTagger,
	#superclass : #BlElement,
	#traits : 'TBrLayoutResizable',
	#classTraits : 'TBrLayoutResizable classTrait',
	#category : #'Brick-Tagger - UI'
}

{ #category : #'api - tags' }
BrTagger >> addTag: aTaggerTag [
	self viewModel addTag: aTaggerTag
]

{ #category : #'api - tags' }
BrTagger >> addTagNamed: aTagName [
	self viewModel addTagNamed: aTagName
]

{ #category : #'api - tags' }
BrTagger >> allowedTags: aBrTaggerAllowedTags [
	self viewModel allowedTags: aBrTaggerAllowedTags
]

{ #category : #'api - tags' }
BrTagger >> explicitAllowedTags: aCollectionOfTags [
	self viewModel allowedTags: (BrTaggerAllowedExplicitTags new tags: aCollectionOfTags)
]

{ #category : #initialization }
BrTagger >> initialize [
	super initialize.

	self viewModel: BrTaggerModel new
]

{ #category : #'api - tags' }
BrTagger >> namedTags: aCollectionOfTagNames [
	self viewModel namedTags: aCollectionOfTagNames
]

{ #category : #'api - tags' }
BrTagger >> removeTag: aTaggerTag [
	self viewModel removeTag: aTaggerTag
]

{ #category : #'api - tags' }
BrTagger >> removeTagNamed: aTagName [
	self viewModel removeTagNamed: aTagName
]

{ #category : #'api - tags' }
BrTagger >> renameTag: aTaggerTag to: aNewName [
	self viewModel renameTag: aTaggerTag to: aNewName
]

{ #category : #'api - tags' }
BrTagger >> renameTagNamed: aTagName to: aNewName [
	self viewModel renameTagNamed: aTagName to: aNewName
]

{ #category : #'api - tags' }
BrTagger >> tagNames [
	^ self viewModel tagNames
]

{ #category : #'api - tags' }
BrTagger >> tags [
	^ self viewModel tags
]
