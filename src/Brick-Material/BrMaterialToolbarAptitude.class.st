Class {
	#name : #BrMaterialToolbarAptitude,
	#superclass : #BrToolbarAptitude,
	#category : #'Brick-Material-Toolbar'
}

{ #category : #initialization }
BrMaterialToolbarAptitude >> initialize [
	super initialize.
	
	self
		addChangeProperty: #(widget layout)
			with: [ BlGridLayout horizontal cellSpacing: 7 ];
		addChangeProperty: #(widget constraints vertical resizer)
			with: [ BlLayoutResizer fitContent ];
		addChangeProperty: #(widget constraints horizontal resizer)
			with: [ BlLayoutResizer fitContent ]
]
