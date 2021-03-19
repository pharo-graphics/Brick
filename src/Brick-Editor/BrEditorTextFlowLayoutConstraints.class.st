"
I am special text flow layout constraints that add support line breaking and pushing which is very useful for embedding visual elements in moldable text editor.
"
Class {
	#name : #BrEditorTextFlowLayoutConstraints,
	#superclass : #BlLayoutConstraints,
	#instVars : [
		'pushLine',
		'shouldFillLine',
		'breakLineBefore',
		'breakLineAfter',
		'assignedLine'
	],
	#category : #'Brick-Editor-Layout'
}

{ #category : #accessing }
BrEditorTextFlowLayoutConstraints >> assignToLine: aBrEditorTextFlowLine [
	assignedLine := aBrEditorTextFlowLine
]

{ #category : #accessing }
BrEditorTextFlowLayoutConstraints >> assignedLine [
	^ assignedLine
]

{ #category : #accessing }
BrEditorTextFlowLayoutConstraints >> breakLineAfter [
	"Mark an element such that a line should be broken AFTER it"

	breakLineAfter := true
]

{ #category : #accessing }
BrEditorTextFlowLayoutConstraints >> breakLineBefore [
	"Mark an element such that a line should be broken BEFORE it"

	breakLineBefore := true
]

{ #category : #accessing }
BrEditorTextFlowLayoutConstraints >> doNotFillLine [
	shouldFillLine := false
]

{ #category : #initialization }
BrEditorTextFlowLayoutConstraints >> initialize [
	super initialize.
	
	breakLineBefore := false.
	breakLineAfter := false.
	pushLine := false.
	shouldFillLine := true
]

{ #category : #accessing }
BrEditorTextFlowLayoutConstraints >> pushLine [
	"Mark an element such that it will be pushed to the new line after the current line"
	
	pushLine := true
]

{ #category : #testing }
BrEditorTextFlowLayoutConstraints >> shouldBreakLineAfter [
	"Return true if current line should be broken AFTER an element, false otherwise"
	<return: #Boolean>

	^ breakLineAfter
]

{ #category : #testing }
BrEditorTextFlowLayoutConstraints >> shouldBreakLineBefore [
	"Return true if current line should be broken BEFORE an element, false otherwise"
	<return: #Boolean>

	^ breakLineBefore
]

{ #category : #testing }
BrEditorTextFlowLayoutConstraints >> shouldFillLine [
	"Return true if the element should fill all available space in the line if it is the last element"

	^ shouldFillLine
]

{ #category : #testing }
BrEditorTextFlowLayoutConstraints >> shouldPushLine [
	"Return true if an element should be pushed to the new line after the end of the current line, false otherwise"
	<return: #Boolean>
	
	^ pushLine
]
