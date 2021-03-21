"
I convert ${method:BrProgressModel>>#amount|label=#selector}$ and ${method:BrProgressModel>>#total|label=#selector}$ values to an ${class:Integer}$:

${example:BrProgressExamples>>#integerValues|codeExpanded=false|previewExpanded=true|previewHeight=180}$

"
Class {
	#name : #BrProgressIntegerValueStencil,
	#superclass : #BrProgressValueStencil,
	#category : #'Brick-Progress - Model'
}

{ #category : #'api - instantiation' }
BrProgressIntegerValueStencil >> create [
	<return: #String>
	^ self value asInteger asString
]
