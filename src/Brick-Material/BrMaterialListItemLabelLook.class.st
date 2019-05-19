Class {
	#name : #BrMaterialListItemLabelLook,
	#superclass : #BrTextLabelLook,
	#category : #'Brick-Material-List'
}

{ #category : #initialization }
BrMaterialListItemLabelLook >> initialize [
	super initialize.
	self fontSize: 16.
	self fontName: 'Roboto'.
	self
		addChangeProperty: #(label constraints horizontal resizer)
		with: BlLayoutResizer matchParent
]
