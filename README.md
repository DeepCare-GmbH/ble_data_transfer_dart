# Bluetooth data transfer

Enable transfer of large binary data via BLE.

## Transfer

### Sender 

* Select file
* Calc size and MD5 hash and store in DB?
+ Split file according to MTU between sender and receiver.
* Send name, number of parts and hash (PB)

### Receiver

* Store file details in DB
* Call request for each part. How set needed part? As PB. Chunk number + fill with bytes.
* After getting all parts write to file and calc hash.


## Libs

* [Crypto](https://pub.dev/packages/crypto)
* [SQLite](https://pub.dev/packages/floor)
* [Files](https://docs.flutter.dev/cookbook/persistence/reading-writing-files)
* [Protobuf](https://developers.google.com/protocol-buffers/docs/darttutorial)

## TODO

* Bundle as dart library
* Simple test app including lib as sender and receiver
* Unit tests
 