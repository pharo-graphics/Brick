Class {
	#name : #BrCheckboxExamples,
	#superclass : #Object,
	#category : #'Brick-Examples-Checkbox'
}

{ #category : #'form-scripting' }
BrCheckboxExamples >> checkbox [
	<gtExample>
	| checkbox |
	checkbox := BrCheckbox new.
	self assert: checkbox isChecked not.
	^ checkbox
]

{ #category : #'form-scripting' }
BrCheckboxExamples >> checkboxWithLook [
	<gtExample>
	^ self checkbox look: BrGlamorousCheckboxLook
]

{ #category : #'form-scripting' }
BrCheckboxExamples >> checkedCheckbox [
	<gtExample>
	| checkbox |
	checkbox := self checkbox.
	checkbox check.
	self assert: checkbox isChecked.
	^ checkbox
]

{ #category : #'form-scripting' }
BrCheckboxExamples >> checkedCheckboxWithLook [
	<gtExample>
	^ self checkedCheckbox look: BrGlamorousCheckboxLook
]
