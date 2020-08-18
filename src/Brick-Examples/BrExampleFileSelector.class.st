Class {
	#name : #BrExampleFileSelector,
	#superclass : #BrVerticalPane,
	#instVars : [
		'folder',
		'table',
		'breadcrumb'
	],
	#category : #'Brick-Examples-File selector'
}

{ #category : #private }
BrExampleFileSelector >> computeFolderItems [
	| children |
	children := (folder directories sorted: [:a :b | a basename < b basename ]) , (folder files sorted: [:a :b | a basename < b basename ]).
	children := folder isRoot
		ifTrue: [ children ]
		ifFalse: [ children asOrderedCollection
				addFirst: folder parent;
				yourself ].
	^ children
]

{ #category : #private }
BrExampleFileSelector >> computeFolderParents [
	^ folder withParents
]

{ #category : #initialization }
BrExampleFileSelector >> createBreadcrumb [
	^ BrBreadcrumb new
		fitContent;
		look: (BrGlamorousBreadcrumbLook new separator: [
			BrLabel new
				look: (BrGlamorousLabelLook new thin foreground: Color gray);
				text: '>';
				margin: (BlInsets left: 5 right: 5) ]).
]

{ #category : #initialization }
BrExampleFileSelector >> createTable [
	| aTable |
	aTable := BrColumnedList new.
	aTable matchParent.

	"icon column"
	aTable column
		title: 'Icon' translated;
		width: 40;
		stencil: [ :each | 
			each isDirectory
				ifTrue: [ BrGlamorousIcons folder ]
				ifFalse: [ BrGlamorousIcons file ] ].
	aTable column
		title: 'Name' translated;
		cellStencil: [ :each | BrLabel new look: BrGlamorousLabelLook new ];
		dataBinder: [ :aLabel :eachItem | 
			aLabel
				text:
					((folder isChildOf: eachItem)
						ifTrue: [ '..' ]
						ifFalse: [ eachItem basename asString ]) ].
	aTable
		when: BrSelectionDoubleClicked
		do: [ :anEvent | 
			anEvent selection
				ifNotEmpty: [ :theIndices | 
					| aWidgetElement selectedObject |
					aWidgetElement := anEvent currentTarget.
					selectedObject := aWidgetElement viewModel
						itemAt: theIndices first.
					self folder: selectedObject ] ].
			
	^ aTable
]

{ #category : #accessing }
BrExampleFileSelector >> folder [
	^ folder
]

{ #category : #accessing }
BrExampleFileSelector >> folder: aFileReference [
	folder = aFileReference
		ifTrue: [ ^ self ].

	aFileReference isDirectory
		ifFalse: [ ^ self ].

	folder := aFileReference asAbsolute canonicalize.

	table items: self computeFolderItems.

	breadcrumb removeAllItems.
	self computeFolderParents do: [ :eachSegment |
		breadcrumb addItem: (BrButton new
			look: BrGlamorousButtonWithLabelLook;
			label: eachSegment basename;
			action: [ self folder: eachSegment ]) ].
]

{ #category : #initialization }
BrExampleFileSelector >> initialize [
	super initialize.
	
	breadcrumb := self createBreadcrumb.
	table := self createTable.
	
	self folder: '.' asFileReference.
	
	self matchParent.
	self addChildren: {
		BrScrollPane new
			look: BrScrollPaneLook;
			hMatchParent;
			vFitContent;
			content: breadcrumb.
		table }.

	self addLook: (BrLayoutResizerLook new
		vAnyToFitContent: breadcrumb;
		vMatchParentToMatchParent: table;
		vFitContentToFitContent: table)
]
