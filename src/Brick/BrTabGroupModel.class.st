Class {
	#name : #BrTabGroupModel,
	#superclass : #BrWidgetModel,
	#instVars : [
		'tabs',
		'selectedTab'
	],
	#category : 'Brick-Tabs - Model'
}

{ #category : #'instance creation' }
BrTabGroupModel class >> with: aCollectionOfTabs [
	^ self new addTabs: aCollectionOfTabs
]

{ #category : #'api - tabs' }
BrTabGroupModel >> addTab: aBrTabModel [

	self tabs add: aBrTabModel.
	self onTabAdded: aBrTabModel
]

{ #category : #'api - tabs' }
BrTabGroupModel >> addTabs: aCollectionOfTabModels [
	aCollectionOfTabModels do: [ :aTabModel | self addTab: aTabModel ]
]

{ #category : #'gt-inspector-extension' }
BrTabGroupModel >> gtInspectorTabsIn: aComposite [
	<gtInspectorPresentationOrder: 80>

	^ aComposite fastList
		title: 'Tabs' translated;
		display: [ self tabs ]
]

{ #category : #'api - testing' }
BrTabGroupModel >> hasSelectedTab [
	<return: #Boolean>
	
	^ selectedTab isNotNil
]

{ #category : #'api - testing' }
BrTabGroupModel >> hasTab: aBrTabModel [
	<return: #Boolean>
	
	^ self tabs identityIncludes: aBrTabModel
]

{ #category : #initialization }
BrTabGroupModel >> initialize [
	super initialize.
	
	tabs := OrderedCollection new
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

	^ self isEmpty not
]

{ #category : #notifying }
BrTabGroupModel >> notifyTabAdded: aBrTabModel [
	self dispatchEvent: (BrTabAddedEvent tab: aBrTabModel)
]

{ #category : #notifying }
BrTabGroupModel >> notifyTabRemoved: aBrTabModel [
	self dispatchEvent: (BrTabRemovedEvent tab: aBrTabModel)
]

{ #category : #hooks }
BrTabGroupModel >> onAttachedTo: anElement [
	super onAttachedTo: anElement.

	"answer if somebody is interested in what tabs I have"
	self when: BrTabsRequest reply: [ :aResponse | aResponse tabs: self tabs ].

	anElement when: BrTabSelectedRequest do: [ :aRequest |
		self hasSelectedTab
			ifTrue: [ aRequest source dispatchEvent: (BrTabSelectedEvent tab: self selectedTab) ] ]
]

{ #category : #hooks }
BrTabGroupModel >> onTabAdded: aBrTabModel [

	aBrTabModel when: BrTabSelectedEvent do: [ :anEvent | self onTabSelected: anEvent currentTarget ].
	aBrTabModel when: BrTabDeselectedEvent do: [ :anEvent | self onTabDeselected: anEvent currentTarget ].

	self notifyTabAdded: aBrTabModel.
	
	"if user adds a tab marked as selected we should force select it"
	aBrTabModel isSelected
		ifTrue: [ ^ self onTabSelected: aBrTabModel ].
	
	"the first added tab should be selected by default"
	self tabs size = 1
		ifTrue: [ aBrTabModel select ]
]

{ #category : #hooks }
BrTabGroupModel >> onTabDeselected: aBrTabModel [
	selectedTab == aBrTabModel
		ifTrue: [
			selectedTab := nil.
			self dispatchEvent: (BrTabDeselectedEvent tab: aBrTabModel) ]
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

	selectedTab := aBrTabModel.
	self dispatchEvent: (BrTabSelectedEvent tab: aBrTabModel)
]

{ #category : #'api - tabs' }
BrTabGroupModel >> removeTab: aBrTabModel [
	| aTabIndex wasSelected |
	
	aTabIndex := self tabs indexOf: aBrTabModel.
	self tabs remove: aBrTabModel.
	
	"we have to deselect removed tab and select a new one before sending tab removed event
	otherwise deselection event will not bubble"
	wasSelected := aBrTabModel isSelected.
	aBrTabModel deselect.
	
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
		
	^ selectedTab
]

{ #category : #accessing }
BrTabGroupModel >> tabs [
	<return: #Collection of: #BrTabModel>

	^ tabs
]
