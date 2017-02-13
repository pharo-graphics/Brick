initialization
defaultScrollAction
	^ BlInfinitePostAction on: [
			self scrollingElement
				scrollBy: self scrollingDelta;
				"reschedule scroll"
				postOnAnimation: self scrollingAction ]