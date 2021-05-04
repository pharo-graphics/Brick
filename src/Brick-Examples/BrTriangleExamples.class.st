Class {
	#name : #BrTriangleExamples,
	#superclass : #Object,
	#category : #'Brick-Examples-Triangle'
}

{ #category : #basic }
BrTriangleExamples >> basicTriangle [
	<gtExample>
	| aTriangle |
	aTriangle := BrTriangle new.
	^ aTriangle
]

{ #category : #glamorous }
BrTriangleExamples >> glamorousInCircle [
	<gtExample>
	| aTriangle |
	aTriangle := self basicTriangle.
	aTriangle aptitude: BrGlamorousTriangleInCircleAptitude.
	^ aTriangle
]

{ #category : #glamorous }
BrTriangleExamples >> glamorousInCircleCollapsed [
	<gtExample>
	| aTriangle |
	aTriangle := self glamorousInCircleExpanded.
	aTriangle collapse.
	self assert: aTriangle isCollapsed.
	^ aTriangle
]

{ #category : #glamorous }
BrTriangleExamples >> glamorousInCircleDisabled [
	<gtExample>
	| aTriangle |
	aTriangle := self glamorousInCircle.
	aTriangle aptitude: BrGlamorousTriangleInCircleAptitude.
	aTriangle disable.
	self assert: aTriangle isDisabled.
	^ aTriangle
]

{ #category : #glamorous }
BrTriangleExamples >> glamorousInCircleExpanded [
	<gtExample>
	| aTriangle |
	aTriangle := self glamorousInCircle.
	aTriangle expand.
	self assert: aTriangle isExpanded.
	^ aTriangle
]

{ #category : #glamorous }
BrTriangleExamples >> glamorousInCircleHidden [
	<gtExample>
	| aTriangle |
	aTriangle := self glamorousInCircle.
	aTriangle hide.
	^ aTriangle
]

{ #category : #glamorous }
BrTriangleExamples >> glamorousInCircleVisible [
	<gtExample>
	| aTriangle |
	aTriangle := self glamorousInCircleHidden.
	aTriangle show.
	^ aTriangle
]

{ #category : #glamorous }
BrTriangleExamples >> glamorousInCircleWithAction [
	<gtExample>
	| aTriangle theActions |
	theActions := OrderedCollection new.

	aTriangle := self glamorousInCircle.
	aTriangle toggleAction: [ :aButton | theActions add: aButton isExpanded ].

	BlSpace simulateClickOn: aTriangle.

	self assert: aTriangle isExpanded description: 'Triangle must be expanded'.
	self assert: theActions size equals: 1.
	self assert: theActions first description: 'Triangle action must be expanded'.

	aTriangle userData at: #example put: theActions.
	
	^ aTriangle
]

{ #category : #basic }
BrTriangleExamples >> triangle [
	<gtExample>
	| aTriangle |
	aTriangle := self basicTriangle.
	aTriangle aptitude: BrTriangleAptitude.
	^ aTriangle
]
