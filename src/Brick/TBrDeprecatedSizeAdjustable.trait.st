Trait {
	#name : #TBrDeprecatedSizeAdjustable,
	#category : #'Brick-! Deprecated'
}

{ #category : #testing }
TBrDeprecatedSizeAdjustable classSide >> isDeprecated [
	^ true
]

{ #category : #'api - size adjustable' }
TBrDeprecatedSizeAdjustable >> beHuge [
	self dispatchEvent: (BrDeprecatedSizeAdjustmentWish beHuge)
]

{ #category : #'api - size adjustable' }
TBrDeprecatedSizeAdjustable >> beLarge [
	self dispatchEvent: (BrDeprecatedSizeAdjustmentWish beLarge)
]

{ #category : #'api - size adjustable' }
TBrDeprecatedSizeAdjustable >> beMini [
	self dispatchEvent: (BrDeprecatedSizeAdjustmentWish beMini)
]

{ #category : #'api - size adjustable' }
TBrDeprecatedSizeAdjustable >> beNormal [
	self dispatchEvent: (BrDeprecatedSizeAdjustmentWish beNormal)
]

{ #category : #'api - size adjustable' }
TBrDeprecatedSizeAdjustable >> beSmall [
	self dispatchEvent: (BrDeprecatedSizeAdjustmentWish beSmall)
]

{ #category : #'api - size adjustable' }
TBrDeprecatedSizeAdjustable >> beTiny [
	self dispatchEvent: (BrDeprecatedSizeAdjustmentWish beTiny)
]
