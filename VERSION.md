# Version list of the project
---
###Latest version v0.3:
	- Login with Captcha approval.
	- Account screen for change password, key and sign out.
	- User login is postponed 30 min; after 3 wrong login attempt.
	- User account is locked; after 5 wrong login attempt.
	- User password can not known. Password Salt and Hast hold in DB.
	- User can change password. (min 8 chac.)
	- User can change message key. (generating new key)
--
###Latest version v0.2:
	- Messages are encrypting with AES 256 bit key.
	- User can only see his/her own messages, others are encrypted.
	- Man-in-the-Middle see for all Cipher Message.
	- Man-in-the-Middle does not have key to see plain format.
--
###Version v0.1:
	- User can login
	- User can message other users
	- User see only own messages
	- User message is in a place(incoming, outgoing)