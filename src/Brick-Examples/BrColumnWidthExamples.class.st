"
! Column width examples

The ${class:BrColumnWidth}$ is an abstract class. There are examples for each type of the column width:

- ${class:BrColumnFixedWidthExamples}$ to see examples of the fixed column width
- ${class:BrColumnProportionalWidthExamples}$ to see examples of the proportional column width
- ${class:BrColumnUndefinedWidthExamples}$ to see examples of the undefined column width
"
Class {
	#name : #BrColumnWidthExamples,
	#superclass : #Object,
	#category : #'Brick-Examples-! Model - Column'
}

{ #category : #examples }
BrColumnWidthExamples >> columnWidthIsAbstract [
	<gtExample>
	
	self assert: BrColumnWidth isAbstract.
	
	^ BrColumnWidth isAbstract
]
