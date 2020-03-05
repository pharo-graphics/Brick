"
I a ${class:BrProgress}$ view model. I keep information about a progress status.
In the following example, I know that ${example:BrProgressExamples>>#barOnly|label=#amount}$ out of ${example:BrProgressExamples>>#barOnly|label=#total}$ is finished:
${example:BrProgressExamples>>#barOnly|codeExpanded=false|previewExpanded=true|previewHeight=180}$


The progress status can be set using
- ${method:BrProgressModel>>#amount:total:}$,
- ${method:BrProgressModel>>#percentage:}$, a value between 0 and 100, or
- ${method:BrProgressModel>>#fraction:}$, a value between 0.0 and 1.0.

${class:BrProgress}$ has same methods to easily update the progress status.
I inform about progress changes using ${class:BrProgressChangedEvent}$.
The information can be requested using ${class:BrProgressStatusRequest}$.

See ${class:BrProgress}$ for examples.
See also ${class:BrProgressWithLabelModel}$ that also handles progress description.

"
Class {
	#name : #BrProgressModel,
	#superclass : #BrWidgetModel,
	#instVars : [
		'amount',
		'total'
	],
	#category : #'Brick-Progress - Model'
}

{ #category : #accessing }
BrProgressModel >> amount [
	<return: #Number>
	^ amount
]

{ #category : #accessing }
BrProgressModel >> amount: anAmountNumber total: aTotalNumber [
	self
		assert: [ anAmountNumber notNil and: [ aTotalNumber notNil ] ]
		description: [ 'Progress amount and total numbers must be non-nil' ].
	self
		assert: [ anAmountNumber >= 0 and: [ anAmountNumber <= aTotalNumber ] ]
		description: [ 'Progress amount must be pozitive number less or equal to total number' ].

	amount := anAmountNumber.
	total := aTotalNumber.
	self onProgressChanged: anAmountNumber total: aTotalNumber.
]

{ #category : #accessing }
BrProgressModel >> fraction [
	^ self amount / self total
]

{ #category : #accessing }
BrProgressModel >> fraction: aNumber [
	self 
		assert: [ aNumber notNil ]
		description: [ 'Progress fraction must be non-nil' ].
	self 
		assert: [ aNumber >= 0 and: [ aNumber <= 1 ] ]
		description: [ 'Progress fraction number must be between 0 and 1' ].
	self amount: aNumber * 100 total: 100
]

{ #category : #initialization }
BrProgressModel >> initialize [
	super initialize.
	amount := 0.
	total := 100.
]

{ #category : #hooks }
BrProgressModel >> initializeListeners [
	super initializeListeners.

	self 
		when: BrProgressStatusRequest 
		reply: [ BrProgressChangedEvent amount: self amount total: self total ]
]

{ #category : #notifying }
BrProgressModel >> notifyProgressChanged: anAmountNumber total: aTotalNumber [
	self dispatchEvent: (BrProgressChangedEvent amount: anAmountNumber total: aTotalNumber)
]

{ #category : #hooks }
BrProgressModel >> onProgressChanged: anAmountNumber total: aTotalNumber [
	self notifyProgressChanged: anAmountNumber total: aTotalNumber.
]

{ #category : #accessing }
BrProgressModel >> percentage [
	^ self amount / self total * 100
]

{ #category : #accessing }
BrProgressModel >> percentage: aNumber [
	self amount: aNumber total: 100
]

{ #category : #accessing }
BrProgressModel >> total [
	<return: #Number>
	^ total
]
