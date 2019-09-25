Class {
	#name : #BrGlamorousDropdownLook,
	#superclass : #BrDropdownLook,
	#category : #'Brick-Glamorous-Dropdown'
}

{ #category : #accessing }
BrGlamorousDropdownLook >> backgroundPaint: aColorOrPaint [
	popupEmbellisher backgroundPaint: aColorOrPaint
]

{ #category : #accessing }
BrGlamorousDropdownLook >> border: aBorder [
	popupEmbellisher border: aBorder
]

{ #category : #initialization }
BrGlamorousDropdownLook >> initialize [
	super initialize.
	
	self add: BrLayoutResizerLook inherit.
	self addChangeProperty: #(widget layout) with: [ BlLinearLayout horizontal ]. 
	
	popupEmbellisher := BrGlamorousDropdownPopupEmbellisher new
]
