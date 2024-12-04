# Process Killer

A simple utility written in Nim that allows you to terminate processes by name using the Windows API.

## Description

This project is a Nim program that allows you to terminate a specific process running on your Windows system by providing the process name. It uses the Windows Tool Help API to retrieve a list of running processes, checks for the specified process, and terminates it if found.

## Features

- Terminate processes by name on Windows.
- Uses Windows Tool Help API for process inspection.
- Easy-to-use function to handle process termination.

## Installation

### Prerequisites

Before you begin, ensure you have the following installed:

- **Nim**: Install Nim from [Nim's official website](https://nim-lang.org/).
- **winim** library: This library is used to interact with Windows APIs. Install it via Nim's package manager:

```bash
nimble install winim
```
