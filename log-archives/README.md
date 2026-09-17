# Log Archive

A Bash-based log archiving utility that compresses log files into a timestamped `.tar.gz` archive and stores the archive in a separate directory.

## Features

- Accepts a log directory as a command-line argument
- Creates a compressed `.tar.gz` archive using `tar`
- Stores archives in a separate directory
- Generates a timestamped archive filename
- Records the date and time of each archive operation
- Provides a simple command-line interface

## Usage

Run the script by providing the directory containing the logs:

```bash
./log-archive /var/log

Example:

./log-archive /var/log

The script will create an Archive similar to:

logs_archive_20260911_001300.tar.gz

Achive Location 

log-archives/
├── logs_archive_20260911_001300.tar.gz
└── archive.log

Achive Log

Example:
The archive.log file records when an archive was created and the name of the resulting archive.
- Created ./log-archives/logs_archive_20260911_001300.tar.gz

Requirements

Linux or WSL
Bash
tar
Technologies Used
Bash scripting
Linux command-line utilities
tar
gzip
date

Project Purpose

This project was created to practice Linux system administration and Bash scripting concepts, including:

Command-line arguments
Conditional statements
Variables
File and directory management
Log management
Archive creation
Timestamp generation
Basic automation

Author

Samthlen

## reference

https://roadmap.sh/projects/log-archive-tool

