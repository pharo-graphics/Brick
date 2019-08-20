Class {
	#name : #BrTabGroupHeaderLook,
	#superclass : #BrLook,
	#instVars : [
		'tabs',
		'header',
		'tabbar',
		'toolbar',
		'scrollTabbar',
		'tabModels'
	],
	#category : #'Brick-Tabs - Look'
}

{ #category : #'api - accessing' }
BrTabGroupHeaderLook >> header [
	"Return an element that represents a container for tab bar and tool bar"
	<return: #BlElement>

	^ header
]

{ #category : #'api - accessing' }
BrTabGroupHeaderLook >> headerDo: aBlock [
	aBlock value: self header
]

{ #category : #initialization }
BrTabGroupHeaderLook >> initialize [
	super initialize.
	tabs := OrderedCollection new.
	header := BlElement new labeled: 'Header'.
	scrollTabbar := BlScrollableElement new  labeled: 'Scrollable'.
	header addChild: scrollTabbar as: #scrolltabbar.
	tabbar := BlElement new labeled: 'Tabbar'.
	scrollTabbar addChild: tabbar as: #tabbar.
	toolbar := BlElement new labeled: 'Toolbar'.
	header addChild: toolbar as: #toolbar.
	self addChangeAddChildAs: #(header) with: [ header ]
]

{ #category : #initialization }
BrTabGroupHeaderLook >> initializeListeners [
	super initializeListeners.
	self
		when: BrTabAddedEvent
		do: [ :anEvent | self onTabAdded: anEvent tab at: anEvent position ].
	self
		when: BrTabRemovedEvent
		do: [ :anEvent | self onTabRemoved: anEvent tab ].
	self
		when: BrTabsChangedEvent
		do: [ :anEvent | self onTabsChanged: anEvent tabs ].
	self
		when: BrTabSelectedEvent
		do: [ :anEvent | self onTabSelected: anEvent tab ].
	self
		when: BrTabDeselectedEvent
		do: [ :anEvent | self onTabDeselected: anEvent tab ]
]

{ #category : #initialization }
BrTabGroupHeaderLook >> initializeRequests [
	super initializeRequests.
	
	self request: BrTabsRequest new
]

{ #category : #hooks }
BrTabGroupHeaderLook >> onTabAdded: aBrTabModel at: anIndex [
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
BrTabGroupHeaderLook >> onTabDeselected: aBrTabModel [ 
	self toolbar removeChildren.
]

{ #category : #hooks }
BrTabGroupHeaderLook >> onTabRemoved: aBrTabModel [
	self
		assert: [ self isAttachedToWidget ]
		description: [ 'I can not receive the tab removed event without being attached to a widget' ].

	self tabs removeAllSuchThat: [ :eachAssoc | eachAssoc key = aBrTabModel ].
	aBrTabModel widgetDo: [ :aTabElement |
		self tabbar removeChild: aTabElement ]
]

{ #category : #'private - accessing' }
BrTabGroupHeaderLook >> onTabSelected: aTabModel [
	self toolbar removeChildren.
	
	aTabModel actionStencilBuilder
		ifNotNil: [ self toolbar addChild: aTabModel actionStencilBuilder asElement ]
]

{ #category : #hooks }
BrTabGroupHeaderLook >> onTabsChanged: aCollectionOfTabs [
	self
		assert: [ self isAttachedToWidget ]
		description:
			[ 'I can not receive the tabs changed event without being attached to a widget' ].
	self tabModels do: [ :aTabElement | self onTabRemoved: aTabElement ].
	aCollectionOfTabs
		withIndexDo: [ :aBrTabModel :anIndex | self onTabAdded: aBrTabModel at: anIndex ]
]

{ #category : #'api - accessing' }
BrTabGroupHeaderLook >> scrollTabbar [
	^ scrollTabbar
]

{ #category : #'api - accessing' }
BrTabGroupHeaderLook >> scrollTabbarDo: aBlock [
	aBlock value: self scrollTabbar
]

{ #category : #'private - accessing' }
BrTabGroupHeaderLook >> tabElements [
	^ self tabs 
		collect: #value 
		thenSelect: #isNotNil
]

{ #category : #'private - accessing' }
BrTabGroupHeaderLook >> tabModels [
	^ self tabs collect: #key
]

{ #category : #'api - accessing' }
BrTabGroupHeaderLook >> tabbar [
	^ tabbar
]

{ #category : #'api - accessing' }
BrTabGroupHeaderLook >> tabbarDo: aBlock [
	aBlock value: self tabbar
]

{ #category : #'private - accessing' }
BrTabGroupHeaderLook >> tabs [
	^ tabs
]

{ #category : #'api - accessing' }
BrTabGroupHeaderLook >> toolbar [
	^ toolbar
]

{ #category : #'api - accessing' }
BrTabGroupHeaderLook >> toolbarDo: aBlock [
	aBlock value: self toolbar
]
