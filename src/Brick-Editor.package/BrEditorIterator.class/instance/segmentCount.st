accessing
segmentCount
	"Return amount of segments available.
	As soon as I remove or cache more segment I notify Editor about that and it performs an update
	and synchronisation with UI asking me for segment count one more time. That is why it is enough
	to always return amount of currently cached segments"
	<return: #Number>

	^ collector segments size