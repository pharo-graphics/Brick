"
I extend ${class:BrProgressModel}$ with a progress label information:

${example:BrProgressExamples>>#barAndTextAbove|codeExpanded=false|previewExpanded=true|previewHeight=180}$

When a progress status is changed, I compute new description value and notify about the label change using a ${class:BrLabelModel}$ object (which I keep as an instance variable).

!! Label Format

I use a ${class:BrProgressLabelStencil}$ object to define a label content. Different label contents can be set using the ${method:BrProgressWithLabelModel>>#labelStencil:|label=#selector}$ method. There are convenience methods to simplify the configuration: 

- ${method:BrProgressWithLabelModel>>#fixedLabel:|label=#selector}$ to set a fixed progress description that does not change on progress status changes, see ${class:BrProgressFixedLabelStencil}$,
- ${method:BrProgressWithLabelModel>>#patternLabel:|label=#selector}$ that defines a description pattern, see ${class:BrProgressExactProgressLabelStencil}$. 

!! Amount and Total Value Format

Individual ${method:BrProgressModel>>#amount|label=#selector}$ and ${method:BrProgressModel>>#total|label=#selector}$ values can be transformed to text (string) using ${class:BrProgressValueStencil}$. Different number-to-string strategies can be set using the ${method:BrProgressWithLabelModel>>#valueStencil:|label=#selector}$ method. There are convenience methods to simplify the configuration: 

- ${method:BrProgressWithLabelModel>>#integerLabelValues|label=#selector}$, converting to ${class:Integer}$,
- ${method:BrProgressWithLabelModel>>#floatLabelValues|label=#selector}$, converting to ${class:Float}$,
- ${method:BrProgressWithLabelModel>>#floatLabelValuesWithDecimals:|label=#selector}$, converting to ${class:Float}$ with given number of decimals,
- ${method:BrProgressWithLabelModel>>#fileSizeLabelValues|label=#selector}$, converting to human readable file size values, e.g., 300 bytes, 10 MB.

"
Class {
	#name : #BrProgressWithLabelModel,
	#superclass : #BrProgressModel,
	#instVars : [
		'labelModel',
		'labelStencil',
		'valueStencil'
	],
	#category : #'Brick-Progress - Model'
}

{ #category : #accessing }
BrProgressWithLabelModel >> amountString [
	<return: #String>
	^ self valueStencil 
		value: self amount;
		create
]

{ #category : #'accessing - label value format' }
BrProgressWithLabelModel >> asIsValues [
	self valueStencil: BrProgressAsIsValueStencil new.
	self updateLabel.
]

{ #category : #initialization }
BrProgressWithLabelModel >> defaultLabelStencil [
	^ BrProgressFixedLabelStencil new
]

{ #category : #initialization }
BrProgressWithLabelModel >> defaultValueStencil [
	^ BrProgressAsIsValueStencil new
]

{ #category : #'accessing - label value format' }
BrProgressWithLabelModel >> fileSizeLabelValues [
	self valueStencil: BrProgressFileSizeValueStencil new.
	self updateLabel.
]

{ #category : #'accessing - label format' }
BrProgressWithLabelModel >> fixedLabel: aString [
	"Set fixed progress label"
	labelStencil := BrProgressFixedLabelStencil new label: aString.
	self updateLabel.
]

{ #category : #'accessing - label value format' }
BrProgressWithLabelModel >> floatLabelValues [
	self valueStencil: BrProgressFloatValueStencil new.
	self updateLabel.
]

{ #category : #'accessing - label value format' }
BrProgressWithLabelModel >> floatLabelValuesWithDecimals: aNumberOfDecimals [
	self valueStencil: (BrProgressFloatValueStencil new numberOfDecimals: aNumberOfDecimals).
	self updateLabel.
]

{ #category : #initialization }
BrProgressWithLabelModel >> initialize [
	super initialize.
	labelModel := BrLabelModel new.
	self add: labelModel.
	self valueStencil: self defaultValueStencil.
	self labelStencil: self defaultLabelStencil.
]

{ #category : #'accessing - label value format' }
BrProgressWithLabelModel >> integerLabelValues [
	self valueStencil: BrProgressIntegerValueStencil new.
	self updateLabel.
]

{ #category : #accessing }
BrProgressWithLabelModel >> label [
	<return: #BlRopedText>
	^ labelStencil 
		amount: self amountString; 
		total: self totalString;
		create
]

{ #category : #accessing }
BrProgressWithLabelModel >> labelStencil [
	<return: #BrProgressLabelStencil>
	^ labelStencil
]

{ #category : #accessing }
BrProgressWithLabelModel >> labelStencil: aBrProgressLabelStencil [
	labelStencil := aBrProgressLabelStencil.
	self updateLabel.
]

{ #category : #hooks }
BrProgressWithLabelModel >> onProgressChanged: anAmountNumber total: aTotalNumber [
	super onProgressChanged: anAmountNumber total: aTotalNumber.
	self updateLabel.
]

{ #category : #'accessing - label format' }
BrProgressWithLabelModel >> patternLabel: aString [
	"The input string can include two place holders called {1} and {2},
	where {1} is transfered amount, and {2} is total to transfer.
	Example: 'Out of {2}%, {1}% transfered...'"
	labelStencil := BrProgressExactProgressLabelStencil new pattern: aString.
	self updateLabel.
]

{ #category : #accessing }
BrProgressWithLabelModel >> totalString [
	<return: #String>
	^ self valueStencil 
		value: self total;
		create
]

{ #category : #updating }
BrProgressWithLabelModel >> updateLabel [
	labelModel text: self label
]

{ #category : #accessing }
BrProgressWithLabelModel >> valueStencil [
	<return: #BrProgressValueStencil>
	^ valueStencil
]

{ #category : #accessing }
BrProgressWithLabelModel >> valueStencil: anObject [
	valueStencil := anObject
]
