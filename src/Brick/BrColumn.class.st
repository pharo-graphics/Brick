"
I represent a column within a columned model. A column has associated title, width resizer and a cell stencil builder.

Cell stencil builder builds a stencil or an element for each cell within a columned list taking row value, row index and current column index into account.

[[[
| aColumn |

aColumn := BrListColumn new.
aColumn title: 'Column'.
aColumn stencil: [ :aRowValue :aRowIndex :aColumnIndex | BrListLabelStencil new text: aRowValue asString ].
aColumn

]]]
"
Class {
	#name : #BrColumn,
	#superclass : #Object,
	#traits : 'TBlDebug',
	#classTraits : 'TBlDebug classTrait',
	#instVars : [
		'title',
		'width',
		'cellStencil',
		'dataBinder'
	],
	#category : #'Brick-Column - Model'
}

{ #category : #accessing }
BrColumn >> cellStencil [
	<return: #BrColumnCellStencilBuilder>

	^ cellStencil
]

{ #category : #accessing }
BrColumn >> cellStencil: aStencil [
	"A cell element stencil can be a #value-able of the form [ :anItemType :aBrColumn :anItemIndex | ]"
	
	cellStencil := aStencil asStencilBuilder: BrColumnCellStencilBuilder
]

{ #category : #accessing }
BrColumn >> cellWidth: aBrColumnWidth [
	self 
		assert: [ aBrColumnWidth isNotNil ]
		description: [ 'Cell width must be non-nil' ].
	width := aBrColumnWidth
]

{ #category : #accessing }
BrColumn >> dataBinder [
	^ dataBinder
]

{ #category : #accessing }
BrColumn >> dataBinder: aStencil [
	"A cell data binder stencil can be a #value-able of the form 
	[ :anItemElement :anItemObject :anItemIndex :aRowHolder :aColumnIndex | ]"
	
	dataBinder := aStencil asStencilBuilder: BrColumnCellDataBinder
]

{ #category : #initialization }
BrColumn >> initialize [
	super initialize.

	title := 'Column'.
	
	cellStencil := BrColumnCellStencilBuilder new.
	dataBinder := BrColumnCellDataBinder new.
	
	width := BrColumnUndefinedWidth new
]

{ #category : #accessing }
BrColumn >> stencil: aStencil [
	"aStencil is a BlockClosure of type [ :aRowObject :aRowIndex :aCellIndex ]"

	self cellStencil: [
		| aCellWrapper |
		aCellWrapper := BlElement new
			layout: BlFrameLayout new;
			constraintsDo: [ :c |
				c vertical fitContent.
				c horizontal matchParent ].
		aCellWrapper ].
	self dataBinder: [ :_ :aRowObject :aRowIndex :aRowHolder :aColumnIndex |
		(aRowHolder columnElements at: aColumnIndex)
			removeChildren
			addChild: (aStencil cull: aRowObject cull: aRowIndex cull: aColumnIndex) asElement ]
]

{ #category : #accessing }
BrColumn >> title [
	<return: #String>

	^ title
]

{ #category : #accessing }
BrColumn >> title: aStringOrText [
	title := aStringOrText
]

{ #category : #accessing }
BrColumn >> weight: aNumber [
	"Make a column match parent with a given proportion as a number (usually between 0 and 1)"

	width := BrColumnProportionalWidth new weight: aNumber
]

{ #category : #accessing }
BrColumn >> width [
	<return: #BrColumnWidth>

	^ width
]

{ #category : #accessing }
BrColumn >> width: aNumber [
	"Make column occupy a fixed space defined by aNumber"

	width := BrColumnFixedWidth new width: aNumber
]
