#Video Stream Web Application

This project contains only POC for streaming web application

# Work Flow
```
----------
| Server | Contains video files (format to be decided)
---------- Application will send video file in chunks
  ||
  ||
  ||
----------
| Client | Will download the file recieved in chunks
---------- Display the video recieved till now in browser/vlc

To be decided things
* Chunk size and rate of transfer
* Directly play file or start local http server for reliable streaming
  (will add client side complications)
* How to handle live streaming ?
```
