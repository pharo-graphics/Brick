Class {
	#name : #BrMaterialListItemLabelAptitude,
	#superclass : #BrTextLabelAptitude,
	#category : #'Brick-Material-List'
}

{ #category : #initialization }
BrMaterialListItemLabelAptitude >> initialize [
	super initialize.
	self fontSize: 16.
	self fontName: 'Roboto'.
	self
		addChangeProperty: #(label constraints horizontal resizer)
		with: BlLayoutResizer matchParent
]
