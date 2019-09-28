Class {
	#name : #BrLayoutAlignmentTypes,
	#superclass : #SharedPool,
	#classVars : [
		'BottomCenter',
		'BottomLeft',
		'BottomRight',
		'Center',
		'CenterLeft',
		'CenterRight',
		'None',
		'TopCenter',
		'TopLeft',
		'TopRight'
	],
	#category : #'Brick-Layout Alignment - States'
}

{ #category : #'class initialization' }
BrLayoutAlignmentTypes class >> initialize [
	TopLeft := #topLeft.
	TopRight := #topRight.
	TopCenter := #topCenter.
	BottomLeft := #bottomLeft.
	BottomRight := #bottomRight.
	BottomCenter := #bottomCenter.
	CenterLeft := #centerLeft.
	Center := #center.
	CenterRight := #centerRight.
	None := #none
]
