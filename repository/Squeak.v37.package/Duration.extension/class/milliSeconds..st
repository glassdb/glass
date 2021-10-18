*squeak
milliSeconds: millis
	
	^self 
		days: 0 
		hours: 0 
		minutes: 0 
		seconds: millis // 1000 
		nanoSeconds: millis \\ 1000 * 1000 * 1000.