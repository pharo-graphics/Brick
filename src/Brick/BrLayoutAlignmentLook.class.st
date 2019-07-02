Class {
	#name : #BrLayoutAlignmentLook,
	#superclass : #BrInteractiveLook,
	#category : #'Brick-Layout Alignment - Look'
}

{ #category : #'instance creation' }
BrLayoutAlignmentLook class >> forHorizontalLinearLayout [
	^ self new
		topLeft: [ :aWidget | aWidget layout: BlLinearLayout horizontal alignTopLeft ];
		topCenter: [ :aWidget | aWidget layout: BlLinearLayout horizontal alignTopCenter ];
		topRight: [ :aWidget | aWidget layout: BlLinearLayout horizontal alignTopRight ];
		centerLeft: [ :aWidget | aWidget layout: BlLinearLayout horizontal alignCenterLeft ];
		center: [ :aWidget | aWidget layout: BlLinearLayout horizontal alignCenter ];
		centerRight: [ :aWidget | aWidget layout: BlLinearLayout horizontal alignCenterRight ];
		bottomLeft: [ :aWidget | aWidget layout: BlLinearLayout horizontal alignBottomLeft ];
		bottomCenter: [ :aWidget | aWidget layout: BlLinearLayout horizontal alignBottomCenter ];
		bottomRight: [ :aWidget | aWidget layout: BlLinearLayout horizontal alignBottomRight ]
]

{ #category : #'instance creation' }
BrLayoutAlignmentLook class >> forVerticalLinearLayout [
	^ self new
		topLeft: [ :aWidget | aWidget layout: BlLinearLayout vertical alignTopLeft ];
		topCenter: [ :aWidget | aWidget layout: BlLinearLayout vertical alignTopCenter ];
		topRight: [ :aWidget | aWidget layout: BlLinearLayout vertical alignTopRight ];
		centerLeft: [ :aWidget | aWidget layout: BlLinearLayout vertical alignCenterLeft ];
		center: [ :aWidget | aWidget layout: BlLinearLayout vertical alignCenter ];
		centerRight: [ :aWidget | aWidget layout: BlLinearLayout vertical alignCenterRight ];
		bottomLeft: [ :aWidget | aWidget layout: BlLinearLayout vertical alignBottomLeft ];
		bottomCenter: [ :aWidget | aWidget layout: BlLinearLayout vertical alignBottomCenter ];
		bottomRight: [ :aWidget | aWidget layout: BlLinearLayout vertical alignBottomRight ]
]

{ #category : #geometry }
BrLayoutAlignmentLook >> bottomCenter: aBlock [
	self
		when: self state bottomCenter
		style: aBlock
]

{ #category : #geometry }
BrLayoutAlignmentLook >> bottomLeft: aBlock [
	self
		when: self state bottomLeft
		style: aBlock
]

{ #category : #geometry }
BrLayoutAlignmentLook >> bottomRight: aBlock [
	self
		when: self state bottomRight
		style: aBlock
]

{ #category : #geometry }
BrLayoutAlignmentLook >> center: aBlock [
	self
		when: self state center
		style: aBlock
]

{ #category : #geometry }
BrLayoutAlignmentLook >> centerLeft: aBlock [
	self
		when: self state centerLeft
		style: aBlock
]

{ #category : #geometry }
BrLayoutAlignmentLook >> centerRight: aBlock [
	self
		when: self state centerRight
		style: aBlock
]

{ #category : #accessing }
BrLayoutAlignmentLook >> state [
	^ BrLayoutAlignmentState
]

{ #category : #geometry }
BrLayoutAlignmentLook >> topCenter: aBlock [
	self
		when: self state topCenter
		style: aBlock
]

{ #category : #geometry }
BrLayoutAlignmentLook >> topLeft: aBlock [
	self
		when: self state topLeft
		style: aBlock
]

{ #category : #geometry }
BrLayoutAlignmentLook >> topRight: aBlock [
	self
		when: self state topRight
		style: aBlock
]
