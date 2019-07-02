Class {
	#name : #BrBreadcrumbScrollableLook,
	#superclass : #BrBreadcrumbLook,
	#instVars : [
		'pager',
		'amountOfVisibleItems',
		'resizerLook'
	],
	#category : #'Brick-Breadcrumb - Look'
}

{ #category : #initialization }
BrBreadcrumbScrollableLook >> initialize [
	super initialize.
	
	pager := BrPager new.
	pager look: BrScrollablePagerLook new.

	self addChangeAddChildAs: #(content pager) with: [ self pager ].
	
	self
		addChangeProperty: #(widgetContent layout)
		with: [ BlLinearLayout vertical ].

	self add: (resizerLook := BrLayoutResizerLook new
		inherit;
		inherit: pager;
		inheritIn: [ :aBlock | self itemElements do: [ :eachItem | aBlock value: (eachItem userData at: #breadcrumbPage) ] ];
		inheritIn: [ :aBlock | self itemElements do: [ :eachItem | aBlock value: eachItem ] ]).

	amountOfVisibleItems := 5
]

{ #category : #hooks }
BrBreadcrumbScrollableLook >> onItemAttached: anItemElement at: anIndex [
	| aPage |

	aPage := BrPagerPageElement new weight: 1.0 / amountOfVisibleItems.
	aPage addChild: anItemElement.
	pager addPage: aPage.

	anItemElement userData at: #breadcrumbPage put: aPage.

	resizerLook requestStates
]

{ #category : #hooks }
BrBreadcrumbScrollableLook >> onSeparatorChanged: aSeparatorStencil [
	
]

{ #category : #initialization }
BrBreadcrumbScrollableLook >> pager [
	^ pager
]
