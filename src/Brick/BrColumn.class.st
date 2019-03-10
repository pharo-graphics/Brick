"
I represent a column within a columned model. A column has associated title and a cell stencil builder.

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
		'stencilBuilder'
	],
	#category : #'Brick-! Core - Support'
}

{ #category : #accessing }
BrColumn >> initialize [
	super initialize.

	title := 'Column'.
	stencilBuilder := BrColumnedListCellStencilBuilder new
]

{ #category : #accessing }
BrColumn >> stencil [
	<return: #BrColumnedListCellStencilBuilder>
	
	^ stencilBuilder
]

{ #category : #accessing }
BrColumn >> stencil: aStencil [
	stencilBuilder := aStencil asStencilBuilder: BrColumnedListCellStencilBuilder
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
