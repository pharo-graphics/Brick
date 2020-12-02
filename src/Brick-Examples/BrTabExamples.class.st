Class {
	#name : #BrTabExamples,
	#superclass : #Object,
	#category : #'Brick-Examples-Tab'
}

{ #category : #'examples - tab model' }
BrTabExamples >> changeStencilTabModel [
	<gtExample>
	| aTabModel stencilChangedHander changed changedTabModel changedTabStencil |
	
	changed := 0.
	changedTabModel := nil.
	changedTabStencil := nil.
		
	aTabModel := self tabModel.
	aTabModel addEventHandler: (stencilChangedHander := BlEventHandler on: BrTabStencilChangedEvent do: [ :anEvent |
		changedTabModel := anEvent tab.
		changedTabStencil := anEvent stencil.
		changed := changed + 1. ]).
	
	aTabModel stencil: [ BlElement new ].

	self assert: changed equals: 1.
	self assert: changedTabStencil isNotNil.
	self assert: aTabModel contentStencilBuilder equals: changedTabStencil.
	self assert: changedTabModel equals: aTabModel.

	aTabModel removeEventHandler: stencilChangedHander.

	^ aTabModel
]

{ #category : #'examples - tab model' }
BrTabExamples >> changeToolbarStencilModel [
	<gtExample>
	| aTabModel stencilChangedHander changed changedTabModel changedTabStencil |
	
	changed := 0.
	changedTabModel := nil.
	changedTabStencil := nil.
		
	aTabModel := self tabModel.
	aTabModel addEventHandler: (stencilChangedHander := BlEventHandler on: BrTabToolbarChangedEvent do: [ :anEvent |
		changedTabModel := anEvent tab.
		changedTabStencil := anEvent stencil.
		changed := changed + 1. ]).
	
	aTabModel toolbarStencil: [ BrToolbar new ].

	self assert: changed equals: 1.
	self assert: changedTabStencil isNotNil.
	self assert: aTabModel toolbarStencilBuilder equals: changedTabStencil.
	self assert: changedTabModel equals: aTabModel.

	aTabModel removeEventHandler: stencilChangedHander.

	^ aTabModel
]

{ #category : #'examples - tab model' }
BrTabExamples >> deselectTabModel [
	<gtExample>
	| aTabModel selected deselected deselectedTab deselectedHandler |
	
	selected := deselected := 0.
	deselectedTab := nil.
	
	aTabModel := self selectTabModel.
	
	aTabModel addEventHandler: (deselectedHandler := BlEventHandler on: BrSelectedWish do: [ :anEvent |
		anEvent selected
			ifTrue: [ selected := selected + 1 ]
			ifFalse: [
				deselected := deselected + 1.
				deselectedTab := anEvent currentTarget ] ]).
	
	aTabModel deselect.

	self assert: aTabModel isSelected not.
	self assert: selected equals: 0.
	self assert: deselected equals: 1.
	self assert: deselectedTab equals: aTabModel.
	
	aTabModel removeEventHandler: deselectedHandler.

	^ aTabModel
]

{ #category : #'examples - ui header' }
BrTabExamples >> groupHeaderLook [
	<gtExample>

	^ BrTabGroupHeaderWithToolbarLook asLook
]

{ #category : #'examples - ui header' }
BrTabExamples >> groupHeaderWithAddedTabAtFirstPosition [
	<gtExample>
	
	| aTabGroupModel aHeaderElement aHeaderLook anExistingTabModel anAddedTabModel |
	aTabGroupModel := self tabGroupWithOneTab.
	aHeaderLook := self groupHeaderLook.
	aHeaderElement := BlElement new
		viewModel: aTabGroupModel;
		look: aHeaderLook;
		layout: BlLinearLayout vertical;
		constraintsDo: [ :c |
			c horizontal fitContent.
			c vertical fitContent ].
	
	self assert: aHeaderLook tabs size equals: 1.
	anExistingTabModel := aHeaderLook tabModels first.
	
	anAddedTabModel := self tabModel.
	aTabGroupModel addTab: anAddedTabModel at: 1.
	
	self assert: aHeaderLook tabs size equals: 2.
	self assert: aHeaderLook tabModels first equals: anAddedTabModel.
	self assert: aHeaderLook tabModels second equals: anExistingTabModel.
	
	^ aHeaderElement
]

{ #category : #'examples - ui header' }
BrTabExamples >> groupHeaderWithBoundTabs [
	<gtExample>
	| aHeaderElement tabElement1 tabElement2 tabElement3 |

	aHeaderElement := self groupHeaderWithoutBoundTabs.

	"binding order does not matter"
	tabElement2 := BlElement new
		viewModel: aHeaderElement viewModel tabs second;
		look: self groupTabLook.
		
	self assert: aHeaderElement children asArray equals: { aHeaderElement look header }.
	self assert: aHeaderElement children first children asArray equals: { aHeaderElement look scrollTabbar. aHeaderElement look toolbar . aHeaderElement look actionbar }.

	self assert: aHeaderElement look tabbar children asArray equals: { tabElement2 }.

	tabElement1 := BlElement new
		viewModel: aHeaderElement viewModel tabs first;
		look: self groupTabLook.
		
	self assert: aHeaderElement children asArray equals: { aHeaderElement look header }.
	self assert: aHeaderElement look tabbar children asArray equals: { tabElement1 . tabElement2 }.

	tabElement3 := BlElement new
		viewModel: aHeaderElement viewModel tabs third;
		look: self groupTabLook.

	self assert: aHeaderElement children asArray equals: { aHeaderElement look header }.
	self assert: aHeaderElement look tabbar children asArray equals: { tabElement1 . tabElement2 . tabElement3 }.

	^ aHeaderElement
]

{ #category : #'examples - ui header' }
BrTabExamples >> groupHeaderWithoutBoundTabs [
	<gtExample>	
	| tab1 tab2 tab3 tabGroup headerElement headerLook tabsRequest tabsChanged |
	
	tabsRequest := nil.
	
	tab1 := BrTabModel new add: (BrLabelModel text: 'Tab 1').
	tab2 := BrTabModel new add: (BrLabelModel text: 'Tab 2'); add: BrEnablementModel disabled.
	tab3 := BrTabModel new add: (BrLabelModel text: 'Tab 3').
	
	tabGroup := BrTabGroupModel with: { tab1 . tab2 . tab3 }.
	tabGroup when: BrTabGroupTabsRequest do: [ :aTabsRequest | tabsRequest := aTabsRequest copy ].
	
	headerLook := self groupHeaderLook.
	headerLook when: BrTabGroupTabsChangedEvent do: [ :aTabsChanged | tabsChanged := aTabsChanged copy ].
	
	headerElement := BlElement new
		viewModel: tabGroup;
		look: headerLook;
		layout: BlLinearLayout vertical;
		constraintsDo: [ :c |
			c horizontal fitContent.
			c vertical fitContent ].

	self assert: tabsRequest isNotNil.
	self assert: tabsRequest source equals: headerLook.

	self assert: tabsChanged isNotNil.
	self assert: tabsChanged source equals: tabGroup.

	self assert: headerElement children asArray equals: { headerLook header }.
		
	^ headerElement
]

{ #category : #'examples - ui header' }
BrTabExamples >> groupTabLook [
	<gtExample>

	^ BrTextLabelLook new
]

{ #category : #'examples - tab group model' }
BrTabExamples >> moveNotSelectedTabInGroupWithTwoTabs_FromOne_ToTwo [
	<gtExample>
	| aTabGroup aSelectedTab aNotSelectedTab |

	aTabGroup := self tabGroupWithTwoTabsSelectedAfterAdding.

	aSelectedTab := aTabGroup selectedTab.
	self assert: aSelectedTab equals: aTabGroup tabs second.
	aNotSelectedTab := aTabGroup tabs first.
	aTabGroup moveTab: aNotSelectedTab at: 2.

	self assert: aTabGroup tabs size equals: 2.
	self assert: aTabGroup tabs first equals: aSelectedTab.
	self assert: aTabGroup tabs second equals: aNotSelectedTab.
	
	self assert: aTabGroup isNotEmpty.
	self assert: aTabGroup hasSelectedTab.
	self assert: aTabGroup selectedIndices first equals: 1.
	self assert: aTabGroup selectedTab equals: aSelectedTab.
	self assert: aTabGroup selectedTab equals: aTabGroup tabs first.
	self assert: aTabGroup tabs first isSelected.
	self assert: aTabGroup tabs second isSelected not.

	^ aTabGroup
]

{ #category : #'examples - tab group model' }
BrTabExamples >> moveSelectedTabInGroupWithTwoTabs_FromTwo_ToOne [
	<gtExample>
	| aTabGroup aSelectedTab aNotSelectedTab |

	aTabGroup := self tabGroupWithTwoTabsSelectedAfterAdding.

	aSelectedTab := aTabGroup selectedTab.
	self assert: aSelectedTab equals: aTabGroup tabs second.
	aNotSelectedTab := aTabGroup tabs first.
	aTabGroup moveTab: aSelectedTab at: 1.

	self assert: aTabGroup tabs size equals: 2.
	self assert: aTabGroup tabs first equals: aSelectedTab.
	self assert: aTabGroup tabs second equals: aNotSelectedTab.
	
	self assert: aTabGroup isNotEmpty.
	self assert: aTabGroup hasSelectedTab.
	self assert: aTabGroup selectedIndices first equals: 1.
	self assert: aTabGroup selectedTab equals: aSelectedTab.
	self assert: aTabGroup selectedTab equals: aTabGroup tabs first.
	self assert: aTabGroup tabs first isSelected.
	self assert: aTabGroup tabs second isSelected not.

	^ aTabGroup
]

{ #category : #'examples - tab group model' }
BrTabExamples >> removeNotSelectedTabFromGroupWithTwoTabs [
	<gtExample>
	| aTabGroup |

	aTabGroup := self tabGroupWithTwoTabsSelectedAfterAdding.

	self assert: aTabGroup selectedTab equals: aTabGroup tabs second.
	aTabGroup removeTab: aTabGroup tabs first.

	self assert: aTabGroup isNotEmpty.
	self assert: aTabGroup hasSelectedTab.
	self assert: aTabGroup selectedTab equals: aTabGroup tabs first.
	self assert: aTabGroup tabs first isSelected.

	^ aTabGroup
]

{ #category : #'examples - tab group model' }
BrTabExamples >> removeSelectedTabFromGroupWithTwoTabs [
	<gtExample>
	| aTabGroup |

	aTabGroup := self tabGroupWithTwoTabsSelectedAfterAdding.

	self assert: aTabGroup selectedTab equals: aTabGroup tabs second.	
	aTabGroup removeTab: aTabGroup selectedTab.

	self assert: aTabGroup isNotEmpty.
	self assert: aTabGroup hasSelectedTab.
	self assert: aTabGroup selectedTab equals: aTabGroup tabs first.
	self assert: aTabGroup tabs first isSelected.

	^ aTabGroup
]

{ #category : #'examples - tab model' }
BrTabExamples >> selectTabModel [
	<gtExample>
	| aTabModel selected selectedTab deselected selectedHander |
	
	selected := deselected := 0.
	selectedTab := nil.
	
	aTabModel := self tabModel.
	aTabModel addEventHandler: (selectedHander := BlEventHandler on: BrSelectedWish do: [ :anEvent |
		anEvent selected
			ifTrue: [
				selected := selected + 1.
				selectedTab := anEvent currentTarget ]
			ifFalse: [ deselected := deselected + 1 ] ]).
	
	aTabModel select.
	
	self assert: aTabModel isSelected.
	self assert: selected equals: 1.
	self assert: deselected equals: 0.
	self assert: selectedTab equals: aTabModel.

	aTabModel removeEventHandler: selectedHander.

	^ aTabModel
]

{ #category : #'instance creation' }
BrTabExamples >> tabGroupModel [
	<gtExample>
	| aTabGroup |

	aTabGroup := BrTabGroupModel new.
	self assert: aTabGroup isEmpty.
	self assert: aTabGroup hasSelectedTab not.
	
	^ aTabGroup
]

{ #category : #'examples - tab group model' }
BrTabExamples >> tabGroupWithOneTab [
	<gtExample>
	| aTabGroupModel aTab theWishes |
	
	aTabGroupModel := self tabGroupModel.
	self assert: aTabGroupModel isEmpty.
	self assert: aTabGroupModel hasSelectedTab not.
	
	aTab := self tabModel.
	
	theWishes := OrderedCollection new.
	aTab when: BrSelectedWish do: [ :aWish | theWishes add: aWish ].

	self assert: aTab isSelected not.

	aTabGroupModel addTab: aTab.

	self assert: aTab isSelected.
	"make sure that a tab received a selection wish"
	self assert: theWishes size equals: 1.
	self assert: (theWishes first isKindOf: BrSelectedWish).
	self assert: theWishes first selected.

	self assert: aTabGroupModel isNotEmpty.
	self assert: aTabGroupModel hasSelectedTab.
	self assert: aTabGroupModel selectedTab equals: aTab.

	^ aTabGroupModel
]

{ #category : #'examples - tab group model' }
BrTabExamples >> tabGroupWithOneTabChangingStencil [
	<gtExample>
	| aTabGroupModel aTabModel changed changedTabModel changedTabStencil stencilChangedHander |
	
	changed := 0.
	changedTabModel := nil.
	changedTabStencil := nil.
		
	aTabGroupModel := self tabGroupModel.	
	aTabGroupModel addEventHandler: (stencilChangedHander := BlEventHandler on: BrTabStencilChangedEvent do: [ :anEvent |
		changedTabModel := anEvent tab.
		changedTabStencil := anEvent stencil.
		changed := changed + 1. ]).
	
	aTabModel := self tabModel.	
	aTabGroupModel addTab: aTabModel.
	
	aTabModel stencil: [ BlElement new ].

	self assert: changed equals: 1.
	self assert: changedTabStencil isNotNil.
	self assert: aTabModel contentStencilBuilder equals: changedTabStencil.
	self assert: changedTabModel equals: aTabModel.

	aTabModel removeEventHandler: stencilChangedHander.

	self assert: aTabGroupModel isNotEmpty.
	self assert: aTabGroupModel hasSelectedTab.
	self assert: aTabGroupModel selectedTab equals: aTabModel.

	^ aTabGroupModel
]

{ #category : #'examples - tab group model' }
BrTabExamples >> tabGroupWithOneTabChangingToolbarStencil [
	<gtExample>
	| aTabGroupModel aTabModel changed changedTabModel changedTabStencil stencilChangedHander |
	
	changed := 0.
	changedTabModel := nil.
	changedTabStencil := nil.
		
	aTabGroupModel := self tabGroupModel.	
	aTabGroupModel addEventHandler: (stencilChangedHander := BlEventHandler on: BrTabToolbarChangedEvent do: [ :anEvent |
		changedTabModel := anEvent tab.
		changedTabStencil := anEvent stencil.
		changed := changed + 1. ]).
	
	aTabModel := self tabModel.	
	aTabGroupModel addTab: aTabModel.
	
	aTabModel toolbarStencil: [ BrToolbar new ].

	self assert: changed equals: 1.
	self assert: changedTabStencil isNotNil.
	self assert: aTabModel toolbarStencilBuilder equals: changedTabStencil.
	self assert: changedTabModel equals: aTabModel.

	aTabModel removeEventHandler: stencilChangedHander.

	self assert: aTabGroupModel isNotEmpty.
	self assert: aTabGroupModel hasSelectedTab.
	self assert: aTabGroupModel selectedTab equals: aTabModel.

	^ aTabGroupModel
]

{ #category : #'examples - tab group model' }
BrTabExamples >> tabGroupWithSecondSelectedTabAddedAtFirstPosition [
	<gtExample>
	| aTabGroup aTab |
	
	aTabGroup := self tabGroupWithOneTab.
	
	aTab := self tabModel.
	aTab select.

	aTabGroup addTab: aTab at: 1.

	self assert: aTab isSelected.
	self assert: aTabGroup isNotEmpty.
	self assert: aTabGroup hasSelectedTab.
	self assert: aTabGroup selectedIndices equals: #(1).
	self assert: aTabGroup selectedTab equals: aTab.

	^ aTabGroup
]

{ #category : #'examples - tab group model' }
BrTabExamples >> tabGroupWithSecondTabAddedAtFirstPosition [
	<gtExample>
	| aTabGroup aTab theWishes |
	
	aTabGroup := self tabGroupWithOneTab.
	
	aTab := self tabModel.

	aTabGroup addTab: aTab at: 1.

	theWishes := OrderedCollection new.
	aTab when: BrSelectedWish do: [ :aWish | theWishes add: aWish ].

	self assert: theWishes isEmpty.
	self assert: aTab isSelected not.
	self assert: aTabGroup isNotEmpty.
	self assert: aTabGroup hasSelectedTab.
	self assert: aTabGroup selectedIndices equals: #(2).
	self assert: aTabGroup selectedTab equals: (aTabGroup tabs at: 2).
	self assert: aTabGroup selectedTab ~= aTab.

	^ aTabGroup
]

{ #category : #'examples - tab group model' }
BrTabExamples >> tabGroupWithTabAddedAtFirstPosition [
	<gtExample>
	| aTabGroup anExistingTab anAddedTab |
	
	aTabGroup := self tabGroupWithOneTab.
	anExistingTab := aTabGroup tabs first.
	
	anAddedTab := self tabModel.

	aTabGroup addTab: anAddedTab at: 1.
	
	"anAddedTab should be first"
	self assert: aTabGroup tabs first equals: anAddedTab.
	self assert: aTabGroup tabs second equals: anExistingTab.
	
	"a tab selected after adding must become selected"
	anAddedTab select.
	
	self assert: anAddedTab isSelected.
	self assert: aTabGroup isNotEmpty.
	self assert: aTabGroup hasSelectedTab.
	self assert: aTabGroup selectedTab equals: anAddedTab.

	^ aTabGroup
]

{ #category : #'examples - tab group model' }
BrTabExamples >> tabGroupWithTwoTabsSelectedAfterAdding [
	<gtExample>
	| aTabGroup aTab |
	
	aTabGroup := self tabGroupWithOneTab.
	
	aTab := self tabModel.

	aTabGroup addTab: aTab.
	
	"a tab selected after adding must become selected"
	aTab select.
	
	self assert: aTab isSelected.
	self assert: aTabGroup isNotEmpty.
	self assert: aTabGroup hasSelectedTab.
	self assert: aTabGroup selectedTab equals: aTab.

	^ aTabGroup
]

{ #category : #'examples - tab group model' }
BrTabExamples >> tabGroupWithTwoTabsSelectedBeforeAdding [
	<gtExample>
	| aTabGroup aTab |
	
	aTabGroup := self tabGroupWithOneTab.
	
	aTab := self tabModel.
	"a tab selected before adding it to a group must remain selected"
	aTab select.

	aTabGroup addTab: aTab.
	
	self assert: aTab isSelected.

	self assert: aTabGroup isNotEmpty.
	self assert: aTabGroup hasSelectedTab.
	self assert: aTabGroup selectedTab equals: aTab.

	^ aTabGroup
]

{ #category : #'examples - tab group model' }
BrTabExamples >> tabGroupWithTwoTabsWithoutExplicitSelection [
	<gtExample>
	| aTabGroup aTab |
	
	aTabGroup := self tabGroupWithOneTab.
	
	aTab := self tabModel.
	aTabGroup addTab: aTab.
	
	self assert: aTab isSelected not.
	self assert: aTabGroup isNotEmpty.
	self assert: aTabGroup hasSelectedTab.
	self assert: aTabGroup selectedTab equals: aTabGroup tabs first.

	^ aTabGroup
]

{ #category : #'instance creation' }
BrTabExamples >> tabModel [
	<gtExample>
	| aTabModel |
	
	aTabModel := BrTabModel new.
	self assert: aTabModel isSelected not.
	
	^ aTabModel
]
