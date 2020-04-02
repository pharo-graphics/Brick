Trait {
	#name : #TBrSizeAdjustable,
	#category : #'Brick-! Core - Support'
}

{ #category : #'api - configuration' }
TBrSizeAdjustable >> beHuge [
	self dispatchEvent: (BrSizeAdjustmentWish beHuge)
]

{ #category : #'api - configuration' }
TBrSizeAdjustable >> beLarge [
	self dispatchEvent: (BrSizeAdjustmentWish beLarge)
]

{ #category : #'api - configuration' }
TBrSizeAdjustable >> beMini [
	self dispatchEvent: (BrSizeAdjustmentWish beMini)
]

{ #category : #'api - configuration' }
TBrSizeAdjustable >> beNormal [
	self dispatchEvent: (BrSizeAdjustmentWish beDefault)
]

{ #category : #'api - configuration' }
TBrSizeAdjustable >> beSmall [
	self dispatchEvent: (BrSizeAdjustmentWish beSmall)
]

{ #category : #'api - configuration' }
TBrSizeAdjustable >> beTiny [
	self dispatchEvent: (BrSizeAdjustmentWish beTiny)
]
