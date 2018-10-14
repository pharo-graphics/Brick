"
I add utility methods related to fixed text measurer
"
Trait {
	#name : #TBrTextEditorFixedMeasurerExamples,
	#category : #'Brick-Editor-Examples'
}

{ #category : #'private - font metrics' }
TBrTextEditorFixedMeasurerExamples >> ascent [
	^ 20
]

{ #category : #'private - font metrics' }
TBrTextEditorFixedMeasurerExamples >> descent [
	^ 20
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
	^ 20
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
