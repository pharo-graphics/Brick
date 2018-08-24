Class {
	#name : #BrTabGroupHeaderLook,
	#superclass : #BrLook,
	#instVars : [
		'tabs',
		'header',
		'tabbar',
		'toolbar'
	],
	#category : 'Brick-Tabs - Look'
}

{ #category : #'api - accessing' }
BrTabGroupHeaderLook >> header [
	^ header
]

{ #category : #'api - accessing' }
BrTabGroupHeaderLook >> headerDo: aBlock [
	aBlock value: self header
]

{ #category : #initialization }
BrTabGroupHeaderLook >> initialize [
	super initialize.

	tabs := OrderedDictionary new.
	header := BlElement new.
	tabbar := BlElement new.
	toolbar := BlElement new
]

{ #category : #initialization }
BrTabGroupHeaderLook >> initializeListeners [
	super initializeListeners.

	self when: BrTabAddedEvent do: [ :anEvent | self onTabAdded: anEvent tab ].
	self when: BrTabRemovedEvent do: [ :anEvent | self onTabRemoved: anEvent tab ].
	self when: BrTabsChangedEvent do: [ :anEvent | self onTabsChanged: anEvent tabs ].
	self when: BrTabSelectedEvent do: [ :anEvent | self onTabSelected: anEvent tab ].
	self when: BrTabDeselectedEvent do: [ :anEvent | self onTabDeselected: anEvent tab ]
	
]

{ #category : #initialization }
BrTabGroupHeaderLook >> initializeLook [
	super initializeLook.

	self widget addChild: header as: #header.
	header addChild: tabbar as: #tabbar.
	header addChild: toolbar as: #toolbar
]

{ #category : #initialization }
BrTabGroupHeaderLook >> initializeRequests [
	super initializeRequests.
	
	self request: BrTabsRequest new
]

{ #category : #hooks }
BrTabGroupHeaderLook >> onTabAdded: aBrTabModel [
	self
		assert: [ self isAttachedToWidget ]
		description: [ 'I can not receive the tab added event without being attached to a widget' ].

	self tabs at: aBrTabModel put: nil.

	aBrTabModel whenAttachedDo: [ :aTabElement |
		self tabbar removeChildren: self tabElements.
		self tabs at: aBrTabModel put: aTabElement.
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

	self tabs removeKey: aBrTabModel.
	aBrTabModel widgetDo: [ :aTabElement |
		self tabbar removeChild: aTabElement ]
]

{ #category : #'private - accessing' }
BrTabGroupHeaderLook >> onTabSelected: aTabModel [
	self toolbar removeChildren.
	self toolbar addChild: aTabModel actionStencilBuilder asElement
]

{ #category : #hooks }
BrTabGroupHeaderLook >> onTabsChanged: aCollectionOfTabs [
	self
		assert: [ self isAttachedToWidget ]
		description: [ 'I can not receive the tabs changed event without being attached to a widget' ].

	self tabModels do: [ :aTabElement | self onTabRemoved: aTabElement ].
	aCollectionOfTabs do: [ :aBrTabModel | self onTabAdded: aBrTabModel ]
]

{ #category : #'private - accessing' }
BrTabGroupHeaderLook >> tabElements [
	^ tabs values select: #isNotNil
]

{ #category : #'private - accessing' }
BrTabGroupHeaderLook >> tabModels [
	^ tabs keys
]

{ #category : #'private - accessing' }
BrTabGroupHeaderLook >> tabbar [
	^ tabbar
]

{ #category : #'private - accessing' }
BrTabGroupHeaderLook >> tabs [
	^ tabs
]

{ #category : #'api - accessing' }
BrTabGroupHeaderLook >> toolbar [
	^ toolbar
]
