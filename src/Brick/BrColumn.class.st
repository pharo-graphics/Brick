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
	#instVars : [
		'title',
		'stencilBuilder',
		'width'
	],
	#category : #'Brick-Column - Model'
}

{ #category : #initialization }
BrColumn >> initialize [
	super initialize.

	title := 'Column'.
	stencilBuilder := BrColumnCellStencilBuilder new.
	width := BrColumnUndefinedWidth new
]

{ #category : #accessing }
BrColumn >> stencil [
	<return: #BrColumnCellStencilBuilder>
	
	^ stencilBuilder
]

{ #category : #accessing }
BrColumn >> stencil: aStencil [
	stencilBuilder := aStencil asStencilBuilder: BrColumnCellStencilBuilder
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
