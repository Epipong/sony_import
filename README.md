# sony_import
Import files from Sony Alpha device to a specific target like a SSD

# Usage
iem -s /root/path/to/sdcard -t /path/to/dest/folder

example for WSL
```sh
iem -s /mnt/e -t /mnt/c/users/john/pictures
```

example for MacOS
```sh
iem -s /Volumes -t ~/Pictures
```

example for Android (Termux)
```sh
iem -s /storage/0000-0000 -t ~/storage/pictures
```
