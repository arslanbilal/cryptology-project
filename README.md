# Cryptology Project
<hr>
<p align="center">
	<img src="https://raw.githubusercontent.com/arslanbilal/cryptology-project/master/Source/appIcon.png" height="225" width="225">
</p>
<h3>This repo includes "Cryptology Course" project(Encrypted Messaging App in iOS 8.0+)</h3>
<hr>
## Summary:
Simple iOS messaging application and working in locale [database][realm]. Messages are protected with AES Symmetric Encryption. Only messages owners can see their messages in the plain text format. Otherwise messages are encrypted. Man-in-the-Middle never see plain text. You can run in your own machine. You just uncomment the `genenaretUsersWithCount(Int)` method in AppDelegate.swift file for adding random user in the system. Then recomment the same line. To test: 

1. username: user# (no is depends on count that you assign the func.)
2. password: 1234

## Requirement:
- iOS 8.0+
- Swift version 2.2 (swiftlang-703.0.18.1 clang-703.0.29)
- Xcode 7.3+

## Architecture
There are 4 classes that represent 4 tables in the Realm database.

- User: (*(int)* **id**, *(string)* **name**, *(string)* **lastname**, *(string)* **username**, *(string)* **password**)
- Message: (*(int)* **id**, *(string)* **text**, *(Date)* **date**)
- Key: (*(int)* **id**, *(string)* key)
- Chat: (*(Message)* **message**, *(User)* **fromUser**, *(User)* **toUser**, *(Key)* **key**)

User, Message adn Key are have a relation with Chat. Table(Class) Relations:

- Chat - Message: one-to-one
- Chat - User: many-to-many
- Chat - Key: one to many

## Technologies/Libraries/Frameworks that used:
**Frameworks:**

- [Realm][realm] database is used for backend.

**Dependencies/Libraries**

- [PureLayout][purelayout] for UI Autolayout
- [FBEncryptor][fbencryptor] for Encrypt/Decrypt messages with chat specific key


## Latest version: v0.2:
##### Last [version][release] of the app. For more version detail, check "versions.MD" version log file.
	- users can login
	- users can message other users
	- users see only own messages
	- users message is in a place(incoming, outgoing)
	- messages are encrypting with AES 256 bit key.
	- users can only see his/her own messages, others are encrypted.
	- Man-in-the-Middle see for all Cipher Message.
	- Man-in-the-Middle does not have key to see plain format.

## How does it look like?
##### v0.2
![Gif](https://github.com/arslanbilal/cryptology-project/raw/master/Source/application.gif)

Gif lasts about 30 seconds.

## Test Vector of Encryption Library(FBEncryptor)
<img src="https://raw.githubusercontent.com/arslanbilal/cryptology-project/master/Source/testVector.png">
#### Output
<img src="https://raw.githubusercontent.com/arslanbilal/cryptology-project/master/Source/output.png">
	
## Credits
- [Bilal Arslan][arslanbilal]: Architecture, Concept, Code and UI Design

## License
`cryptology-project` is released under an [MIT License][mitLink]. See `LICENSE` for details.
>**Copyright &copy; 2016-Present Bilal Arslan.**<br>
*Please be free to contribute, it is greatly appreciated.*

[mitLink]:http://opensource.org/licenses/MIT
[realm]:https://realm.io
[purelayout]:https://github.com/PureLayout/PureLayout
[fbencryptor]:https://github.com/dev5tec/FBEncryptor
[versionmd]:https://github.com/arslanbilal/cryptology-project/blob/master/VERSIONS.md
[arslanbilal]:https://github.com/arslanbilal
[release]:https://github.com/arslanbilal/cryptology-project/releases