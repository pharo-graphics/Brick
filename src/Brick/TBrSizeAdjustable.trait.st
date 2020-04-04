Trait {
	#name : #TBrSizeAdjustable,
	#category : #'Brick-! Core - Support'
}

{ #category : #'api - size adjustable' }
TBrSizeAdjustable >> beHuge [
	self dispatchEvent: (BrSizeAdjustmentWish beHuge)
]

{ #category : #'api - size adjustable' }
TBrSizeAdjustable >> beLarge [
	self dispatchEvent: (BrSizeAdjustmentWish beLarge)
]

{ #category : #'api - size adjustable' }
TBrSizeAdjustable >> beMini [
	self dispatchEvent: (BrSizeAdjustmentWish beMini)
]

{ #category : #'api - size adjustable' }
TBrSizeAdjustable >> beNormal [
	self dispatchEvent: (BrSizeAdjustmentWish beDefault)
]

{ #category : #'api - size adjustable' }
TBrSizeAdjustable >> beSmall [
	self dispatchEvent: (BrSizeAdjustmentWish beSmall)
]

{ #category : #'api - size adjustable' }
TBrSizeAdjustable >> beTiny [
	self dispatchEvent: (BrSizeAdjustmentWish beTiny)
]
