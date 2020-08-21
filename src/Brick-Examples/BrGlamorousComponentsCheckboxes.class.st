"
! Checkbox
Permit the user to make a binary choice, i.e. a choice between one of two possible mutually exclusive options. If needed it is possible to use checkboxes that allow an indeterminate state in addition to the two provided by a normal checkbox.
!!!!Unchecked
${example:BrGlamorousComponentsCheckboxes>>#unchecked|previewShow=#gtLiveFor:|previewHeight=60|previewExpanded=true|codeExpanded=false}$
!!!!Checked
${example:BrGlamorousComponentsCheckboxes>>#checked|previewShow=#gtLiveFor:|previewHeight=60|previewExpanded=true|codeExpanded=false}$
!!!!Indeterminate
${example:BrGlamorousComponentsCheckboxes>>#indeterminate|previewShow=#gtLiveFor:|previewHeight=60|previewExpanded=true|codeExpanded=false}$
"
Class {
	#name : #BrGlamorousComponentsCheckboxes,
	#superclass : #BrGlamorousComponents,
	#category : #'Brick-Examples-! Glamorous'
}

{ #category : #'instance creation' }
BrGlamorousComponentsCheckboxes >> checked [
	<gtExample>
	
	^ BrCheckbox new
		look: BrGlamorousCheckboxLook;
		check
]

{ #category : #'instance creation' }
BrGlamorousComponentsCheckboxes >> indeterminate [
	<gtExample>

	^ BrCheckbox new
		look: BrGlamorousCheckboxLook;
		indeterminate
]

{ #category : #'instance creation' }
BrGlamorousComponentsCheckboxes >> unchecked [
	<gtExample>
	
	^ BrCheckbox new
		look: BrGlamorousCheckboxLook;
		uncheck
]
