Class {
	#name : #BrTabGroupHeaderAptitude,
	#superclass : #BrAptitude,
	#instVars : [
		'tabs',
		'header',
		'tabbar',
		'scrollTabbar'
	],
	#category : #'Brick-Tabs - Look'
}

{ #category : #'api - accessing' }
BrTabGroupHeaderAptitude >> header [
	"Return an element that represents a container for tab bar and tool bar"
	<return: #BlElement>

	^ header
]

{ #category : #'api - accessing' }
BrTabGroupHeaderAptitude >> headerDo: aBlock [
	aBlock value: self header
]

{ #category : #initialization }
BrTabGroupHeaderAptitude >> initialize [
	super initialize.
	"We have the following structure:
	
	- header
		- scrollable
			- tabbar
	"
	tabs := OrderedCollection new.

	header := BlElement new labeled: 'Header'.
	scrollTabbar := BlScrollableElement new labeled: 'Scrollable'.
	tabbar := BlElement new labeled: 'Tabbar'.

	scrollTabbar addChild: tabbar as: #tabbar.

	header addChild: scrollTabbar as: #scrolltabbar.

	self addChangeAddChildAs: #(header) with: [ header ].
]

{ #category : #initialization }
BrTabGroupHeaderAptitude >> initializeListeners [
	super initializeListeners.
	self
		when: BrTabAddedEvent
		do: [ :anEvent | self onTabAdded: anEvent tab at: anEvent position ].
	self
		when: BrTabMovedEvent
		do: [ :anEvent | self onTabMoved: anEvent tab from: anEvent oldPosition to: anEvent newPosition ].
	self
		when: BrTabRemovedEvent
		do: [ :anEvent | self onTabRemoved: anEvent tab ].
	self
		when: BrTabGroupTabsChangedEvent
		do: [ :anEvent | self onTabsChanged: anEvent tabs ].
	self
		when: BrTabSelectedEvent
		do: [ :anEvent | self onTabSelected: anEvent tab ].
	self
		when: BrTabDeselectedEvent
		do: [ :anEvent | self onTabDeselected: anEvent tab ].

]

{ #category : #hooks }
BrTabGroupHeaderAptitude >> onTabAdded: aBrTabModel at: anIndex [
	| anAssoc |
	self
		assert: [ self isAttachedToWidget ]
		description: [ 'I can not receive the tab added event without being attached to a widget' ].

	anAssoc := aBrTabModel -> nil.
	self tabs add: anAssoc beforeIndex: anIndex.

	aBrTabModel whenAttachedDo: [ :aTabElement |
		self tabbar removeChildren: self tabElements.
		anAssoc value: aTabElement.
		self tabbar addChildren: self tabElements ]
]

{ #category : #hooks }
BrTabGroupHeaderAptitude >> onTabDeselected: aBrTabModel [ 
	self
		assert: [ self isAttachedToWidget ]
		description: [ 'I can not receive the tab deselected event without being attached to a widget' ].

]

{ #category : #hooks }
BrTabGroupHeaderAptitude >> onTabMoved: aBrTabModel from: anOldIndex to: aNewIndex [
	| anAssoc |
	self
		assert: [ self isAttachedToWidget ]
		description: [ 'I can not receive the tab moved event without being attached to a widget' ].

	anAssoc := self tabs at: anOldIndex.
	self
		assert: [ anAssoc key == aBrTabModel ]
		description: [ 'The moved tab at the old position must be identical to the local tab model at the same position' ].
	
	self tabs remove: anAssoc.
	self tabs add: anAssoc beforeIndex: aNewIndex.

	aBrTabModel whenAttachedDo: [ :aTabElement |
		self tabbar removeChildren: self tabElements.
		anAssoc value: aTabElement.
		self tabbar addChildren: self tabElements ]
]

{ #category : #hooks }
BrTabGroupHeaderAptitude >> onTabRemoved: aBrTabModel [
	self
		assert: [ self isAttachedToWidget ]
		description: [ 'I can not receive the tab removed event without being attached to a widget' ].

	self tabs removeAllSuchThat: [ :eachAssoc | eachAssoc key = aBrTabModel ].
	aBrTabModel widgetDo: [ :aTabElement |
		self tabbar removeChild: aTabElement ]
]

{ #category : #hooks }
BrTabGroupHeaderAptitude >> onTabSelected: aTabModel [
	self
		assert: [ self isAttachedToWidget ]
		description: [ 'I can not receive the tab selected event without being attached to a widget' ]
]

{ #category : #hooks }
BrTabGroupHeaderAptitude >> onTabsChanged: aCollectionOfTabs [
	self
		assert: [ self isAttachedToWidget ]
		description:
			[ 'I can not receive the tabs changed event without being attached to a widget' ].
	self tabModels do: [ :aTabElement | self onTabRemoved: aTabElement ].
	aCollectionOfTabs
		withIndexDo: [ :aBrTabModel :anIndex | self onTabAdded: aBrTabModel at: anIndex ]
]

{ #category : #'api - accessing' }
BrTabGroupHeaderAptitude >> scrollTabbar [
	<return: #BlElement>

	^ scrollTabbar
]

{ #category : #'api - accessing' }
BrTabGroupHeaderAptitude >> scrollTabbarDo: aBlock [
	aBlock value: self scrollTabbar
]

{ #category : #'private - accessing' }
BrTabGroupHeaderAptitude >> tabElements [
	^ self tabs 
		collect: #value 
		thenSelect: #isNotNil
]

{ #category : #'private - accessing' }
BrTabGroupHeaderAptitude >> tabModels [
	^ self tabs collect: #key
]

{ #category : #'api - accessing' }
BrTabGroupHeaderAptitude >> tabbar [
	<return: #BlElement>

	^ tabbar
]

{ #category : #'api - accessing' }
BrTabGroupHeaderAptitude >> tabbarDo: aBlock [
	aBlock value: self tabbar
]

{ #category : #'private - accessing' }
BrTabGroupHeaderAptitude >> tabs [
	^ tabs
]
