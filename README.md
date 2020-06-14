# Windows-Decrypt-HARFile
Simple PowerShell script to decrypt a HAR file and retrieve a SAML assertion from it.
Best to be used with HAR file generated following these [steps](https://www.mathworks.com/matlabcentral/answers/506015).

## End-of-Life June 2020
This powershell script has reached its end of life. The concept has now been implemented in a MATLAB Web App.
At this time, the repository has been archived, and is read-only.

## Getting Started

Please read through the steps below before running the PowerShell script.

The output might be different depending on the browser and the authentification used to generate the HAR file. This script might not work depending on these conditions.

### Why to use this script?

At MathWorks we sometimes face some issues that requires a SAML assertion from customers.
As we do not have any tools that a customer could use to retrieve a SAML assertion, we decided to write down this [article](https://www.mathworks.com/matlabcentral/answers/506015) and to retrieve customers' SAML assertions via a HAR file.
By this way, our customers do not need to install thrid party apps.
This powershell script is to be used to retrieve the SAML assertion from the HAR file.

### What does this script do?

The script will parse the HAR file to find the SAMLResponse.
This SAMLResponse will then be decrypted using Base64.

The script will generate a decrypted XML file on your desktop. 

### Prerequisites

Generate a HAR file while reproducing the issue you want to troubleshoot.
Some basic understanding of what you are trying to achieve.

### Usage

1. Download the git at the desired location

```
git clone "https://github.com/goodshort/Windows-Decrypt-HARFile.git"
```

2. Run the Script
   - From a Command Prompt

   ```
   cd Windows-Decrypt-HARFile
   powershell.exe .\Decrypt-HARFile.ps1 <path-to-HAR-file>
   ```

   - From your Windows File Explorer
      - Browse to the script location via your File Explorer
     - Right click on `Decrypt-HARFile.ps1` > `Run with PowerShell`
     - You will be prompted to select the HAR file you wish to decrypt
   

3. The XML output will be saved on your Desktop

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details
