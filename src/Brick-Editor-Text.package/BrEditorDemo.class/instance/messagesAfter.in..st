as yet unclassified
messagesAfter: aDate in: aFile
  "Return a number of recieved messages per sender after a given date.
	
  By default messages are queried from the following file:
  file:///users/syrel/Desktop/Demo/messages.csv "
	
  | folder allMessages latestMessages groupedMessages |
	
  folder := aFile parent.

  allMessages := self messagesIn: folder.
  "select messages after date"
  latestMessages := allMessages select: [ :each | each date > aDate ].
  "group them"
  groupedMessages := latestMessages groupedBy: [ :each | each sender ].

  ^ groupedMessages collect: [ :each | each size ]