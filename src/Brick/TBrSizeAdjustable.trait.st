Trait {
	#name : #TBrSizeAdjustable,
	#category : #'Brick-! Core - Size Adjustment'
}

{ #category : #'api - size adjustable' }
TBrSizeAdjustable >> beDefault [
	self deprecated: 'Use #beNormalSize instead.' transformWith: '`@receiver beDefault' -> '`@receiver beNormalSize'.
	self beNormalSize
]

{ #category : #'api - size adjustable' }
TBrSizeAdjustable >> beHuge [
	self deprecated: 'Use #beHugeSize instead.' transformWith: '`@receiver beHuge' -> '`@receiver beHugeSize'.
	self beHugeSize
]

{ #category : #'api - size adjustable' }
TBrSizeAdjustable >> beHugeSize [
	self beSize: BrSizeAdjustmentState huge
]

{ #category : #'api - size adjustable' }
TBrSizeAdjustable >> beLarge [
	self deprecated: 'Use #beLargeSize instead.' transformWith: '`@receiver beLarge' -> '`@receiver beLargeSize'.
	self beLargeSize
]

{ #category : #'api - size adjustable' }
TBrSizeAdjustable >> beLargeSize [
	self beSize: BrSizeAdjustmentState large
]

{ #category : #'api - size adjustable' }
TBrSizeAdjustable >> beMini [
	self deprecated: 'Use #beMiniSize instead.' transformWith: '`@receiver beMini' -> '`@receiver beMiniSize'.
	self beMiniSize
]

{ #category : #'api - size adjustable' }
TBrSizeAdjustable >> beMiniSize [
	self beSize: BrSizeAdjustmentState mini
]

{ #category : #'api - size adjustable' }
TBrSizeAdjustable >> beNoneSize [
	self beSize: BrSizeAdjustmentState none
]

{ #category : #'api - size adjustable' }
TBrSizeAdjustable >> beNormal [
	self deprecated: 'Use #beNormalSize instead.' transformWith: '`@receiver beNormal' -> '`@receiver beNormalSize'.
	self beNormalSize
]

{ #category : #'api - size adjustable' }
TBrSizeAdjustable >> beNormalSize [
	self beSize: BrSizeAdjustmentState normal
]

{ #category : #'api - size adjustable' }
TBrSizeAdjustable >> beSize: aBrSizeAdjustmentState [
	aBrSizeAdjustmentState isNone
		ifTrue: [ self states removeState: aBrSizeAdjustmentState ]
		ifFalse: [ self states addState: aBrSizeAdjustmentState ]
]

{ #category : #'api - size adjustable' }
TBrSizeAdjustable >> beSmall [
	self deprecated: 'Use #beSmallSize instead.' transformWith: '`@receiver beSmall' -> '`@receiver beSmallSize'.
	self beSmallSize
]

{ #category : #'api - size adjustable' }
TBrSizeAdjustable >> beSmallSize [
	self beSize: BrSizeAdjustmentState small
]

{ #category : #'api - size adjustable' }
TBrSizeAdjustable >> beTiny [
	self deprecated: 'Use #beTinySize instead.' transformWith: '`@receiver beTiny' -> '`@receiver beTinySize'.
	self beTinySize
]

{ #category : #'api - size adjustable' }
TBrSizeAdjustable >> beTinySize [
	self beSize: BrSizeAdjustmentState tiny
]
