# phishing-cybersecurity-project

## ⚠️This project is for educational purposes only. Do not use the code for malicious activities⚠️

## Authors: Rocco Carpi, Riccardo Rossi

This repository contains the final project for the **CyberSecurity and Data Protection** course taught by **Prof. Federica Paci** at the **University of Verona**.

## Project Overview

The goal of this project is to demonstrate a simulated phishing attack by creating a malicious Word document. This document contains a **VBA macro** designed to install an **information stealer** that extracts files containing sensitive information from a victim's machine.

### Key Functionalities

1. **Macro Functionality**:

   * The macro connects to **Dropbox** to download an image.
   * The image contains an encoded **IP address** of the Command-and-Control (C2) server.
   * The macro decodes the IP address, downloads the **information stealer** from the C2 server, and launches it.
2. **Information Stealer**:

   * Extracts files with sensitive information from the victim's machine.
   * Sends the stolen files to the C2 server.
3. **Code Obfuscation**:

   * The VBA macro code is obfuscated to evade detection by anti-malware solutions.

### ⚠️ Disclaimer ⚠️

This project is strictly for educational purposes. It is designed to study the mechanisms of phishing attacks and how to defend against them. **Do not use this code for malicious purposes.** The author and contributors are not responsible for any misuse of the project.

## Repository Structure

The repository structure is organized into three versions of the project. **Version 3.0** is the primary and current version of the project. It is recommended not to work on the earlier versions (Version 1.0 and Version 2.0) as they may contain obsolete or less-secure code.

# File Descriptions — Version 3.0

## c2_sever_2.0.py

This script configures a Command-and-Control (C2) server using the Flask framework. The server is designed to receive files stolen by compromised clients. It runs on port 5000 and provides endpoints to receive and save files sent by clients.

### Main features:

* Flask server configuration.
* Endpoint to receive files via POST requests.
* Saving received files to a specified directory.

## information_stealer_2.0.py

This script is an information stealer that collects files from a specified directory on the victim's system and sends them to the configured C2 server. It uses HTTP requests to transfer the stolen files to the server.

### Main features:

* Scans a specified directory for files to exfiltrate.
* Sends discovered files to the C2 server via POST requests.
* Handles network errors and retries in case of failure.

## stegano_image.py

This script uses steganography techniques to encode the C2 server IP address into an image. It can also decode the IP address from the image, allowing the client to retrieve the C2 server address covertly.

### Main features:

* Encoding the C2 server IP address into an image using the PIL library.
* Decoding the IP address from the image.
* Support for various image formats.

## macro_vba.bas

This file contains a VBA (Visual Basic for Applications) macro intended to run in a Microsoft Office document. The macro automates the process of retrieving the image containing the C2 server IP address, decoding the IP address, downloading the information_stealer script, and executing it.

### Main features:

* Retrieval of an image from a specified URL.
* Decoding the C2 server IP address from the image.
* Downloading the information_stealer_2.0.py script.
* Executing the downloaded script.

## Notes

* Ensure all required dependencies are installed, such as Flask and steganography-related libraries.
* Modify IP addresses and file paths as needed for your environment.
* This project is for educational purposes only. Do not use the code for malicious activities.
