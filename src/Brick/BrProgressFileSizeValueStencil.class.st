"
I convert ${method:BrProgressModel>>#amount|label=#selector}$ and ${method:BrProgressModel>>#total|label=#selector}$ values to a human readable file size: 

${example:BrProgressExamples>>#fileSizeValues|codeExpanded=false|previewExpanded=true|previewHeight=180}$

"
Class {
	#name : #BrProgressFileSizeValueStencil,
	#superclass : #BrProgressValueStencil,
	#category : #'Brick-Progress - Model'
}

{ #category : #printing }
BrProgressFileSizeValueStencil >> create [
	<return: #String>
	| aValue aHumanReadable aLength aUnit |
	aValue := self value asInteger.
	aLength := ((aValue decimalDigitLength / 3) truncated) - 1 max: 0.
	aHumanReadable := (aValue / (1024 raisedTo: (aLength min: 3))) rounded.
	aLength = 0 ifTrue: [ aUnit := 'bytes' ].
	aLength = 1 ifTrue: [ aUnit := 'KB' ].
	aLength = 2 ifTrue: [ aUnit := 'MB' ].
	aLength = 3 ifTrue: [ aUnit := 'GB' ].
	aLength = 4 ifTrue: [ aUnit := 'TB' ].
	^ aHumanReadable printString, ' ', aUnit
]
