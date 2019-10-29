# Windows-Decrypt-HARFile
Simple PowerShell script to decrypt a HAR file and get the SAML assertion

## Getting Started

Please read through the steps below before running the PowerShell script.

The output might be different depending on the browser and the authentification used to generate the HAR file. This script might not work depending on these conditions.

### What will happen

The script will parse the HAR file to find the SAMLResponse.
This SAMLResponse will then be decrypted using Base64.
The script will generate a decrypted XML file on your desktop. 

### Prerequisites

Generate a HAR file while reproducing the issue you want to troubleshoot.
Find steps to generate a HAR file on this [page](https://www.qualtrics.com/support/survey-platform/sp-administration/brand-customization-services/sso/generating-a-har-file/).

### Usage

1. Download the git at the desired location

```
git clone "https://github.com/goodshort/Windows-Decrypt-HARFile.git"
```

2. Run the Script
   - From a Command Prompt

   ```
   cd <script-location>
   powershell.exe .\Decrypt-HARFile.ps1 <path-to-HAR-file>
   ```

   - From the GUI
     - Browse to the script location via your File Explorer
     - Right click on "Decrypt-HARFile.ps1" > "Run with PowerShell"
     - You will be prompted to select the HAR file you wish to decrypt
   

3. The XML output will be saved on your Desktop

## Authors

* **Adrien Biencourt** - *Initial work* - [goodshort](https://github.com/goodshort)

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details
