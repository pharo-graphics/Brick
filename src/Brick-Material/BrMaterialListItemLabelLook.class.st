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
	changes
		add:
			(#(label constraints horizontal resizer)
				asBrLookPropertyChangeWithValue: BlLayoutResizer matchParent)
]
