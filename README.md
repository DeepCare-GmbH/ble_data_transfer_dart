# Bluetooth data transfer

Enable transfer of large binary data via BLE.

## Transfer

### Sender 

* Select file
* Calc size and MD5 hash and store in DB?
+ Split file according to MTU between sender and receiver.
* Send name, number of parts, hash and target via PB

### Receiver

* Store file details in DB
* Call request for each part. How set needed part? As PB. Hash (16bit) + chunk number (32bit) + fill with bytes.
* After getting all parts write to file and calc hash.

## Libs

* [Crypto](https://pub.dev/packages/crypto)
* [SQLite](https://pub.dev/packages/floor)
* [Files](https://docs.flutter.dev/cookbook/persistence/reading-writing-files)
* [Protobuf](https://developers.google.com/protocol-buffers/docs/darttutorial)

## Links

[Packaging](https://dart.dev/guides/libraries/create-library-packages)

## Messages

### Start Transfer Request

Always send by Master, used for both directions.

| Content      | Bytes | Description                           |
|--------------|-------|---------------------------------------|
| Filename     |     x | String array variable length. 100 max |
| Hash         |     8 | Shortend hash                         |
| Chunks       |     4 |                                       |
| Target       |     1 | Enum with target/type                 |
| Direction    |     1 | Master --> Slave / Slave --> Master   |

Target Enum:
* Docker image
* User background image
* Data
* Ansible script
* Bash script

### Start Transfer Repley

Always send by Slave on a start transfer request.

| Content      | Bytes | Description                           |
|--------------|-------|---------------------------------------|
| Hash         |     8 | Shortend hash                         |
| Filename     |     x | String array variable length. 100 max |
| Chunks       |     4 |                                       |
| Target       |     1 | Enum with target/type                 |
| Status       |     1 | Enum with status                      |

Enum:
* Ready
* Continue old transfer
* HDD full
* Auth failed
* Error

### Data

MTU 185

Hash:           16bit      
Chunk number:   32bit

| Content      | Bytes | Description   |
|--------------|-------|---------------|
| Hash         |     2 | Shortend hash |
| Chunk number |     4 |               |
| Data         |   179 |               |

### Continue

| Content      | Bytes | Description   |
|--------------|-------|---------------|
| Hash         |     8 | Shortend hash |
| Chunk number |     4 |               |
| Enum         |     1 |               |


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
 