"
BrFileSelector provides a widget for displaying the contents of a folder.

The list of files displayed, folder and a fileFilterBlock can be specified, see key messages below.

!!Public API and Key Messages

- fileFilterBlock: 	A one-parameter block that is passed in as the argument to the #select: for filtering the displayed files.  Default = display all files.
- folder: 	The initial directory to display.  Default = working directory. 

   One simple example is simply gorgeous.
 
!!Internal Representation and Key Implementation Points.

!!!Instance Variables

	breadcrumb:			<BrBreadcrumb>
	fileFilterBlock:	<BlockClosure>
	folder:				<FileReference>
	items:					<OrderedCollection>
	table:					<BrColumnedList>


!!!Implementation Points
"
Class {
	#name : #BrFileBrowser,
	#superclass : #BrVerticalPane,
	#instVars : [
		'folder',
		'items',
		'table',
		'breadcrumb',
		'fileFilterBlock'
	],
	#category : #'Brick-File - UI'
}

{ #category : #private }
BrFileBrowser >> computeFolderItems [
	"Determine the items to display in the file list.
	Directories are always displayed.
	Files are filtered by the fileFilterBlock"
	| entries |

	entries := folder directories sorted: [:a :b | a basename < b basename ].
	entries := entries, ((folder files select: fileFilterBlock) sorted: [:a :b | a basename < b basename ]).
	entries := folder isRoot
		ifTrue: [ entries ]
		ifFalse: [ entries asOrderedCollection
				addFirst: folder parent;
				yourself ].
	^ entries
]

{ #category : #private }
BrFileBrowser >> computeFolderParents [
	^ folder withParents
]

{ #category : #private }
BrFileBrowser >> createBreadcrumb [
	^ BrBreadcrumb new
		fitContent;
		look: (BrGlamorousBreadcrumbLook new separator: [
			BrLabel new
				look: (BrGlamorousLabelLook new thin foreground: Color gray);
				text: '/';
				margin: (BlInsets left: 5 right: 5) ]).
]

{ #category : #private }
BrFileBrowser >> createTable [
	| aTable |
	aTable := BrColumnedList new.
	aTable 
		padding: (BlInsets top: 5);
		matchParent.

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
		matchParent;
		cellStencil: [ :each | BrLabel new look: BrGlamorousLabelLook new ];
		dataBinder: [ :aLabel :eachItem | 
			aLabel
				text:
					((folder isChildOf: eachItem)
						ifTrue: [ '..' ]
						ifFalse: [ eachItem basename asString ]) ].
	aTable column 
		title: 'Size' translated;
		width: 100;
		cellStencil: [ :each | BrLabel new look: BrGlamorousLabelLook new ];
		dataBinder: [ :aLabel :eachItem |
			aLabel text: (eachItem isDirectory
				ifTrue: [ eachItem children size asString ]
				ifFalse: [ eachItem humanReadableSize ])].
	aTable column 
		title: 'Modified' translated;
		cellStencil: [ :each | BrLabel new look: BrGlamorousLabelLook new ];
		dataBinder: [ :aLabel :eachItem |
			aLabel text: (String
					streamContents: [ :s | 
						eachItem creationTime printYMDOn: s.
						s nextPut: Character space.
						eachItem creationTime printHMSOn: s ]) ].

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
	aTable addLook: BrColumnedListHeaderLook.

	^ aTable
]

{ #category : #accessing }
BrFileBrowser >> fileFilterBlock [
	^ fileFilterBlock
]

{ #category : #accessing }
BrFileBrowser >> fileFilterBlock: aBlockClosure [

	fileFilterBlock := aBlockClosure.
	self updateDisplay.
]

{ #category : #accessing }
BrFileBrowser >> folder [
	^ folder
]

{ #category : #accessing }
BrFileBrowser >> folder: aFileReference [

	(folder = aFileReference or: [ aFileReference isDirectory not ])
		ifTrue: [ ^ self ].

	folder := aFileReference asAbsolute canonicalize.

	self updateDisplay.
]

{ #category : #initialization }
BrFileBrowser >> initialize [
	| alignedButton |

	super initialize.

	fileFilterBlock := [ :entry | true ].
	breadcrumb := self createBreadcrumb.
	table := self createTable.
	self folder: '.' asFileReference.
	
	self matchParent.
	self padding: (BlInsets all:10).
	self addChildren: {
		BrScrollPane new
			look: BrScrollPaneLook;
			hMatchParent;
			vFitContent;
			content: breadcrumb.
		table.
	 }.

]

{ #category : #private }
BrFileBrowser >> updateDisplay [

	table items: (items := self computeFolderItems).

	breadcrumb removeAllItems.
	self computeFolderParents do: [ :eachSegment |
		breadcrumb addItem: (BrButton new
			look: BrGlamorousLinkSquaredButtonWithLabelLook new glamorousRegularFont;
			geometry: (BlRoundedRectangleGeometry cornerRadius: 4);
			label: eachSegment basename;
			action: [ self folder: eachSegment ]) ].
]
