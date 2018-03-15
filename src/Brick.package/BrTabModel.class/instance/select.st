api - tab
select
	self isSelected
		ifTrue: [ ^ self ].

	selected := true.
	self notifyTabSelected