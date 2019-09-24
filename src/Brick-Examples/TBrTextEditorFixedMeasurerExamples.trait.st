"
I add utility methods related to fixed text measurer
"
Trait {
	#name : #TBrTextEditorFixedMeasurerExamples,
	#category : #'Brick-Examples-Editor'
}

{ #category : #'private - font metrics' }
TBrTextEditorFixedMeasurerExamples >> ascent [
	^ 20
]

{ #category : #'private - font metrics' }
TBrTextEditorFixedMeasurerExamples >> descent [
	^ 20
]

{ #category : #'instance creation' }
TBrTextEditorFixedMeasurerExamples >> editorFor: aText [
	<return: #BrEditor>
	| anEditor aRopedText |

	aRopedText := aText asRopedText lineSpacing: self lineSpacing; paragraphMargin: self paragraphMargin; wordPadding: self wordPadding.

	anEditor := BrEditor new.
	anEditor look: BrEditorLook new.
	anEditor padding: BlInsets empty.
	anEditor fitContent.
	anEditor text: aRopedText.
	
	BlDevCrossover on: anEditor.
	
	anEditor editor segmentBuilder
		wordStencil: [ :aWordText :aTextStart :aTextEnd |
			| aTextElement |
			aTextElement := BrTextWordPieceStencilBuilder new
				text: aWordText start: aTextStart end: aTextEnd;
				asElement.
			aTextElement measurer: (self fixedMeasurer textOffset: aTextStart).
			aTextElement ].
	
	anEditor requestFocus.
	anEditor forceLayout.

	^ anEditor
]

{ #category : #'private - instance creation' }
TBrTextEditorFixedMeasurerExamples >> fixedMeasurer [
	^ BlTextElementFixedMeasurer new
		ascent: self ascent;
		descent: self descent;
		glyphWidth: self glyphWidth;
		glyphHeight: self glyphHeight
]

{ #category : #'private - font metrics' }
TBrTextEditorFixedMeasurerExamples >> glyphHeight [
	^ self ascent + self descent
]

{ #category : #'private - font metrics' }
TBrTextEditorFixedMeasurerExamples >> glyphWidth [
	^ 30
]

{ #category : #'private - font metrics' }
TBrTextEditorFixedMeasurerExamples >> lineSpacing [
	^ 5
]

{ #category : #'private - font metrics' }
TBrTextEditorFixedMeasurerExamples >> paragraphMargin [
	^ BlInsets all: 15
]

{ #category : #'private - font metrics' }
TBrTextEditorFixedMeasurerExamples >> wordPadding [
	^ BlInsets top: 3 bottom: 3
]
