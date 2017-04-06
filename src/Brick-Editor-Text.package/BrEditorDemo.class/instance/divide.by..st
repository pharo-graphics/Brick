as yet unclassified
divide: aNumerator by: aDenominator
  "Divide a given numerator by provided denominator
  and return the result as a fraction of two numbers"

  aDenominator isZero
	ifTrue: [ ^ ZeroDivide dividend: aNumerator ].
	
  ^ aNumerator / aDenominator