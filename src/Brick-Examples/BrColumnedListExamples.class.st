Class {
	#name : #BrColumnedListExamples,
	#superclass : #Object,
	#category : #'Brick-Examples-List'
}

{ #category : #'examples - model' }
BrColumnedListExamples >> addColorIndexColumn [
	<gtExample>
	| aListModel aColumnModel |

	aListModel := self columnedListModel.
	aColumnModel := aListModel children first.

	aColumnModel column
		title: 'Index';
		stencil: [ :aRowValue :aRowIndex | BrColumnCellLabelStencil new text: aRowIndex asString ].

	self assert: aColumnModel columns size equals: 1.
	self assert: aColumnModel columns first title equals: 'Index'.

	^ aListModel
]

{ #category : #'examples - model' }
BrColumnedListExamples >> addColorNameColumn [
	<gtExample>
	| aListModel aColumnModel |
	
	aListModel := self addColorIndexColumn.
	aColumnModel := aListModel children first.

	aColumnModel column
		title: 'Color';
		stencil: [ :aRowValue :aRowIndex | BrColumnCellLabelStencil new text: aRowValue name asString ].

	self assert: aColumnModel columns size equals: 2.
	self assert: aColumnModel columns second title equals: 'Color'.
		
	^ aListModel
]

{ #category : #'examples - model' }
BrColumnedListExamples >> addColorValueColumn [
	<gtExample>
	| aListModel aColumnModel |
	
	aListModel := self addColorNameColumn.
	aColumnModel := aListModel children first.
	
	aColumnModel column
		title: 'Hex';
		stencil: [ :aRowValue |
			| aHexString |
			
			aHexString := aRowValue asHexString.
			
			BlElement new
				padding: (BlInsets all: 6);
				margin: (BlInsets top: 3 left: 0 bottom: 3 right: 0);
				background: (Color fromHexString: aHexString);
				layout: BlLinearLayout horizontal alignCenter;
				constraintsDo: [ :c |
					c horizontal matchParent.
					c vertical fitContent ];
				look: (BrTextLabelLook new text: '#',aHexString; thin; foreground: ((Color fromHexString: aHexString) contrastingBlackAndWhiteColor))  ].
		
	self assert: aColumnModel columns size equals: 3.
	self assert: aColumnModel columns third title equals: 'Hex'.
		
	^ aListModel
]

{ #category : #'examples - instance creation' }
BrColumnedListExamples >> columnedListElement [
	<gtExample>
	
	^ BlElement new
]

{ #category : #'examples - instance creation' }
BrColumnedListExamples >> columnedListLook [
	<gtExample>
	
	^ BrColumnedListLook new
]

{ #category : #'examples - instance creation' }
BrColumnedListExamples >> columnedListModel [
	<gtExample>
	| aColumnedListModel |
	
	aColumnedListModel := BrListModel new.
	aColumnedListModel add: BrColumnedModel new.
	aColumnedListModel add: (BrInteractiveModel withAll: {
		BrLayoutHorizontalResizerModel exact: 400.0.
		BrLayoutVerticalResizerModel matchParent
	}).
	
	self assert: aColumnedListModel children first columns isEmpty.
	
	^ aColumnedListModel
]

{ #category : #'examples - model' }
BrColumnedListExamples >> columnedListModelWithColorAsItems [
	<gtExample>
	| aColumnedListModel |
	
	aColumnedListModel := self addColorValueColumn.
	aColumnedListModel items: (Color registeredColorNames collect: [ :aColorName | Color named: aColorName ]).

	^ aColumnedListModel
]

{ #category : #'examples - list' }
BrColumnedListExamples >> columnedListWithLookAndModelForColors [
	<gtExample>
	| aColumnedListElement aColumnedListModel aColumnedListLook |

	aColumnedListElement := self columnedListElement.
	aColumnedListModel := self columnedListModelWithColorAsItems.
	aColumnedListLook := self columnedListLook.

	aColumnedListElement viewModel: aColumnedListModel.
	aColumnedListElement look: aColumnedListLook.

	^ aColumnedListElement
]

{ #category : #'examples - scripting' }
BrColumnedListExamples >> compositeAllClassesAndPackage [
	<gtExample>
	| aList |
	aList := BrColumnedList new.
	aList items: Smalltalk allClasses.
	aList column
		title: 'Class';
		stencil: [ :aClass | BrColumnCellLabelStencil new text: aClass name asString ].
	aList column
		title: 'Package';
		stencil:
				[ :aClass | BrColumnCellLabelStencil new text: aClass package name asString ].
	^ aList
]

{ #category : #'examples - scripting' }
BrColumnedListExamples >> compositeAllClassesAndPackageWithIndex [
	<gtExample>
	| aList |
	aList := BrColumnedList new.
	aList items: Smalltalk allClasses.
	aList column
		title: 'Index';
		stencil: [ :aClass :anIndex | 
			BlTextElement new
				width: 30;
				margin: (BlInsets all: 3);
				text: (anIndex asString asRopedText foreground: Color gray) ].
	aList column
		title: 'Class';
		stencil: [ :aClass | 
			(BrColumnCellLabelStencil new text: aClass name asString) asElement
				width: 200 ].
	aList column
		title: 'Package';
		stencil:
				[ :aClass | BrColumnCellLabelStencil new text: aClass package name asString ].
	^ aList
]

{ #category : #'examples - scripting' }
BrColumnedListExamples >> compositeAllClassesAndPackageWithIndexUsingBuilders [
	<gtExample>
	| aList |
	aList := BrColumnedList new.
	aList items: Smalltalk allClasses.
	aList column
		title: 'Index';
		stencil: [ :aClass :anIndex | 
			BlTextElement new
				width: 30;
				margin: (BlInsets all: 3);
				text: (anIndex asString asRopedText foreground: Color gray) ].
	aList column
		title: 'Class';
		stencil: BrColumnNameCellStencilBuilder new.
	aList column
		title: 'Package';
		stencil:
				[ :aClass | BrColumnCellLabelStencil new text: aClass package name asString ].
	^ aList
]

{ #category : #'examples - scripting' }
BrColumnedListExamples >> compositeAllClassesSingleColumn [
	<gtExample>
	| aList |
	aList := BrColumnedList new.
	aList items: Smalltalk allClasses.
	aList column title: 'Class'.
	^ aList
]

{ #category : #'examples - stencil' }
BrColumnedListExamples >> createColumnedListRowDefault [
	<gtExample>
	| aStencilBuilder aRowElement |
	
	aStencilBuilder := BrColumnedListRowStencilBuilder new.
	aStencilBuilder rowValue: 'Hello'.
	aStencilBuilder rowIndex: 1.
	
	aRowElement := aStencilBuilder build asElement.

	self assert: (aRowElement layout isKindOf: BlLinearLayout).
	self assert: (aRowElement layout isHorizontal).
	self assert: (aRowElement hasChildren not).
	
	^ aRowElement
]

{ #category : #'examples - stencil' }
BrColumnedListExamples >> createColumnedListRowWithBlock [
	<gtExample>
	| aStencilBuilder aRowElement |
	
	aStencilBuilder := [ :aRowValue :aRowIndex | BlTextElement text: (aRowValue asString, '-', aRowIndex asString) asRopedText ] asStencil: BrListRowStencilBuilder.
	aStencilBuilder rowValue: 'Hello'.
	aStencilBuilder rowIndex: 1.
	
	aRowElement := aStencilBuilder build asElement.

	self assert: (aRowElement isKindOf: BlTextElement).
	self assert: aRowElement text asString equals: 'Hello-1'.
	
	^ aRowElement
]

{ #category : #'examples - column' }
BrColumnedListExamples >> listColumn [
	<gtExample>
	| aListColumn |
	
	aListColumn := BrColumn new.
	
	self assert: aListColumn title equals: 'Column'.

	^ aListColumn
]

{ #category : #'examples - column' }
BrColumnedListExamples >> listColumnWithTitle [
	<gtExample>
	| aListColumn |
	
	aListColumn := self listColumn.
	aListColumn title: 'Custom property'.
	
	self assert: aListColumn title equals: 'Custom property'.
	
	^ aListColumn
]
