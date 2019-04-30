Class {
	#name : #BrTabGroupContentLook,
	#superclass : #BrLook,
	#instVars : [
		'content',
		'contentElementsCache'
	],
	#category : 'Brick-Tabs - Look'
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
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical fitContent ].
	contentElementsCache := IdentityDictionary new.
	changes
		add: (#(content) asBrLookChildAddAsChangeWithValue: [ content ])
]

{ #category : #initialization }
BrTabGroupContentLook >> initializeListeners [
	super initializeListeners.

	self when: BrTabSelectedEvent do: [ :anEvent | self onTabSelected: anEvent tab ].
	self when: BrTabDeselectedEvent do: [ :anEvent | self onTabDeselected: anEvent tab ]
]

{ #category : #initialization }
BrTabGroupContentLook >> initializeRequests [
	super initializeRequests.
	
	self request: BrTabSelectedRequest new
]

{ #category : #hooks }
BrTabGroupContentLook >> onTabDeselected: aTabModel [
	self widgetContent removeChildren
]

{ #category : #hooks }
BrTabGroupContentLook >> onTabSelected: aTabModel [
	| aContentElement |
	self widgetContent removeChildren.

	aContentElement := contentElementsCache
		at: aTabModel
		ifAbsentPut: [ aTabModel contentStencilBuilder asElement ].

	self widgetContent addChild: aContentElement
]
