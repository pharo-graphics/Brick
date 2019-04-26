"
I open a popup in a new window
"
Class {
	#name : #BrPopupWindowTarget,
	#superclass : #BrPopupTarget,
	#category : #'Brick-Popup - Model'
}

{ #category : #'api - popup' }
BrPopupWindowTarget >> closePopup: aPopupElement [
	| aSpace |
	
	aSpace := aPopupElement space.
	aPopupElement removeFromParent.
	aSpace close
]

{ #category : #'api - popup' }
BrPopupWindowTarget >> openPopup: aPopupElement [
	| aSpace |
	
	aSpace := BlSpace new.
	aSpace addChild: aPopupElement.
	aSpace show
]
