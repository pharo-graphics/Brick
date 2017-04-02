adding
addPiece: aSubText for: aSegmentSubText

	segments ifNotEmpty: [
		lastSegment segment == aSegmentSubText
			ifFalse: [
				lastSegment := segments at: aSegmentSubText.
				lastSegment pieces removeAll ] ].

	lastSegment addPiece: aSubText