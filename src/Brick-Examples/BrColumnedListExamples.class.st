Class {
	#name : #BrColumnedListExamples,
	#superclass : #Object,
	#category : #'Brick-Examples-List'
}

{ #category : #'examples - model' }
BrColumnedListExamples >> addColorIndexColumn [
	<gtExample>
	<noTest>
	| aColumnedListModel |

	aColumnedListModel := self columnedListModel.
	aColumnedListModel column
		title: 'Index';
		stencil: [ :aRowValue :aRowIndex | BrColumnCellLabelStencil new text: aRowIndex asString ].

	self assert: aColumnedListModel columns size equals: 1.
	self assert: aColumnedListModel columns first title equals: 'Index'.

	^ aColumnedListModel
]

{ #category : #'examples - model' }
BrColumnedListExamples >> addColorNameColumn [
	<gtExample>
	<noTest>
	| aColumnedListModel |
	
	aColumnedListModel := self addColorIndexColumn.
	aColumnedListModel column
		title: 'Color';
		stencil: [ :aRowValue :aRowIndex | BrColumnCellLabelStencil new text: aRowValue name asString ].

	self assert: aColumnedListModel columns size equals: 2.
	self assert: aColumnedListModel columns second title equals: 'Color'.
		
	^ aColumnedListModel
]

{ #category : #'examples - model' }
BrColumnedListExamples >> addColorValueColumn [
	<gtExample>
	<noTest>
	| aColumnedListModel |
	
	aColumnedListModel := self addColorNameColumn.
	aColumnedListModel column
		title: 'Hex';
		stencil: [ :aRowValue |
			| aHexString |
			
			aHexString := aRowValue asHexString.
			
			BlElement new
				padding: (BlInsets all: 6);
				margin: (BlInsets top: 3 left: 0 bottom: 3 right: 0);
				background: (Color fromHexString: aHexString);
				look: (BrTextLabelLook new text: '#',aHexString; thin; foreground: ((Color fromHexString: aHexString) contrastingColor)) + (BrLayoutLook frame hMatchParent; vFitContent) + (BrLayoutLook of: #label) alignCenter ].
		
	self assert: aColumnedListModel columns size equals: 3.
	self assert: aColumnedListModel columns third title equals: 'Hex'.
		
	^ aColumnedListModel
]

{ #category : #'examples - instance creation' }
BrColumnedListExamples >> columnedListElement [
	<gtExample>
	
	^ BlElement new
		constraintsDo: [ :c |
			c horizontal exact: 400.
			c vertical matchParent ]
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
	
	self assert: aColumnedListModel children first columns isEmpty.
	
	^ aColumnedListModel
]

{ #category : #'examples - model' }
BrColumnedListExamples >> columnedListModelWithColorAsItems [
	<gtExample>
	<noTest>
	| aColumnedListModel |
	
	aColumnedListModel := self addColorValueColumn.
	aColumnedListModel items: (Color registeredColorNames collect: [ :aColorName | Color named: aColorName ]).

	^ aColumnedListModel
]

{ #category : #'examples - look' }
BrColumnedListExamples >> columnedListWithLook [
	<gtExample>
	| aColumnedListElement aColumnedListLook |
	
	aColumnedListElement := self columnedListElement.
	aColumnedListLook := self columnedListLook.
	
	aColumnedListElement look: aColumnedListLook.
	
	^ aColumnedListElement
]

{ #category : #'examples - look' }
BrColumnedListExamples >> columnedListWithLookAndModelForColors [
	<gtExample>
	<noTest>
	| aColumnedListElement aColumnedListModel |

	aColumnedListElement := self columnedListWithLook.
	aColumnedListModel := self columnedListModelWithColorAsItems.
	
	aColumnedListElement viewModel: aColumnedListModel.
	
	^ aColumnedListElement
]

{ #category : #'examples - scripting' }
BrColumnedListExamples >> compositeAllClassesAndPackage [
	<gtExample>
	| aList |

	aList := BrColumnedList new.
	aList display: Smalltalk allClasses.
	aList column
		title: 'Class';
		stencil: [ :aClass | BrColumnCellLabelStencil new text: aClass name asString ].
		
	aList column
		title: 'Package';
		stencil: [ :aClass | BrColumnCellLabelStencil new text: aClass package name asString ].

	^ aList
]

{ #category : #'examples - scripting' }
BrColumnedListExamples >> compositeAllClassesAndPackageWithIndex [
	<gtExample>
	| aList |

	aList := BrColumnedList new.
	aList display: Smalltalk allClasses.
	aList column
		title: 'Index';
		stencil: [ :aClass :anIndex |
			BlTextElement new
				width: 30;
				margin: (BlInsets all: 3);
				text: (anIndex asString asRopedText foreground: Color gray) ].

	aList column
		title: 'Class';
		stencil: [ :aClass | (BrColumnCellLabelStencil new text: aClass name asString) asElement width: 200 ].

	aList column
		title: 'Package';
		stencil: [ :aClass | BrColumnCellLabelStencil new text: aClass package name asString ].

	^ aList
]

{ #category : #'examples - scripting' }
BrColumnedListExamples >> compositeAllClassesAndPackageWithIndexUsingBuilders [
	<gtExample>
	| aList |

	aList := BrColumnedList new.
	aList display: Smalltalk allClasses.
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
		stencil: [ :aClass | BrColumnCellLabelStencil new text: aClass package name asString ].

	^ aList
]

{ #category : #'examples - scripting' }
BrColumnedListExamples >> compositeAllClassesSingleColumn [
	<gtExample>
	| aList |
	
	aList := BrColumnedList new.
	aList display: Smalltalk allClasses.
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
