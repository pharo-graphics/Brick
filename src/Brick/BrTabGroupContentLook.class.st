Class {
	#name : #BrTabGroupContentLook,
	#superclass : #BrLook,
	#instVars : [
		'content',
		'contentElementsCache'
	],
	#category : #'Brick-Tabs - Look'
}

{ #category : #'api - accessing' }
BrTabGroupContentLook >> content [
	<return: #BlElement>

	^ content
]

{ #category : #'api - accessing' }
BrTabGroupContentLook >> contentDo: aBlock [
	aBlock value: self content
]

{ #category : #initialization }
BrTabGroupContentLook >> initialize [
	super initialize.

	content := BlElement new 
		layout: BlLinearLayout horizontal;
		labeled: 'Content'.
	
	self add: (BrLayoutResizerLook new inherit: content).

	contentElementsCache := IdentityDictionary new.
	self addChangeAddChildAs: #(content) with: [ content ]
]

{ #category : #initialization }
BrTabGroupContentLook >> initializeListeners [
	super initializeListeners.

	self when: BrTabSelectedEvent do: [ :anEvent | self onTabSelected: anEvent tab ].
	self when: BrTabDeselectedEvent do: [ :anEvent | self onTabDeselected: anEvent tab ].
	self when: BrTabRemovedEvent do: [ :anEvent | self onTabRemoved: anEvent tab ]
]

{ #category : #initialization }
BrTabGroupContentLook >> initializeRequests [
	super initializeRequests.
	
	self request: BrSelectionRequest new
]

{ #category : #hooks }
BrTabGroupContentLook >> onTabDeselected: aTabModel [
	self widgetContent removeChildren
]

{ #category : #hooks }
BrTabGroupContentLook >> onTabRemoved: aTabModel [
	contentElementsCache removeKey: aTabModel ifAbsent: [  ]
]

{ #category : #hooks }
BrTabGroupContentLook >> onTabSelected: aTabModel [
	| aContentElement |
	
	self widgetContent removeChildren.

	aContentElement := contentElementsCache
		at: aTabModel
		ifAbsentPut: [
			| aStencilBuilder aTabContentElement |
			
			aStencilBuilder := aTabModel contentStencilBuilder.
			aTabContentElement := aStencilBuilder
				tabModel: aTabModel;
				asElement.
			aStencilBuilder tabModel: nil.
			aTabContentElement ].

	self widgetContent addChild: aContentElement
]
