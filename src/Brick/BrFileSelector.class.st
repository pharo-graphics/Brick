"
BrFileSelector provides a widget for executing a custom action on the selected file.

The list of files displayed, button label and selection action can all be specified, see key messages below.

While the default label of the accept button is 'OK', this should be changed to indicate the actual action that will be taken, e.g. 'Load file'.

!!Public API and Key Messages

- fileFilterBlock: 	A one-parameter block that is passed in as the argument to the #select: for filtering the displayed files.  Default = display all files.
- folder: 	The initial directory to display.  Default = working directory. 
- buttonLabel: 	The label to display on the load / select button.  Default = 'OK'.
- loadAction: 	A one-parameter block that is called with the selected file reference when the button is pressed.

   One simple example is simply gorgeous.
 
!!Internal Representation and Key Implementation Points.

!!!Instance Variables

	breadcrumb:			<BrBreadcrumb>
	fileFilterBlock:	<BlockClosure>
	folder:				<FileReference>
	items:					<OrderedCollection>
	okAction:				<BlockClosure>
	okButton:				<BrButton>
	table:					<BrColumnedList>


!!!Implementation Points
"
Class {
	#name : #BrFileSelector,
	#superclass : #BrVerticalPane,
	#instVars : [
		'folder',
		'items',
		'table',
		'breadcrumb',
		'fileFilterBlock',
		'okButton',
		'okAction'
	],
	#category : #'Brick-File - UI'
}

{ #category : #initialization }
BrFileSelector >> buildUI [
	| alignedButton |
	breadcrumb := self createBreadcrumb.
	table := self createTable.
	alignedButton := self createOkButton.
	self matchParent.
	self addChildren: {
		BrScrollPane new
			look: BrScrollPaneLook;
			hMatchParent;
			vFitContent;
			content: breadcrumb.
		table.
		alignedButton. }.
]

{ #category : #accessing }
BrFileSelector >> buttonLabel: aString [
	"Set the button's label"

	okButton label: aString
]

{ #category : #accessing }
BrFileSelector >> clearSelection [
	table deselectAll
]

{ #category : #private }
BrFileSelector >> computeFolderItems [
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
BrFileSelector >> computeFolderParents [
	^ folder withParents
]

{ #category : #private }
BrFileSelector >> createAddFolderButton [
	|plusButton|
	plusButton := BrButton new.
	plusButton look: BrGlamorousButtonIconLook + BrGlamorousButtonRectangularLook.
	plusButton icon: BrGlamorousIcons add.
	plusButton action: [self replaceAddFolderWithEditor].
	^ plusButton
	
	
]

{ #category : #initialization }
BrFileSelector >> createBasicFileBrowser [
]

{ #category : #private }
BrFileSelector >> createBreadcrumb [
	^ BrBreadcrumb new
		fitContent;
		look: (BrGlamorousBreadcrumbLook new separator: [
			BrLabel new
				look: (BrGlamorousLabelLook new thin foreground: Color gray);
				text: '/';
				margin: (BlInsets left: 5 right: 5) ]).
]

{ #category : #private }
BrFileSelector >> createOkButton [
	| alignedButton |
	okButton := BrButton new 
			look: BrGlamorousButtonWithLabelLook new;
			label: 'OK';
			action: [ self executeAction ];
			disable;
			yourself.
	alignedButton := BlElement new 
		layout: BlLinearLayout horizontal alignTopRight;
		padding: (BlInsets top: 15);
		constraintsDo: [ :c |
			c horizontal matchParent.
			c vertical exact: 40 ];
		addChild: okButton.
	^ alignedButton
]

{ #category : #private }
BrFileSelector >> createTable [
	| aTable |
	aTable := BrColumnedList new.
	aTable 
		rowStencil: (BrGlamorousColumnedListSelectableRowElementStencilBuilder new);
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
		"width: 200;"
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
				ifTrue: [ '-' ]
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
	aTable
		when: BrSelectionChanged 
		do: [ :anEvent | okButton enable ].
	aTable addLook: BrColumnedListHeaderLook.

	^ aTable
]

{ #category : #private }
BrFileSelector >> executeAction [ 
	"Execute the receiver's load action"
	| selectedIndices |

	selectedIndices := table selectedIndices.
	selectedIndices ifEmpty: [ 
		^ self okAction 
				cull: folder
				cull: okButton ].
	^ self okAction 
				cull: (items at: selectedIndices first)
				cull: okButton.
]

{ #category : #accessing }
BrFileSelector >> fileFilterBlock [
	^ fileFilterBlock
]

{ #category : #accessing }
BrFileSelector >> fileFilterBlock: aBlockClosure [

	fileFilterBlock := aBlockClosure.
	self updateDisplay.
]

{ #category : #accessing }
BrFileSelector >> folder [
	^ folder
]

{ #category : #accessing }
BrFileSelector >> folder: aFileReference [

	(folder = aFileReference or: [ aFileReference isDirectory not ])
		ifTrue: [ ^ self ].

	folder := aFileReference asAbsolute canonicalize.
	self clearSelection.
	self updateDisplay.
]

{ #category : #initialization }
BrFileSelector >> initialize [
	| alignedButton |

	super initialize.
	fileFilterBlock := [ :entry | true ].
	okAction := [ :anElement | ].
	self buildUI. 
	self matchParent.
	self folder: '.' asFileReference.
]

{ #category : #accessing }
BrFileSelector >> okAction [
	^ okAction
]

{ #category : #accessing }
BrFileSelector >> okAction: anObject [
	okAction := anObject
]

{ #category : #private }
BrFileSelector >> replaceAddFolderWithEditor [
	|folderCreator|
	breadcrumb removeItemAt:  breadcrumb numberOfItems.
	folderCreator := BrFolderCreateWidget new folder: self folder.
	folderCreator defaultFolderName: ''.
	folderCreator onFolderCreated: [self updateDisplay].
	breadcrumb addItem: folderCreator.
	folderCreator requestLabelFocus.
]

{ #category : #private }
BrFileSelector >> updateDisplay [

	table items: (items := self computeFolderItems).

	breadcrumb removeAllItems.
	self computeFolderParents do: [ :eachSegment |
		breadcrumb addItem: (BrButton new
			look: BrGlamorousLinkSquaredButtonWithLabelLook new glamorousRegularFont;
			geometry: (BlRoundedRectangleGeometry cornerRadius: 4);
			label: eachSegment basename;
			action: [ self folder: eachSegment ]) ].
	breadcrumb addItem: self createAddFolderButton.
]
