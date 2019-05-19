"
I define the rectangular exterior of the link button.
"
Class {
	#name : #BrGlamorousLinkButtonExteriorLook,
	#superclass : #BrInteractiveCommonLook,
	#instVars : [
		'backgroundPaint'
	],
	#category : #'Brick-Glamorous-Buttons - Support'
}

{ #category : #accessing }
BrGlamorousLinkButtonExteriorLook >> backgroundPaint [
	^ backgroundPaint
]

{ #category : #accessing }
BrGlamorousLinkButtonExteriorLook >> backgroundPaint: anObject [
	backgroundPaint := anObject
]

{ #category : #initialization }
BrGlamorousLinkButtonExteriorLook >> initialize [
	super initialize.
	backgroundPaint := BrGlamorousColors disabledButtonBackgroundColor.
	self
		style: [ :aStyler | 
			aStyler
				default: [ :aWidget | aWidget background: self backgroundPaint ].
			aStyler
				hovered:
					[ :aWidget | aWidget background: BrGlamorousColors hoveredButtonTextColor ].
			aStyler
				pressed:
					[ :aWidget | aWidget background: BrGlamorousColors pressedButtonTextColor ].
			aStyler
				disabled:
					[ :aWidget | aWidget background: BrGlamorousColors disabledButtonTextColor ] ].
	changes
		add:
			(#(widgetContent layout)
				asBrLookPropertyChangeWithValue: [ BlLinearLayout horizontal alignCenter ]).
	changes
		add:
			(#(widgetContent geometry)
				asBrLookPropertyChangeWithValue: [ BlRectangle cornerRadius: 4 ]).
	changes
		add:
			(#(widgetContent constraints vertical resizer)
				asBrLookPropertyChangeWithValue: BlLayoutResizer fitContent).
	changes
		add:
			(#(widgetContent constraints horizontal resizer)
				asBrLookPropertyChangeWithValue: BlLayoutResizer fitContent).
	changes
		add:
			(#(widgetContent padding)
				asBrLookPropertyChangeWithValue: [ BlInsets all: 3 ])
]
