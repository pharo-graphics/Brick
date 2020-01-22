"
I convert what ever ${method:BrProgressModel>>#amount|label=#selector}$ and ${method:BrProgressModel>>#total|label=#selector}$ values to a ${class:String}$.

${example:BrProgressExamples>>#asIsValues|codeExpanded=false|previewExpanded=true|previewHeight=180}$

It might be sometimes inconvenient, depending on the nature of progress values.

"
Class {
	#name : #BrProgressAsIsValueStencil,
	#superclass : #BrProgressValueStencil,
	#category : #'Brick-Progress - Model'
}

{ #category : #'api - instantiation' }
BrProgressAsIsValueStencil >> create [
	<return: #String>
	^ self value asString
]
