"
I represent a column within a columned tree. A column has associated title and a cell stencil builder.

Cell stencil builder builds a stencil or an element for each cell within a columned tree taking row value, row index and current column index into account.

[[[
| aColumn |

aColumn := BrListColumn new.
aColumn title: 'Column'.
aColumn stencil: [ :aRowValue :aRowIndex :aColumnIndex | BrListLabelStencil new text: aRowValue asString ].
aColumn	
]]]
"
Class {
	#name : #BrTreeColumn,
	#superclass : #Object,
	#category : #'Brick-Tree - Model'
}
