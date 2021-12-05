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
* Call request for each part. How set needed part? As PB. Hash (16bit) + chunk number (32bit) + fill with bytes.
* After getting all parts write to file and calc hash.

## Libs

* [Crypto](https://pub.dev/packages/crypto)
* [SQLite](https://pub.dev/packages/floor)
* [Files](https://docs.flutter.dev/cookbook/persistence/reading-writing-files)
* [Protobuf](https://developers.google.com/protocol-buffers/docs/darttutorial)

## Messages

### Data

MTU 185

Hash:           16bit      
Chunk number:   32bit

| Content      | Bytes | Description   |
|--------------|-------|---------------|
| Hash         |     2 | Shortend hash |
| Chunk number |     4 |               |
| Data         |   179 |               |

### Request

Hash:           16bit      
Chunk number:   32bit


## Data flow

* Sender sends file details to receiver
* Receiver calls data transfer

If aborted receiver send hash and chunk number to set sender to correct part of the file. Then calls data transfer normal.

## TODO

* Bundle as dart library
* Simple test app including lib as sender and receiver
* Unit tests
* Security
 