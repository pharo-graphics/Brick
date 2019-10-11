Class {
	#name : #OLDBrGlamorousDropdownLook,
	#superclass : #OLDBrDropdownLook,
	#category : #'Brick-Glamorous-Dropdown'
}

{ #category : #accessing }
OLDBrGlamorousDropdownLook >> backgroundPaint: aColorOrPaint [
	popupEmbellisher backgroundPaint: aColorOrPaint
]

{ #category : #accessing }
OLDBrGlamorousDropdownLook >> border: aBorder [
	popupEmbellisher border: aBorder
]

{ #category : #initialization }
OLDBrGlamorousDropdownLook >> initialize [
	super initialize.
	
	self add: BrLayoutResizerLook inherit.
	self addChangeProperty: #(widget layout) with: [ BlLinearLayout horizontal ]. 
	
	popupEmbellisher := OLDBrGlamorousDropdownPopupEmbellisher new
]
