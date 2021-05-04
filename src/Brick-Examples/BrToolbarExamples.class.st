Class {
	#name : #BrToolbarExamples,
	#superclass : #Object,
	#category : #'Brick-Examples-Toolbar'
}

{ #category : #accessing }
BrToolbarExamples >> addItemsOnButtonClick [
	<gtExample>
	<label: 'Add toolbar items on a button click'>
	| aToolbar |
	
	aToolbar := BrToolbar new.
	aToolbar look: BrMaterialToolbarAptitude.

	aToolbar addItem: (BrButton new 
			look: BrMaterialToggleLabelledAptitude;
			label: 'Add';
			action: [ | aSize |
				aSize := aToolbar numberOfItems.
				aToolbar addItem: (BrButton new 
					look: BrMaterialToggleLabelledAptitude;
					label: aToolbar numberOfItems asString; 
					action: [ :aWidget | self inform: 'Click on button ', aWidget label asString ]).
				self assert: aToolbar numberOfItems equals: aSize + 1 ]).
	self assert: aToolbar numberOfItems equals: 1.
	^ aToolbar
]

{ #category : #accessing }
BrToolbarExamples >> addItemsOnButtonClickVertically [
	<gtExample>
	<label: 'Add toolbar items on a button click'>
	| aToolbar |
	
	aToolbar := BrToolbar new.
	aToolbar look: BrMaterialToolbarAptitude.

	aToolbar addItem: (BrButton new
			look: BrMaterialToggleLabelledAptitude;
			label: 'Add';
			action: [ | aSize |
				aSize := aToolbar numberOfItems.
				aToolbar addItem: (BrButton new 
					look: BrMaterialToggleLabelledAptitude;
					label: aToolbar numberOfItems asString; 
					action: [ :aWidget | self inform: 'Click on button ', aWidget label asString ]).
				self assert: aToolbar numberOfItems equals: aSize + 1 ]).
	self assert: aToolbar numberOfItems equals: 1.
	^ aToolbar
]

{ #category : #accessing }
BrToolbarExamples >> removeItemsOnButtonClick [
	<gtExample>
	<label: 'Add toolbar items on a button click'>
	| aToolbar |
	aToolbar := self addItemsOnButtonClick.
	
	aToolbar addItem: (BrButton new 
		look: BrMaterialToggleLabelledAptitude;
		label: 'Remove'; 
		action: [ | aSize anIndex |
			aSize := aToolbar numberOfItems.
			anIndex := ((aSize - 3) max: 0) atRandom + 3.
			anIndex <= aSize ifTrue: [ 
				aToolbar removeItemAt: anIndex.
				self assert: aToolbar numberOfItems equals: aSize - 1 ] ]).
	self assert: aToolbar numberOfItems equals: 2.
	^ aToolbar
]

{ #category : #accessing }
BrToolbarExamples >> removeItemsOnButtonClickVertically [
	<gtExample>
	<label: 'Add toolbar items on a button click'>
	| aToolbar |
	aToolbar := self addItemsOnButtonClickVertically.
	aToolbar addItem: (BrButton new 
		look: BrMaterialToggleLabelledAptitude;
		label: 'Remove'; 
		action: [ | aSize anIndex |
			aSize := aToolbar numberOfItems.
			anIndex := ((aSize - 3) max: 0) atRandom + 3.
			anIndex <= aSize ifTrue: [ 
				aToolbar removeItemAt: anIndex.
				self assert: aToolbar numberOfItems equals: aSize - 1 ] ]).
	self assert: aToolbar numberOfItems equals: 2.
	^ aToolbar
]

{ #category : #accessing }
BrToolbarExamples >> toolbar [
	<gtExample>
	| aToolbar |
	aToolbar := BrToolbar new.
	aToolbar look: BrMaterialToolbarAptitude.
	aToolbar addItem: self toolbarItemHello.
	aToolbar addItem: self toolbarItemGToolkit.
	self assert: aToolbar numberOfItems equals: 2.
	^ aToolbar
]

{ #category : #accessing }
BrToolbarExamples >> toolbarInAContainer [
	<gtExample>
	| aContainer |
	aContainer := BlElement new.
	aContainer layout: BlLinearLayout horizontal.
	aContainer constraintsDo: [ :c | 
		c horizontal matchParent.
		c vertical fitContent ].
	aContainer addChild: self removeItemsOnButtonClickVertically as: #toolbar.
	^ aContainer
]

{ #category : #accessing }
BrToolbarExamples >> toolbarItemGToolkit [
	<gtExample>
	^ BrButton new 
		look: BrMaterialToggleLabelledAptitude;
		label: 'GToolkit'; 
		action: [ self inform: 'Click on GToolkit' ]
]

{ #category : #accessing }
BrToolbarExamples >> toolbarItemHello [
	<gtExample>
	^ BrButton new 
		look: BrMaterialToggleLabelledAptitude;
		label: 'Hello'; 
		action: [ self inform: 'Click on Hello' ]
]

{ #category : #accessing }
BrToolbarExamples >> verticalToolbar [
	<gtExample>
	| aToolbar |
	aToolbar := BrToolbar new.
	aToolbar look: BrMaterialToolbarAptitude.
	aToolbar addItem: self toolbarItemHello.
	aToolbar addItem: self toolbarItemGToolkit.
	self assert: aToolbar numberOfItems equals: 2.
	^ aToolbar
]
