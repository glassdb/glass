*squeak
days: days hours: hours minutes: minutes seconds: seconds nanoSeconds: nanos

  ^ self 
		days: days 
		hours: hours 
		minutes: minutes 
		seconds: nanos / 1000000000 + seconds.