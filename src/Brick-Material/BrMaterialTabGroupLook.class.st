Class {
	#name : #BrMaterialTabGroupLook,
	#superclass : #BrLook,
	#instVars : [
		'headerLook'
	],
	#category : 'Brick-Material-Collection'
}

{ #category : #'api - style' }
BrMaterialTabGroupLook >> headerBackground: aBackground [
	headerLook headerDo: [ :aHeaderElement | aHeaderElement background: aBackground ]
]

{ #category : #initialization }
BrMaterialTabGroupLook >> initialize [
	super initialize.

	self addAll: {
		headerLook := BrTabGroupHeaderLook new
		+ ((BrLayoutLook of: #header) linearHorizontal hMatchParent vFitContent)
		+ (BrLayoutLook of: #tabbar) linearHorizontal hMatchParent alignCenter
		+ (BrLayoutLook of: #toolbar) linearHorizontal vFitContent alignCenter.
		BrTabGroupSplitterLook new.
		BrTabGroupContentLook new + (BrLayoutLook of: #content) matchParent.

		"layout of the tab whole group is linear vertical"
		BrLayoutLook linearVertical matchParent.
	}
]