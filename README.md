# FastBackup
This script performs a quick and compressed backup of a given source directory using the tar utility with bzip2 compression (.tar.bz2).

## ✅ Features

- Compresses the source directory into a `.tar.bz2` archive.
- Automatically names the backup file using the current date and time.
- Logs the backup operation into `backup.log`.
- Verifies paths and creates the destination directory if it doesn't exist.



## 🔧 Requirements

- `bash`
- `tar`
- `bzip2` (usually included with `tar`)



## 📦 Usage

```bash
./backup.sh /path/source /path/destination
