"
I am a copy of class BrGlamorousLinkButtonExteriorLook. This comment is copied from there, and might not be entirely accurate

I define the rectangular exterior of the link button.
"
Class {
	#name : #BrGlamorousLinkButtonExteriorInnerLook,
	#superclass : #BrInteractiveCommonLook,
	#instVars : [
		'backgroundPaint'
	],
	#category : #'Brick-Glamorous-Buttons'
}

{ #category : #accessing }
BrGlamorousLinkButtonExteriorInnerLook >> backgroundPaint [
	^ backgroundPaint
]

{ #category : #accessing }
BrGlamorousLinkButtonExteriorInnerLook >> backgroundPaint: anObject [
	backgroundPaint := anObject
]

{ #category : #initialization }
BrGlamorousLinkButtonExteriorInnerLook >> initialize [
	super initialize.
	backgroundPaint := BrGlamorousColors disabledButtonBackgroundColor.

	self
		default: [ :aWidget | aWidget background: self backgroundPaint ];
		hovered: [ :aWidget | aWidget background: BrGlamorousColors hoveredButtonTextColor ];
		pressed: [ :aWidget | aWidget background: BrGlamorousColors pressedButtonTextColor ];
		disabled: [ :aWidget | aWidget background: BrGlamorousColors disabledButtonTextColor ].

	self
		addChangeProperty: #(widgetContent layout)
		with: [ BlLinearLayout horizontal alignCenter ].
	self
		addChangeProperty: #(widgetContent geometry)
		with: [ BlRectangleGeometry new ].
	self
		addChangeProperty: #(widgetContent constraints vertical resizer)
		with: BlLayoutResizer fitContent.
	self
		addChangeProperty: #(widgetContent constraints horizontal resizer)
		with: BlLayoutResizer fitContent.
	self
		addChangeProperty: #(widgetContent padding)
		with: [ BlInsets top: 3 left: 0 bottom: 3 right: 0 ]
]
