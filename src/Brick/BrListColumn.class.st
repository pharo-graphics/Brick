"
I represent a column within a columned list. A column has associated title and a cell stencil builder.

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
	#name : #BrListColumn,
	#superclass : #Object,
	#instVars : [
		'title',
		'stencilBuilder'
	],
	#category : 'Brick-List - Model'
}

{ #category : #initialization }
BrListColumn >> initialize [
	super initialize.

	title := 'Column'.
	stencilBuilder := BrColumnedListCellStencilBuilder new
]

{ #category : #accessing }
BrListColumn >> stencil [
	<return: #BrColumnedListCellStencilBuilder>
	
	^ stencilBuilder
]

{ #category : #'api - accessing' }
BrListColumn >> stencil: aStencil [
	stencilBuilder := aStencil asStencilBuilder: BrColumnedListCellStencilBuilder
]

{ #category : #'api - accessing' }
BrListColumn >> title [
	<return: #String>

	^ title
]

{ #category : #'api - accessing' }
BrListColumn >> title: aStringOrText [
	title := aStringOrText
]
