Class {
	#name : #BrGlamorousTabLook,
	#superclass : #BrTabLook,
	#instVars : [
		'bar'
	],
	#category : #'Brick-Glamorous-Tabs'
}

{ #category : #initialization }
BrGlamorousTabLook >> initialize [
	super initialize.
	self add: BrGlamorousTabLabelLook new.
	bar := BlElement new.
	bar visibility: BlVisibility hidden.
	bar background: BrGlamorousColors primaryBorderColor.
	bar
		constraintsDo: [ :c | 
			c ignoreByLayout.
			c ignored vertical alignBottom.
			c vertical exact: 2.
			c horizontal matchParent ].
	changes
		add:
			(#(widgetContent layout)
				asBrLookPropertyChangeWithValue: [ BlLinearLayout horizontal alignCenter ]).
	changes
		add:
			(#(widgetContent padding)
				asBrLookPropertyChangeWithValue: [ BlInsets
						top: 10
						left: 12
						bottom: 10
						right: 12 ]).
	changes
		add: (#(content bar) asBrLookChildAddAsChangeWithValue: [ bar ])
]

{ #category : #initialization }
BrGlamorousTabLook >> initializeLook [
	super initializeLook.
	self widgetContent
		constraintsDo: [ :c | 
			c vertical matchParent.
			c horizontal fitContent ]
]

{ #category : #'event handling' }
BrGlamorousTabLook >> invisibleBar [
	bar background: Color transparent
]

{ #category : #'event handling' }
BrGlamorousTabLook >> tabDeselected [
	super tabDeselected.
	
	bar visibility: BlVisibility hidden
]

{ #category : #'event handling' }
BrGlamorousTabLook >> tabSelected [
	super tabSelected.
	
	bar visibility: BlVisibility visible
]
