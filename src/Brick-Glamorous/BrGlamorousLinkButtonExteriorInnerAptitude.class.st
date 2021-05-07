"
I am a copy of class BrGlamorousLinkButtonExteriorLook. This comment is copied from there, and might not be entirely accurate

I define the rectangular exterior of the link button.
"
Class {
	#name : #BrGlamorousLinkButtonExteriorInnerAptitude,
	#superclass : #BrStyleCommonAptitude,
	#instVars : [
		'backgroundPaint'
	],
	#category : #'Brick-Glamorous-Buttons - Support'
}

{ #category : #accessing }
BrGlamorousLinkButtonExteriorInnerAptitude >> backgroundPaint [
	^ backgroundPaint
]

{ #category : #accessing }
BrGlamorousLinkButtonExteriorInnerAptitude >> backgroundPaint: anObject [
	backgroundPaint := anObject
]

{ #category : #initialization }
BrGlamorousLinkButtonExteriorInnerAptitude >> initialize [
	super initialize.
	backgroundPaint := BrGlamorousColors disabledButtonBackgroundColor.

	self
		default: [ :aStyle | aStyle background: self backgroundPaint ];
		hovered: [ :aStyle | aStyle background: BrGlamorousColors hoveredButtonTextColor ];
		pressed: [ :aStyle | aStyle background: BrGlamorousColors pressedButtonTextColor ];
		disabled: [ :aStyle | aStyle background: BrGlamorousColors disabledButtonTextColor ].

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
