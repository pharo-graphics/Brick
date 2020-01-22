"
I am a progress bar widget. 
I use ${class:BrProgressWithLabelModel}$ to keep progress information.

You can attach ${class:BrProgressLook}$ and ${class:BrTextLabelLook}$ to display progress bar and a description text.

See ${class:BrProgressExamples}$ and ${class:BrGlamorousProgressExamples}$ examples.

!! Animated Progress Bar With Text Above

${example:BrProgressExamples>>#animatedBarAndTextAbove|codeExpanded=false|previewExpanded=true|previewHeight=180}$


"
Class {
	#name : #BrProgress,
	#superclass : #BlElement,
	#category : #'Brick-Progress - UI'
}

{ #category : #accessing }
BrProgress >> amount [
	^ self viewModel amount
]

{ #category : #accessing }
BrProgress >> amount: anAmountNumber total: aTotalNumber [
	^ self viewModel amount: anAmountNumber total: aTotalNumber
]

{ #category : #'accessing - label value format' }
BrProgress >> asIsValues [
	self viewModel asIsValues
]

{ #category : #'accessing - label value format' }
BrProgress >> fileSizeLabelValues [
	self viewModel fileSizeLabelValues
]

{ #category : #'accessing - label format' }
BrProgress >> fixedLabel: aString [
	self viewModel fixedLabel: aString
]

{ #category : #'accessing - label value format' }
BrProgress >> floatLabelValues [
	self viewModel floatLabelValues
]

{ #category : #'accessing - label value format' }
BrProgress >> floatLabelValuesWithDecimals: aNumberOfDecimals [
	self viewModel floatLabelValuesWithDecimals: aNumberOfDecimals
]

{ #category : #accessing }
BrProgress >> fraction [
	^ self viewModel fraction
]

{ #category : #accessing }
BrProgress >> fraction: aNumber [
	^ self viewModel fraction: aNumber
]

{ #category : #initialization }
BrProgress >> initialize [
	super initialize.
	self viewModel: BrProgressWithLabelModel new
]

{ #category : #'accessing - label value format' }
BrProgress >> integerLabelValues [
	self viewModel integerLabelValues
]

{ #category : #accessing }
BrProgress >> label [
	<return: #BlRopedText>
	^ self viewModel label
]

{ #category : #'accessing - label format' }
BrProgress >> patternLabel: aString [
	self viewModel patternLabel: aString
]

{ #category : #accessing }
BrProgress >> percentage [
	^ self viewModel percentage
]

{ #category : #accessing }
BrProgress >> percentage: aNumber [
	^ self viewModel percentage: aNumber
]

{ #category : #accessing }
BrProgress >> total [
	^ self viewModel total
]
