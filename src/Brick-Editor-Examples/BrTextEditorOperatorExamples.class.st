Class {
	#name : #BrTextEditorOperatorExamples,
	#superclass : #Object,
	#traits : 'TBrTextEditorFixedMeasurerExamples',
	#classTraits : 'TBrTextEditorFixedMeasurerExamples classTrait',
	#category : #'Brick-Editor-Examples-Operators'
}

{ #category : #'focus - examples' }
BrTextEditorOperatorExamples >> editorCreatesOneCursorOnFocus [
	<gtExample>
	| anEditor aSpace |
	
	anEditor := self editorHasNoFocusByDefault.
	
	aSpace := BlSpace new.
	aSpace host: BlHeadlessHost new.
	aSpace addChild: anEditor.
	
	self assert: anEditor cursors isEmpty.
	
	anEditor requestFocus.
	aSpace pulse.
	
	self assert: anEditor isFocused.
	self assert: anEditor hasFocus.
	self assert: anEditor cursors allCursors equals: { BrTextEditorSingleCursor new position: 0 }.
	
	aSpace removeChild: anEditor.
	
	^ anEditor
]

{ #category : #'instance creation' }
BrTextEditorOperatorExamples >> editorFor: aText [
	<return: #BrEditor>
	| anEditor aRopedText |

	aRopedText := aText asRopedText lineSpacing: self lineSpacing; paragraphMargin: self paragraphMargin; wordPadding: self wordPadding.

	anEditor := BrEditor new.
	anEditor editor beLineBased.
	anEditor look: BrEditorLook new.
	anEditor padding: BlInsets empty.
	anEditor fitContent.
	anEditor text: aRopedText.
	
	BlDevCrossover on: anEditor.
	
	anEditor editor segmentBuilder
		wordStencil: [ :aTBrTextEditorTextualPiece |
			| aTextElement |
			aTextElement := BrTextEditableWordPieceStencilBuilder new
				segmentPiece: aTBrTextEditorTextualPiece;
				asElement.
			aTextElement measurer: self fixedMeasurer.
			aTextElement measurer measurer textOffset: aTBrTextEditorTextualPiece textStart.
			aTextElement ].
	
	anEditor requestFocus.
	anEditor forceLayout.

	^ anEditor
]

{ #category : #'focus - examples' }
BrTextEditorOperatorExamples >> editorHasNoFocusByDefault [
	<gtExample>
	| anEditor |
	
	anEditor := BrEditor new.
	self assert: anEditor isFocused not.
	self assert: anEditor hasFocus not.
	
	^ anEditor
]

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

{ #category : #'private - utility' }
BrTextEditorOperatorExamples >> piecesWithCursorIn: anEditorElement [
	^ anEditorElement withAllChildrenBreadthFirst
		select: [ :eachChild | eachChild isKindOf: BrCursorElement ]
		thenCollect: [ :eachCursor | eachCursor parent ]
]

{ #category : #'private - events' }
BrTextEditorOperatorExamples >> subscribe: anEventClass do: aBlock for: anElement [
	anElement when: anEventClass do: aBlock
]

{ #category : #'private - events' }
BrTextEditorOperatorExamples >> unsubscribe: anEventClass from: anElement [
	anElement removeEventHandlersSuchThat: [ :anEventHandler | (anEventHandler isKindOf: BlEventHandler) and: [ anEventHandler eventClass = anEventClass ] ]
]
