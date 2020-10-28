"
!Replacing adornmens

The following example replaces the whole text with a gray circle. It can be achieved by sending ${method:BlText>>#replacingAdornment:}$ to an instance of the ${class:BlText}$. 
${example:BrTextEditorReplacingAdornmentsExamples>>#singleLineTextWithReplacementAll|previewShow=#gtTextFor:|previewHeight=40|previewExpanded}$

By scoping a text using ${method:BlText>>#from:to:}$ we can replace any arbitrary piece of text with a visual element. For example the first word: ${example:BrTextEditorReplacingAdornmentsExamples>>#singleLineTextWithReplacementFirst|previewShow=#gtTextFor:|previewHeight=40|previewExpanded}$

Or a word in the middle of a sentence: ${example:BrTextEditorReplacingAdornmentsExamples>>#singleLineTextWithReplacementMiddle|previewShow=#gtTextFor:|previewHeight=40|noCode}$

Or even the last word in the same sentence: ${example:BrTextEditorReplacingAdornmentsExamples>>#singleLineTextWithReplacementLast|previewShow=#gtTextFor:|previewHeight=40|noCode}$

Replacement attributes can also stack up if applied on the same piece of text. In this case the order of added elements is defined by the order in which replacement attributes are added: ${example:BrTextEditorReplacingAdornmentsExamples>>#singleLineTextWithMultipleReplacementsOnTopEachOther|previewShow=#gtTextFor:|previewHeight=40|previewExpanded}$

They can also overlapp. In this case attributes that end first take precedence over attributes whose end index is larger and so the elements that they add: ${example:BrTextEditorReplacingAdornmentsExamples>>#singleLineTextWithMultipleOverlappingReplacements|previewShow=#gtTextFor:|previewHeight=40|previewExpanded}$



"
Class {
	#name : #BrTextEditorReplacingAdornmentsExamples,
	#superclass : #BrTextEditorAdornmentsExamples,
	#category : #'Brick-Editor-Examples-Documentation'
}

{ #category : #'examples - replacements' }
BrTextEditorReplacingAdornmentsExamples >> singleLineTextWithMultipleOverlappingReplacements [
	<gtExample>
	<description: 'Multiple replacements can overlapp. In this case the order of the added elements is defined by the end index of the intervals of the attributes'>
	| aText |

	aText := 'The Earth is round' asRopedText.
	(aText from: 1 to: 7)
		replacingAdornment: [
			BlElement new
				geometry: BlEllipseGeometry new;
				size: 20@20;
				background: Color blue ].
	(aText from: 5 to: 9)
		replacingAdornment: [
			BlElement new
				geometry: BlEllipseGeometry new;
				size: 20@20;
				background: Color red ].

	^ aText
]

{ #category : #'examples - replacements' }
BrTextEditorReplacingAdornmentsExamples >> singleLineTextWithMultipleReplacementsOnTopEachOther [
	<gtExample>
	<description: 'Multiple replacements can stack up. The order of added elements is defined by the order in which the attributes are added'>
	| aText |

	aText := 'The Earth is round' asRopedText.
	(aText from: 5 to: 9)
		replacingAdornment: [
			BlElement new
				geometry: BlEllipseGeometry new;
				size: 20@20;
				background: Color red ];
		replacingAdornment: [
			BlElement new
				geometry: BlEllipseGeometry new;
				size: 20@20;
				background: Color blue ].

	^ aText
]

{ #category : #'examples - replacements' }
BrTextEditorReplacingAdornmentsExamples >> singleLineTextWithReplacementAll [
	<gtExample>
	<description: 'Even the whole line of text can be replaced'>
	| aText |

	aText := 'To be replaced' asRopedText
		replacingAdornment: [
			BlElement new
				geometry: BlEllipseGeometry new;
				size: 20@20;
				background: Color gray ].

	^ aText
]

{ #category : #'examples - replacements' }
BrTextEditorReplacingAdornmentsExamples >> singleLineTextWithReplacementFirst [
	<gtExample>
	<description: 'We can replace the first word in a sentence'>
	| aText |

	aText := 'The Earth is round' asRopedText.
	(aText from: 1 to: 3)
		replacingAdornment: [
			BlElement new
				geometry: BlEllipseGeometry new;
				size: 20@20;
				background: Color blue ].
			
	^ aText
]

{ #category : #'examples - replacements' }
BrTextEditorReplacingAdornmentsExamples >> singleLineTextWithReplacementLast [
	<gtExample>
	<description: 'We can replace the last word in a sentence'>
	| aText |

	aText := 'The Earth is round' asRopedText.
	(aText from: 14 to: 18)
		replacingAdornment: [
			BlElement new
				geometry: BlEllipseGeometry new;
				size: 20@20;
				background: Color gray ].
			
	^ aText
]

{ #category : #'examples - replacements' }
BrTextEditorReplacingAdornmentsExamples >> singleLineTextWithReplacementMiddle [
	<gtExample>
	<description: 'We can replace a word in the middle of a sentence'>
	| aText |

	aText := 'The Earth is round' asRopedText.
	(aText from: 5 to: 9)
		replacingAdornment: [
			BlElement new
				geometry: BlEllipseGeometry new;
				size: 20@20;
				background: Color red ].

	^ aText
]
