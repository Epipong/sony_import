# sony_import
Import files from a Sony Alpha device to a specific target like a SSD.

The files are sorted by date folder and by extention folder.
i.e.
```sh
.
├── 2023-09-27
│   ├── ARW
│   │   ├── DSC00001.ARW
│   │   └── DSC00002.ARW
│   └── JPG
│       ├── DSC00001.JPG
│       └── DSC00002.JPG
└── 2023-10-17
    ├── ARW
    │   ├── DSC00003.ARW
    │   └── DSC00004.ARW
    ├── JPG
    │   ├── DSC00003.JPG
    │   └── DSC00004.JPG
    └── MP4
        └── C0001.MP4
```

# 📋Requirements
- Install **exiftool**

# 🚀Usage
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
