# Cryptology Project
This repo include "Cryptology course" project
---------------------------------------------

##Summary:
Simple iOS messaging application and working in locale [database][realm]. You can run in your own machine. You just uncomment the `genenaretUsersWithCount(Int)` method in AppDelegate.swift file for adding random user in the system. To test: 

1. username: user# (no is depends on count that you assign the func.)
2. password: 1234

#####Technologies/Libraries/Frameworks that used:
- [Realm][realm] database is used for backend.
- [PureLayout][purelayout] for UI


##Architecture
There are 3 classes that represent 3 tables in the Realm database.

- User: (id, name, lastname, username, password)
- Message: (id, text, date)
- Chat: (messageId, fromUserId, toUserId)

User and Message are have a relation with Chat. Table(Class) Relations:

- Chat - Message: one-to-one
- Chat - User: many-to-many


##Requirement:
- iOS 8.0+
- Swift version 2.1.1 (swiftlang-700.1.101.15 clang-700.1.81)
- Xcode 7.2.1+


##Version v0.1:
######Last version of app is showing.

	- users can login
	- users can message other user
	- users see only own messages
	- users message is in a place(incoming, outgoing) 

#####How does it look like?
![Gif](https://github.com/arslanbilal/cryptology-project/raw/master/Source/application.gif)

Gifs lasts about 40-50 seconds.

##Credits
- [Bilal Arslan][arslanbilal]: Concept, Code and UI Design


## License
`cryptology-project` is released under an [MIT License][mitLink]. See `LICENSE` for details.
>**Copyright &copy; 2016-Present Bilal Arslan.**<br>
*Please be free to contribute, it is greatly appreciated.*


[mitLink]:http://opensource.org/licenses/MIT
[realm]:https://realm.io
[purelayout]:https://github.com/PureLayout/PureLayout
[arslanbilal]:https://github.com/arslanbilal