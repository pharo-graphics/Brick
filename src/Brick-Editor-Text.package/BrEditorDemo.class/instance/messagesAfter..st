as yet unclassified
messagesAfter: aDate
  "Return a number of recieved messages per sender after a given date.
	
  By default messages are queried from the following file:
  file:///users/syrel/Desktop/Demo/messages.csv "
	
  | allMessages latestMessages groupedMessages |

  allMessages := self messages.
  "select messages after date"
  latestMessages := allMessages select: [ :each | each date > aDate ].
  "group them"
  groupedMessages := latestMessages groupedBy: [ :each | each sender ].

  ^ groupedMessages collect: [ :each | each size ]