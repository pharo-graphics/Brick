Class {
	#name : #BrMaterialTabBackgroundLook,
	#superclass : #BrTabLook,
	#instVars : [
		'normalBackground',
		'checkedBackground',
		'bar'
	],
	#category : #'Brick-Material-Tabs - Support'
}

{ #category : #accessing }
BrMaterialTabBackgroundLook >> bar [
	<return: #BlElement>

	^ bar
]

{ #category : #accessing }
BrMaterialTabBackgroundLook >> barDo: aBlock [
	aBlock value: self bar
]

{ #category : #testing }
BrMaterialTabBackgroundLook >> hasBar [
	<return: #Boolean>

	^ self bar hasParent
]

{ #category : #initialization }
BrMaterialTabBackgroundLook >> initialize [
	super initialize.

	bar := BlElement new.
	bar background: (Color fromHexString: #'2196F3').
	bar constraintsDo: [ :c |
		c ignoreByLayout.
		c ignored vertical alignBottom.
		c vertical exact: 2.
		c horizontal matchParent ]
]

{ #category : #'event handling' }
BrMaterialTabBackgroundLook >> tabDeselected [
	super tabDeselected.

	self bar removeFromParent
]

{ #category : #'event handling' }
BrMaterialTabBackgroundLook >> tabSelected [
	super tabSelected.
	
	self bar removeFromParent.
	self widgetContent addChild: self bar
]
