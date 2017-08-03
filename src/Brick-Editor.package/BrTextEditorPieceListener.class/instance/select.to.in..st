selection handlers
select: aFromIndex to: aToIndex in: aTextEditElement
	| aGlobalFrom aGlobalTo |
	
	aGlobalFrom := aTextEditElement text start + aFromIndex - 1.
	aGlobalTo := aTextEditElement text start + aToIndex - 1.
	
	self editor mergeSelection: aGlobalFrom to: aGlobalTo