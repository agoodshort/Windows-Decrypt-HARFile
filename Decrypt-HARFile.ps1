param($p1)
function Format-Xml {
<#
.SYNOPSIS
Format the incoming object as the text of an XML document.
#>
    param(
        ## Text of an XML document.
        [Parameter(ValueFromPipeline = $true)]
        [string[]]$Text
    )

    begin {
        $data = New-Object System.Collections.ArrayList
    }
    process {
        [void] $data.Add($Text -join "`n")
    }
    end {
        $doc=New-Object System.Xml.XmlDataDocument
        $doc.LoadXml($data -join "`n")
        $sw=New-Object System.Io.Stringwriter
        $writer=New-Object System.Xml.XmlTextWriter($sw)
        $writer.Formatting = [System.Xml.Formatting]::Indented
        $doc.WriteContentTo($writer)
        $sw.ToString()
    }
}

if (!$p1) {
Add-Type -AssemblyName System.Windows.Forms

$FileBrowser = New-Object System.Windows.Forms.OpenFileDialog -Property @{ 
    InitialDirectory = [Environment]::GetFolderPath('Desktop') 
    Filter = 'har file (*.har)|*.har|All files (*.*)|*.*'    
}

$null = $FileBrowser.ShowDialog()

$p1 = $FileBrowser.FileName
}

$harFileConverted = Get-Content "$p1" | Out-String | ConvertFrom-Json

$htmlEncoded = $harFileConverted.log.entries.request.postData.params | where {$_.name -eq "SAMLResponse"}

if (!$htmlEncoded) {
$htmlEncodedToSplit = $harFileConverted.log.entries.request.postData.text
$nul,$htmlEncoded = $htmlEncodedToSplit.split("SAMLResponse=")
echo $htmlEncoded
}

<#
$htmlDecoded = [System.Web.HttpUtility]::UrlDecode($HtmlEncoded.value)

<# For some reason HAR file cannot be used with URL decode. Need to decode using this page: https://www.opinionatedgeek.com/Codecs/UrlDecoder #>

$samlAssertion = [System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String("$htmlDecoded"))
<# 
$samlAssertionDecrypted = Format-Xml $samlAssertion
#>

echo ""
echo "SAML assertion decrypted: "
echo ""
echo $samlAssertionDecrypted

$DesktopPath = [Environment]::GetFolderPath("Desktop")

$samlAssertionDecrypted > $DesktopPath\HAR_Decrypted.xml
#>