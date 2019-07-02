Class {
	#name : #BrLayoutAlignmentLook,
	#superclass : #BrInteractiveLook,
	#category : #'Brick-Layout Alignment - Look'
}

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
