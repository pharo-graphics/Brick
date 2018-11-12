Class {
	#name : #BrTabExamples,
	#superclass : #Object,
	#category : #'Brick-Examples-Tab'
}

{ #category : #'examples - tab model' }
BrTabExamples >> deselectTabModel [
	<gtExample>
	| aTabModel selected deselected deselectedTab selectedHander deselectedHandler |
	
	selected := deselected := 0.
	deselectedTab := nil.
	
	aTabModel := self selectTabModel.
	aTabModel addEventHandler: (selectedHander := BlEventHandler on: BrTabSelectedEvent do: [ selected := selected + 1 ]).
	aTabModel addEventHandler: (deselectedHandler := BlEventHandler on: BrTabDeselectedEvent do: [ :anEvent |
		deselected := deselected + 1.
		deselectedTab := anEvent tab ]).
	
	aTabModel deselect.

	self assert: aTabModel isSelected not.
	self assert: selected equals: 0.
	self assert: deselected equals: 1.
	self assert: deselectedTab equals: aTabModel.
	
	aTabModel removeEventHandler: selectedHander.
	aTabModel removeEventHandler: deselectedHandler.

	^ aTabModel
]

{ #category : #'examples - ui header' }
BrTabExamples >> groupHeaderLook [
	<gtExample>

	^ BrTabGroupHeaderLook asLook + (BrLayoutLook of: #header) linearHorizontal
]

{ #category : #'examples - ui header' }
BrTabExamples >> groupHeaderWithBoundTabs [
	<gtExample>	
	| aHeaderElement tabElement1 tabElement2 tabElement3 |

	aHeaderElement := self groupHeaderWithoutBoundTabs.

	"binding order does not matter"
	tabElement2 := BlElement new
		look: self groupTabLook;
		viewModel: aHeaderElement viewModel tabs second.
		
	self assert: aHeaderElement children asArray equals: { aHeaderElement look header }.
	self assert: aHeaderElement children first children asArray equals: { aHeaderElement look scrollTabbar. aHeaderElement look toolbar }.

	self assert: aHeaderElement look tabbar children asArray equals: { tabElement2 }.

	tabElement1 := BlElement new
		look: self groupTabLook;
		viewModel: aHeaderElement viewModel tabs first.
		
	self assert: aHeaderElement children asArray equals: { aHeaderElement look header }.
	self assert: aHeaderElement look tabbar children asArray equals: { tabElement1 . tabElement2 }.

	tabElement3 := BlElement new
		look: self groupTabLook;
		viewModel: aHeaderElement viewModel tabs third.

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
	tab2 := BrTabModel new add: (BrLabelModel text: 'Tab 2'); add: BrActivationModel disabled.
	tab3 := BrTabModel new add: (BrLabelModel text: 'Tab 3').
	
	tabGroup := BrTabGroupModel with: { tab1 . tab2 . tab3 }.
	tabGroup when: BrTabsRequest do: [ :aTabsRequest | tabsRequest := aTabsRequest copy ].
	
	headerLook := self groupHeaderLook.
	headerLook when: BrTabsChangedEvent do: [ :aTabsChanged | tabsChanged := aTabsChanged copy ].
	
	headerElement := BlElement new
		look: headerLook;
		viewModel: tabGroup;
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

	^ BrTextLabelLook asLook
]

{ #category : #'examples - ui' }
BrTabExamples >> materialActionGroup [
	<gtExample>
	| tab1 tab2 tab3 tabGroup tabGroupElement |

	tab1 := BrTabModel new
		add: (BrLabelModel text: 'Tab 1');
		stencil: [
			BlElement new
				size: 200@200;
				background: (Color blue alpha: 0.5) ];
		actionsStencil: [ 
			| aToolbar |
			aToolbar := BrToolbar new.
			aToolbar look: BrToolbarLook new.
			aToolbar addItem: (BrButton new 
				look: BrMaterialToggleLabelledLook;
				label: 'Hello'; 
				action: [ self inform: 'Click on Hello' ]).
			aToolbar addItem: (BrButton new 
					look: BrMaterialToggleLabelledLook;
					label: 'World'; 
					action: [ self inform: 'Click on World' ]) ].

	tab2 := BrTabModel new
		add: (BrLabelModel text: 'Tab 2');
		add: BrActivationModel disabled.

	tab3 := BrTabModel new
		add: (BrLabelModel text: 'Tab 3');
		stencil: [ BlElement new
			size: 200@200;
			background: (Color red alpha: 0.5) ].

	tabGroup := BrTabGroupModel with: { tab1 . tab2. tab3 }.

	tabGroup tabs do: [ :aTab |
		BlElement new
			look: BrMaterialTabLabelledLook;
			viewModel: aTab ].

	tabGroupElement := BlElement new
		look: BrMaterialTabGroupLook;
		viewModel: tabGroup.
	
	self assert: tabGroupElement children size equals: 3. "header + splitter + content"
	self assert: tabGroupElement children first children size equals: 2. "tab bar + tool bar"
	^ tabGroupElement
]

{ #category : #'examples - ui' }
BrTabExamples >> materialGroup [
	<gtExample>
	| tab1 tab2 tab3 tabGroup |

	tab1 := BrTabModel new
		add: (BrLabelModel text: 'Tab 1');
		stencil: [ BlElement new
			size: 200@200;
			background: (Color red alpha: 0.5) ].

	tab2 := BrTabModel new
		add: (BrLabelModel text: 'Tab 2');
		add: BrActivationModel disabled.

	tab3 := BrTabModel new
		add: (BrLabelModel text: 'Tab 3');
		stencil: [ BlElement new
			size: 200@200;
			background: (Color blue alpha: 0.5) ].

	tabGroup := BrTabGroupModel with: { tab1 . tab2. tab3 }.

	tabGroup tabs do: [ :aTab |
		BlElement new
			look: BrMaterialTabLabelledLook;
			viewModel: aTab ].

	^ BlElement new
		look: BrMaterialTabGroupLook;
		viewModel: tabGroup
]

{ #category : #'examples - ui' }
BrTabExamples >> materialGroupNestedInAnotherGroup [
	<gtExample>
	| tab1 tabGroup |
	tab1 := BrTabModel new
		add: (BrLabelModel text: 'Parent Tab 1');
		stencil: [ self materialGroup ].
	tabGroup := BrTabGroupModel with: { tab1 }.
	tabGroup tabs do: [ :aTab |
		BlElement new
			look: BrMaterialTabLabelledLook;
			viewModel: aTab ].
	^ BlElement new
		look: BrMaterialTabGroupLook;
		viewModel: tabGroup
]

{ #category : #'examples - ui' }
BrTabExamples >> materialLabelledTab [
	<gtExample>
	| tabModel tabLook tabElement labelModel |
	
	tabModel := BrTabModel new add: (labelModel := BrLabelModel text: 'Tab 1').
	tabLook := BrMaterialTabLabelledLook asLook.

	tabElement := BlElement new.
	tabElement viewModel: tabModel.
	tabElement look: tabLook.

	self assert: tabElement children asArray equals: { tabLook labelLook label }.
	self assert: tabElement children first text asString equals: labelModel text asString.

	^ tabElement
]

{ #category : #'examples - tab model' }
BrTabExamples >> selectTabModel [
	<gtExample>
	| aTabModel selected selectedTab deselected selectedHander deselectedHandler |
	
	selected := deselected := 0.
	selectedTab := nil.
	
	aTabModel := self tabModel.
	aTabModel addEventHandler: (selectedHander := BlEventHandler on: BrTabSelectedEvent do: [ :anEvent |
		selected := selected + 1.
		selectedTab := anEvent tab ]).
	aTabModel addEventHandler: (deselectedHandler := BlEventHandler on: BrTabDeselectedEvent do: [	deselected := deselected + 1 ]).
	
	aTabModel select.
	
	self assert: aTabModel isSelected.
	self assert: selected equals: 1.
	self assert: deselected equals: 0.
	self assert: selectedTab equals: aTabModel.

	aTabModel removeEventHandler: selectedHander.
	aTabModel removeEventHandler: deselectedHandler.

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
	| aTabGroup aTab |
	
	aTabGroup := self tabGroupModel.
	self assert: aTabGroup isEmpty.
	self assert: aTabGroup hasSelectedTab not.
	
	aTab := self tabModel.
	self assert: aTab isSelected not.

	aTabGroup addTab: aTab.
	
	self assert: aTab isSelected.
	self assert: aTabGroup isNotEmpty.
	self assert: aTabGroup hasSelectedTab.
	self assert: aTabGroup selectedTab equals: aTab.

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
