Class {
	#name : #BrTextEditorOperatorExamples,
	#superclass : #Object,
	#traits : 'TBrTextEditorFixedMeasurerExamples',
	#classTraits : 'TBrTextEditorFixedMeasurerExamples classTrait',
	#category : #'Brick-Examples-Editor'
}

{ #category : #'instance creation' }
BrTextEditorOperatorExamples >> editorOnEmptyText [
	<gtExample>
	| anEditor anEditorElement |
	
	anEditorElement := self editorFor: '' asRopedText.
	anEditor := anEditorElement editor.
	
	self assert: anEditor cursor isEmpty.	
	self assert: anEditor selection isEmpty.
	
	^ anEditorElement
]

{ #category : #'instance creation' }
BrTextEditorOperatorExamples >> editorOnMultilineText [
	<gtExample>
	| anEditor anEditorElement |
	
	anEditorElement := self editorFor: self multilineText.
	anEditor := anEditorElement editor.
	
	self assert: anEditor cursor isEmpty.	
	self assert: anEditor selection isEmpty.
	
	^ anEditorElement
]

{ #category : #'utility - examples' }
BrTextEditorOperatorExamples >> findWhitespaceInEmptyAt_0 [
	<gtExample>
	| text editor whitespace |
	
	text := '' asRopedText.
	editor := BrTextEditor new text: text.
	whitespace := editor inserter findWhitespaceOfLineBefore: 0.
	
	self assert: whitespace = ''.
	
	^ whitespace
]

{ #category : #'utility - examples' }
BrTextEditorOperatorExamples >> findWhitespaceIn_Hello_at_0 [
	<gtExample>
	| text editor whitespace |
	
	text := 'Hello' asRopedText.
	editor := BrTextEditor new text: text.
	whitespace := editor inserter findWhitespaceOfLineBefore: 0.
	
	self assert: whitespace = ''.
	
	^ whitespace
]

{ #category : #'utility - examples' }
BrTextEditorOperatorExamples >> findWhitespaceIn_Hello_at_1 [
	<gtExample>
	| text editor whitespace |
	
	text := 'Hello' asRopedText.
	editor := BrTextEditor new text: text.
	whitespace := editor inserter findWhitespaceOfLineBefore: 1.

	self assert: whitespace = ''.

	^ whitespace
]

{ #category : #'utility - examples' }
BrTextEditorOperatorExamples >> findWhitespaceIn_Hello_at_2 [
	<gtExample>
	| text editor whitespace |
	
	text := 'Hello' asRopedText.
	editor := BrTextEditor new text: text.
	whitespace := editor inserter findWhitespaceOfLineBefore: 2.

	self assert: whitespace = ''.

	^ whitespace
]

{ #category : #'utility - examples' }
BrTextEditorOperatorExamples >> findWhitespaceIn_Hello_at_3 [
	<gtExample>
	| text editor whitespace |
	
	text := 'Hello' asRopedText.
	editor := BrTextEditor new text: text.
	whitespace := editor inserter findWhitespaceOfLineBefore: 3.

	self assert: whitespace = ''.

	^ whitespace
]

{ #category : #'utility - examples' }
BrTextEditorOperatorExamples >> findWhitespaceIn_Hello_at_4 [
	<gtExample>
	| text editor whitespace |
	
	text := 'Hello' asRopedText.
	editor := BrTextEditor new text: text.
	whitespace := editor inserter findWhitespaceOfLineBefore: 4.

	self assert: whitespace = ''.

	^ whitespace
]

{ #category : #'utility - examples' }
BrTextEditorOperatorExamples >> findWhitespaceIn_Hello_at_5 [
	<gtExample>
	| text editor whitespace |
	
	text := 'Hello' asRopedText.
	editor := BrTextEditor new text: text.
	whitespace := editor inserter findWhitespaceOfLineBefore: 5.

	self assert: whitespace = ''.

	^ whitespace
]

{ #category : #'utility - examples' }
BrTextEditorOperatorExamples >> findWhitespaceIn_Hello_cr_World_at_6 [
	<gtExample>
	| text editor whitespace |
	
	text := ('Hello', String cr, 'World') asRopedText.
	editor := BrTextEditor new text: text.
	whitespace := editor inserter findWhitespaceOfLineBefore: 6.
	
	self assert: whitespace = ''.
	
	^ whitespace
]

{ #category : #'utility - examples' }
BrTextEditorOperatorExamples >> findWhitespaceIn_Hello_cr_World_at_7 [
	<gtExample>
	| text editor whitespace |
	
	text := ('Hello', String cr, 'World') asRopedText.
	editor := BrTextEditor new text: text.
	whitespace := editor inserter findWhitespaceOfLineBefore: 7.
	
	self assert: whitespace = ''.
	
	^ whitespace
]

{ #category : #'utility - examples' }
BrTextEditorOperatorExamples >> findWhitespaceIn_Hello_cr_World_at_8 [
	<gtExample>
	| text editor whitespace |
	
	text := ('Hello', String cr, 'World') asRopedText.
	editor := BrTextEditor new text: text.
	whitespace := editor inserter findWhitespaceOfLineBefore: 8.
	
	self assert: whitespace = ''.
	
	^ whitespace
]

{ #category : #'utility - examples' }
BrTextEditorOperatorExamples >> findWhitespaceIn_Hello_cr_space_World_at_6 [
	<gtExample>
	| text editor whitespace |
	
	text := ('Hello', String cr, ' World') asRopedText.
	editor := BrTextEditor new text: text.
	whitespace := editor inserter findWhitespaceOfLineBefore: 6.
	
	self assert: whitespace = ''.
	
	^ whitespace
]

{ #category : #'utility - examples' }
BrTextEditorOperatorExamples >> findWhitespaceIn_Hello_cr_space_World_at_7 [
	<gtExample>
	| text editor whitespace |
	
	text := ('Hello', String cr, ' World') asRopedText.
	editor := BrTextEditor new text: text.
	whitespace := editor inserter findWhitespaceOfLineBefore: 7.
	
	self assert: whitespace = ' '.
	
	^ whitespace
]

{ #category : #'utility - examples' }
BrTextEditorOperatorExamples >> findWhitespaceIn_Hello_cr_space_World_at_8 [
	<gtExample>
	| text editor whitespace |
	
	text := ('Hello', String cr, ' World') asRopedText.
	editor := BrTextEditor new text: text.
	whitespace := editor inserter findWhitespaceOfLineBefore: 8.
	
	self assert: whitespace = ' '.
	
	^ whitespace
]

{ #category : #'utility - examples' }
BrTextEditorOperatorExamples >> findWhitespaceIn_space_Hello_at_0 [
	<gtExample>
	| text editor whitespace |
	
	text := ' Hello' asRopedText.
	editor := BrTextEditor new text: text.
	whitespace := editor inserter findWhitespaceOfLineBefore: 0.
	
	self assert: whitespace = ''.
	
	^ whitespace
]

{ #category : #'utility - examples' }
BrTextEditorOperatorExamples >> findWhitespaceIn_space_Hello_at_1 [
	<gtExample>
	| text editor whitespace |
	
	text := ' Hello' asRopedText.
	editor := BrTextEditor new text: text.
	whitespace := editor inserter findWhitespaceOfLineBefore: 1.
	
	self assert: whitespace = ' '.
	
	^ whitespace
]

{ #category : #'utility - examples' }
BrTextEditorOperatorExamples >> findWhitespaceIn_space_Hello_at_2 [
	<gtExample>
	| text editor whitespace |
	
	text := ' Hello' asRopedText.
	editor := BrTextEditor new text: text.
	whitespace := editor inserter findWhitespaceOfLineBefore: 2.
	
	self assert: whitespace = ' '.
	
	^ whitespace
]

{ #category : #'utility - examples' }
BrTextEditorOperatorExamples >> findWhitespaceIn_space_at_0 [
	<gtExample>
	| text editor whitespace |
	
	text := ' ' asRopedText.
	editor := BrTextEditor new text: text.
	whitespace := editor inserter findWhitespaceOfLineBefore: 0.
	
	self assert: whitespace = ''.
	
	^ whitespace
]

{ #category : #'utility - examples' }
BrTextEditorOperatorExamples >> findWhitespaceIn_space_at_1 [
	<gtExample>
	| text editor whitespace |
	
	text := ' ' asRopedText.
	editor := BrTextEditor new text: text.
	whitespace := editor inserter findWhitespaceOfLineBefore: 1.
	
	self assert: whitespace = ' '.
	
	^ whitespace
]

{ #category : #'utility - examples' }
BrTextEditorOperatorExamples >> findWhitespaceIn_space_space_at_0 [
	<gtExample>
	| text editor whitespace |
	
	text := '  ' asRopedText.
	editor := BrTextEditor new text: text.
	whitespace := editor inserter findWhitespaceOfLineBefore: 0.
	
	self assert: whitespace = ''.
	
	^ whitespace
]

{ #category : #'utility - examples' }
BrTextEditorOperatorExamples >> findWhitespaceIn_space_space_at_1 [
	<gtExample>
	| text editor whitespace |
	
	text := '  ' asRopedText.
	editor := BrTextEditor new text: text.
	whitespace := editor inserter findWhitespaceOfLineBefore: 1.
	
	self assert: whitespace = ' '.
	
	^ whitespace
]

{ #category : #'utility - examples' }
BrTextEditorOperatorExamples >> findWhitespaceIn_space_space_at_2 [
	<gtExample>
	| text editor whitespace |
	
	text := '  ' asRopedText.
	editor := BrTextEditor new text: text.
	whitespace := editor inserter findWhitespaceOfLineBefore: 2.
	
	self assert: whitespace = '  '.
	
	^ whitespace
]

{ #category : #'utility - examples' }
BrTextEditorOperatorExamples >> findWhitespaceIn_space_tab_at_0 [
	<gtExample>
	| text editor whitespace |
	
	text := (' ', String tab) asRopedText.
	editor := BrTextEditor new text: text.
	whitespace := editor inserter findWhitespaceOfLineBefore: 0.
	
	self assert: whitespace = ''.
	
	^ whitespace
]

{ #category : #'utility - examples' }
BrTextEditorOperatorExamples >> findWhitespaceIn_space_tab_at_1 [
	<gtExample>
	| text editor whitespace |
	
	text := (' ', String tab) asRopedText.
	editor := BrTextEditor new text: text.
	whitespace := editor inserter findWhitespaceOfLineBefore: 1.
	
	self assert: whitespace = ' '.
	
	^ whitespace
]

{ #category : #'utility - examples' }
BrTextEditorOperatorExamples >> findWhitespaceIn_space_tab_at_2 [
	<gtExample>
	| text editor whitespace |
	
	text := (' ', String tab) asRopedText.
	editor := BrTextEditor new text: text.
	whitespace := editor inserter findWhitespaceOfLineBefore: 2.
	
	self assert: whitespace = (' ', String tab).
	
	^ whitespace
]

{ #category : #'instance creation' }
BrTextEditorOperatorExamples >> multilineText [
	<gtExample>
	
	^ 'A summer river being crossed
how pleasing
with sandals in my hands!

Light of the moon
Moves west, flowers'' shadows
Creep eastward.

In the moonlight,
The color and scent of the wisteria
Seems far away.' asRopedText
]

{ #category : #'private - events' }
BrTextEditorOperatorExamples >> subscribe: anEventClass do: aBlock for: anElement [
	anElement when: anEventClass do: aBlock
]

{ #category : #'private - events' }
BrTextEditorOperatorExamples >> unsubscribe: anEventClass from: anElement [
	anElement removeEventHandlersSuchThat: [ :anEventHandler | (anEventHandler isKindOf: BlEventHandler) and: [ anEventHandler eventClass = anEventClass ] ]
]
