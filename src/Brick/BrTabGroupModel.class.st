Class {
	#name : #BrTabGroupModel,
	#superclass : #BrWidgetModel,
	#traits : 'TBrSelectable',
	#classTraits : 'TBrSelectable classTrait',
	#instVars : [
		'tabs',
		'actionbarStencilBuilder'
	],
	#category : #'Brick-Tabs - Model'
}

{ #category : #'instance creation' }
BrTabGroupModel class >> with: aCollectionOfTabs [
	^ self new addTabs: aCollectionOfTabs
]

{ #category : #accessing }
BrTabGroupModel >> actionbarStencil: anActionbarStencilBuilder [
	"Set a stencil to be used to create an action bar in the header of the tabgroup.
	An action bar is usually located on the right side of the header"

	actionbarStencilBuilder := anActionbarStencilBuilder asStencilBuilder.
	self notifyActionbarChanged: actionbarStencilBuilder
]

{ #category : #'api - tabs' }
BrTabGroupModel >> addTab: aBrTabModel [
	self addTab: aBrTabModel at: self tabs size + 1
]

{ #category : #'api - tabs' }
BrTabGroupModel >> addTab: aBrTabModel at: anIndex [
	self tabs add: aBrTabModel beforeIndex: anIndex.
	self onTabAdded: aBrTabModel at: anIndex
]

{ #category : #'api - tabs' }
BrTabGroupModel >> addTabs: aCollectionOfTabModels [
	aCollectionOfTabModels do: [ :aTabModel | self addTab: aTabModel ]
]

{ #category : #'gt-extension' }
BrTabGroupModel >> gtInspectorTabsIn: aComposite [
	<gtInspectorPresentationOrder: 80>

	^ aComposite fastList
		title: 'Tabs' translated;
		display: [ self tabs ]
]

{ #category : #'api - testing' }
BrTabGroupModel >> hasSelectedTab [
	<return: #Boolean>
	
	^ selectionModel hasSelection
]

{ #category : #'api - testing' }
BrTabGroupModel >> hasTab: aBrTabModel [
	<return: #Boolean>
	
	^ self tabs identityIncludes: aBrTabModel
]

{ #category : #'api - tabs' }
BrTabGroupModel >> indexOf: aTab [
	"It returns 0 if a tab is not present"
	<return: #Number>

	^ self tabs indexOf: aTab
]

{ #category : #initialization }
BrTabGroupModel >> initialize [
	super initialize.
	
	"selection is an essential part of the Tab API"
	self add: (selectionModel := BrSelectionModel new).
	tabs := OrderedCollection new
]

{ #category : #hooks }
BrTabGroupModel >> initializeListeners [
	super initializeListeners.
	
	"answer if somebody is interested in what tabs I have"
	self when: BrTabGroupTabsRequest reply: [ :aResponse | aResponse tabs: self tabs ].
	self when: BrTabGroupActionbarRequest reply: [ :aResponse | aResponse stencil: actionbarStencilBuilder ].

	self when: BrSelectionChanged do: [ :anEvent | anEvent
		deselectedDo: [ :anInterval | anInterval do: [ :eachTabIndex |
			(eachTabIndex between: 1 and: tabs size)
				ifTrue: [ self notifyTabDeselected: (self tabs at: eachTabIndex) ] ] ] ;
		selectedDo: [ :anInterval | anInterval do: [ :eachTabIndex |
			(eachTabIndex between: 1 and: tabs size)	
				ifTrue: [ self notifyTabSelected: (self tabs at: eachTabIndex) ] ] ] ]
]

{ #category : #'api - testing' }
BrTabGroupModel >> isEmpty [
	"Return true if there are no tabs in a group, false otherwise"
	<return: #Boolean>
	
	^ self tabs isEmpty
]

{ #category : #'api - testing' }
BrTabGroupModel >> isNotEmpty [
	"Return true if there is at least one tab in a group, false otherwise"
	<return: #Boolean>

	^ self tabs isNotEmpty
]

{ #category : #'api - selection' }
BrTabGroupModel >> maxSelectionIndex [
	<return: #Number>
	
	^ self tabs size
]

{ #category : #'api - tabs' }
BrTabGroupModel >> moveTab: aBrTabModel at: aNewIndex [
	| aCurrentIndex wasSelected aSelectedTab |
	aCurrentIndex := self indexOf: aBrTabModel.
	self 
		assert: [ aCurrentIndex isZero not ]
		description: [ 'Only an existing tab can be moved' ].
	aCurrentIndex = aNewIndex ifTrue: [ ^ self ].

	"we have to deselect moved tab and select it again before sending tab moved event
	otherwise selection event will not bubble"
	wasSelected := aBrTabModel isSelected.
	wasSelected ifTrue: [ aBrTabModel deselect ].

	aSelectedTab := (self hasSelectedTab and: [ wasSelected not ])
		ifTrue: [ self selectedTab ].

	self tabs remove: aBrTabModel.
	self tabs add: aBrTabModel beforeIndex: aNewIndex.
	
	self 
		assert: [ (self indexOf: aBrTabModel) = aNewIndex ]
		description: [ 'Moved tab should be now at the expected position' ].

	aSelectedTab
		ifNotNil: [ self selectOne: (self indexOf: aSelectedTab) ].
	
	wasSelected ifTrue: [ 
		aBrTabModel select.
		self selectOne: (self indexOf: aBrTabModel) ].
	
	self onTabMoved: aBrTabModel from: aCurrentIndex to: aNewIndex
]

{ #category : #notifying }
BrTabGroupModel >> notifyActionbarChanged: aStencil [
	self dispatchEvent: (BrTabGroupActionbarChangedEvent new stencil: aStencil)
]

{ #category : #notifying }
BrTabGroupModel >> notifyTabAdded: aBrTabModel at: anIndex [
	self dispatchEvent: ((BrTabAddedEvent tab: aBrTabModel) position: anIndex)
]

{ #category : #notifying }
BrTabGroupModel >> notifyTabDeselected: aBrTabModel [
	self dispatchEvent: (BrTabDeselectedEvent tab: aBrTabModel)
]

{ #category : #notifying }
BrTabGroupModel >> notifyTabMoved: aBrTabModel from: anOldIndex to: aNewIndex [
	self dispatchEvent: ((BrTabMovedEvent tab: aBrTabModel) 
		oldPosition: anOldIndex;
		newPosition: aNewIndex)
]

{ #category : #notifying }
BrTabGroupModel >> notifyTabRemoved: aBrTabModel [
	self dispatchEvent: (BrTabRemovedEvent tab: aBrTabModel)
]

{ #category : #notifying }
BrTabGroupModel >> notifyTabSelected: aBrTabModel [
	self dispatchEvent: (BrTabSelectedEvent tab: aBrTabModel)
]

{ #category : #notifying }
BrTabGroupModel >> notifyTabStencilChanged: anEvent [
	self dispatchEvent: anEvent
]

{ #category : #notifying }
BrTabGroupModel >> notifyTabToolbarChanged: anEvent [
	self dispatchEvent: anEvent
]

{ #category : #hooks }
BrTabGroupModel >> onTabAdded: aBrTabModel at: anIndex [
	aBrTabModel
		when: BrSelectedWish
		do: [ :anEvent |
			anEvent selected
				ifTrue: [ self onTabSelected: anEvent currentTarget ]
				ifFalse: [ self onTabDeselected: anEvent currentTarget ] ].
			
	aBrTabModel 
		when: BrTabStencilChangedEvent 
		do: [ :anEvent | 
			self notifyTabStencilChanged: anEvent ].

	aBrTabModel 
		when: BrTabToolbarChangedEvent 
		do: [ :anEvent | 
			self notifyTabToolbarChanged: anEvent ].

	self notifyTabAdded: aBrTabModel at: anIndex.
		
	"if user adds a tab marked as selected we should force select it"
	aBrTabModel isSelected
		ifTrue: [ ^ self onTabSelected: aBrTabModel ].

	"the first added tab should be selected by default"
	self tabs size = 1
		ifTrue: [ aBrTabModel select ]
]

{ #category : #hooks }
BrTabGroupModel >> onTabDeselected: aBrTabModel [
	self
		assert: [ self hasTab: aBrTabModel ]
		description: [ 'A tab must exist' ].

	self deselectOne: (self indexOf: aBrTabModel)
]

{ #category : #hooks }
BrTabGroupModel >> onTabMoved: aBrTabModel from: anOldIndex to: aNewIndex [
	self notifyTabMoved: aBrTabModel from: anOldIndex to: aNewIndex.
]

{ #category : #hooks }
BrTabGroupModel >> onTabRemoved: aBrTabModel at: anIndex [
	self notifyTabRemoved: aBrTabModel
]

{ #category : #hooks }
BrTabGroupModel >> onTabSelected: aBrTabModel [
	self tabs
		select: [ :eachTabModel | eachTabModel ~~ aBrTabModel ]
		thenDo: #deselect.

	self selectOne: (self indexOf: aBrTabModel)
]

{ #category : #'api - tabs' }
BrTabGroupModel >> removeTab: aBrTabModel [
	| aTabIndex wasSelected aSelectedTab |

	"we have to deselect removed tab and select a new one before sending tab removed event
	otherwise deselection event will not bubble"
	wasSelected := aBrTabModel isSelected.
	aBrTabModel deselect.

	aSelectedTab := (self hasSelectedTab and: [ wasSelected not ])
		ifTrue: [ self selectedTab ].
		
	self 
		assert: [ aSelectedTab ~= aBrTabModel ]
		description: [ 'Selected tab cannot be the removed tab' ].

	aTabIndex := self tabs indexOf: aBrTabModel.
	self tabs remove: aBrTabModel.

	aSelectedTab
		ifNotNil: [ self selectOne: (self indexOf: aSelectedTab) ].

	(self isNotEmpty and: [ wasSelected ])
		ifTrue: [ (self tabs at: (aTabIndex min: self tabs size)) select ].

	self onTabRemoved: aBrTabModel at: aTabIndex
]

{ #category : #'api - tabs' }
BrTabGroupModel >> selectedTab [
	<return: #BrTabModel>
	
	self
		assert: [ self hasSelectedTab ]
		description: [ 'Can not access a selected tab if there is no one' ].
		
	^ self tabs at: self selectedIndices first
]

{ #category : #accessing }
BrTabGroupModel >> tabs [
	<return: #Collection of: #BrTabModel>

	^ tabs
]
