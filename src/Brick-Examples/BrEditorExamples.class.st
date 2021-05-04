Class {
	#name : #BrEditorExamples,
	#superclass : #Object,
	#category : #'Brick-Examples-Editor'
}

{ #category : #'examples - modes' }
BrEditorExamples >> editableEditorWithGlamorousRegularLook [
	<gtExample>
	
	^ BrEditor new
		aptitude: BrGlamorousRegularEditorAptitude new;
		beEditable;
		text: String loremIpsum
]

{ #category : #'examples - input filter' }
BrEditorExamples >> editorWithAlphaNumericFilter [
	<gtExample>

	^ BrEditor new
		aptitude: BrGlamorousRegularEditorAptitude + BrGlamorousEditorSpacingAptitude;
		inputFilter: BrTextEditorAlphaNumericInputFilter new;
		vFitContent;
		text: 'Only alpha-numeric chatacters are allowed'
]

{ #category : #'examples - input filter' }
BrEditorExamples >> editorWithDigitFilter [
	<gtExample>
	
	^ BrEditor new
		aptitude: BrGlamorousRegularEditorAptitude + BrGlamorousEditorSpacingAptitude;
		inputFilter: BrTextEditorDigitInputFilter new;
		vFitContent;
		text: 'Only digits are allowed'
]

{ #category : #examples }
BrEditorExamples >> editorWithGlamorousRegularLook [
	<gtExample>
	
	^ BrEditor new
		aptitude: BrGlamorousRegularEditorAptitude new;
		text: String loremIpsum
]

{ #category : #'examples - modes look' }
BrEditorExamples >> editorWithGlamorousRegularLookAndModeLook [
	<gtExample>
	| aModeLook anEditor |
	
	aModeLook := BrEditorModeAptitude new
		editableFocused: [ :aWidget | aWidget border: (BlBorder paint: BrGlamorousColors focusedEditorBorderColor width: 1) ];
		editableUnfocused: [ :aWidget | aWidget border: (BlBorder paint: BrGlamorousColors editorBorderColor width: 1) ];
		readOnly: [ :aWidget | aWidget border: BlBorder empty ].

	anEditor := BrEditor new
		aptitude: BrGlamorousRegularEditorAptitude new + aModeLook;
		text: String loremIpsum;
		vFitContent.

	^ BrHorizontalPane new
		cellSpacing: 5;
		hMatchParent;
		vFitContent;
		addChildren: { 
			anEditor.
			BrVerticalPane new
				fitContent;
				cellSpacing: 5;
				addChildren: { 
					BrButton new
						aptitude: BrGlamorousButtonWithLabelAptitude new;
						label: 'Editable';
						action: [ anEditor beEditable ].
					BrButton new
						aptitude: BrGlamorousButtonWithLabelAptitude new;
						label: 'Readonly with selection';
						action: [ anEditor beReadOnlyWithSelection ].
					BrButton new
						aptitude: BrGlamorousButtonWithLabelAptitude new;
						label: 'Readonly without selection';
						action: [ anEditor beReadOnlyWithoutSelection ]
				}
		}
]

{ #category : #'examples - input filter' }
BrEditorExamples >> editorWithNoFilter [
	<gtExample>
	
	^ BrEditor new
		aptitude: BrGlamorousRegularEditorAptitude + BrGlamorousEditorSpacingAptitude;
		inputFilter: BrTextEditorNoInputFilter new;
		vFitContent;
		text: 'All characters are allowed'
]

{ #category : #'examples - modes' }
BrEditorExamples >> readOnlyWithSelectionEditorWithGlamorousRegularLook [
	<gtExample>
	
	^ BrEditor new
		aptitude: BrGlamorousRegularEditorAptitude new;
		beReadOnlyWithSelection;
		text: String loremIpsum
]

{ #category : #'examples - modes' }
BrEditorExamples >> readOnlyWithoutSelectionEditorWithGlamorousRegularLook [
	<gtExample>
	
	^ BrEditor new
		aptitude: BrGlamorousRegularEditorAptitude new;
		beReadOnlyWithoutSelection;
		text: String loremIpsum
]
