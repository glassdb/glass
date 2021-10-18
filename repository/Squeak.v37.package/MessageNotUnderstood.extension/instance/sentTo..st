*squeak
sentTo: aRcvr
  "answer the result of sending this message to aRcvr "

  ^ aRcvr perform: selector withArguments: self arguments