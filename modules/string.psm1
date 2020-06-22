set-alias upper format-upper
function Format-Upper () {
<#
    .EXAMPLE
        "lorem ipsum" | Format-Upper
#>
  [cmdletbinding()] param([parameter(ValueFromPipeline)] [string]$value)
  Process  {
     $_.ToUpperInvariant()
  }    
}

set-alias lower format-lower
function Format-Lower () {
<#
    .SYNOPSIS
        Really long comment blocks are tedious to keep commented in single-line mode.
    .DESCRIPTION
        Particularly when the comment must be frequently edited,
        as with the help and documentation for a function or script.
    .EXAMPLE
        "LOREM IPSUM" | Format-Lower
#>
  [cmdletbinding()] param([parameter(ValueFromPipeline)] [string]$value)
  Process  {
     $_.ToLowerInvariant()
  }    
}


function ConvertTo-HtmlDecoded () {
<#
    .EXAMPLE
        "&lt;div&gt;lorem ipsum di amet&lt;div&gt;" | ConvertTo-HtmlDecoded
#>
  [cmdletbinding()] param([parameter(ValueFromPipeline)] [string]$value)
  Process  {
     [Underscore]::DecodeHtml( $_)
  }  
}

function ConvertTo-HtmlEncoded () {
<#
    .EXAMPLE
        "<div>lorem ipsum di amet<div>" | ConvertTo-HtmlEncoded
#>
  [cmdletbinding()] param([parameter(ValueFromPipeline)] [string]$value)
  Process  {
      [Underscore]::Escape( $_) 
  }  
}

set-alias atob ConvertTo-Base64
function ConvertTo-Base64 () {
<#
    .EXAMPLE
        echo "lorem" | ConvertTo-B64 
#>
  [cmdletbinding()] param([parameter(ValueFromPipeline)] [string]$value)
  Process  {
      [Underscore]::Base64($value)
  }  
}

set-alias btoa ConvertFrom-Base64
function ConvertFrom-Base64  () {
<#
    .EXAMPLE
        echo "bG9yZW0=" | ConvertFrom-Base64
#>
  [cmdletbinding()] param([parameter(ValueFromPipeline)] [string]$value)
  Process  {
      [Underscore]::FromBase64String($_)
  }
}

set-alias from-unixts ConvertFrom-UnixTimestamp
function ConvertFrom-UnixTimestamp () {
<#
    .EXAMPLE
        echo 1591650935 | ConvertFrom-UnixTimestamp
#>
  [cmdletbinding()] param([parameter(ValueFromPipeline)] [string]$value)
  Process  {
      [Underscore]::Datetime( $_ )
  }
}

set-alias unixts ConvertTo-UnixTimestamp
function ConvertTo-UnixTimestamp () {
<#
    .EXAMPLE
		ConvertTo-UnixTimestamp 
		1592821449
		
        Get-date | ConvertTo-UnixTimestamp
		1592821467
#>
  [cmdletbinding()] param([parameter(ValueFromPipeline)] [DateTime]$value)

  Process  {
	  if($value -eq $null) {
			[Underscore]::UnixTimestamp( $(get-date) )
	  } else {
		[Underscore]::UnixTimestamp( $_ )
	  }
  }
}



function HttpGet () {
<#
    .EXAMPLE
        echo "https://httpbin.org/ip" | HttpGet
#>
  [cmdletbinding()] param([parameter(ValueFromPipeline)] [string]$uri)
  Process  {
      [Underscore]::HttpGetStringAsync( $_).Result
  }
}

function Get-DayNames () {
<#
    .EXAMPLE
        "tr-TR" | Get-DayNames
#>
  [cmdletbinding()] param([parameter(ValueFromPipeline)] [string]$culture)
  Process  {
      [Underscore]::GetDayNames( [cultureinfo]::new($_), 1) 
  }
}

function Get-MonthNames () {
<#
    .EXAMPLE
        "tr-TR" | Get-MonthName
#>
  [cmdletbinding()] param([parameter(ValueFromPipeline)] [string]$culture)
  Process  {
      [Underscore]::GetMonthNames( [cultureinfo]::new($_)) 
  }
}

function Get-LastDayOfMonth () {
<#
    .EXAMPLE
        Get-date | Get-LastDayOfMonth 
#>
  [cmdletbinding()] param([parameter(ValueFromPipeline)] [datetime]$date)
  Process  {
      [Underscore]::LastDayOfMonth( $_)
  }
}

function Get-FirstDayOfMonth () {
<#
    .EXAMPLE
        Get-date | Get-FirstDayOfMonth
#>
  [cmdletbinding()] param([parameter(ValueFromPipeline)] [datetime]$date)
  Process  {
      [Underscore]::FirstDayOfMoth( $_)
  }
}

set-alias md5 get-md5
function Get-MD5 () {
<#
    .EXAMPLE
        "lorem ipsum" | Get-MD5
#>
  [cmdletbinding()] param([parameter(ValueFromPipeline)] [string]$value)
  Process  {
      [Underscore]::Md5( $_) 
  }
}

set-alias sha1 get-sha1
function Get-sha1 () {
<#
    .EXAMPLE
        "lorem ipsum" | Get-sha1
#>
  [cmdletbinding()] param([parameter(ValueFromPipeline)] [string]$value)
  Process  {
      [Underscore]::Sha1( $_) 
  }
}

set-alias sha256 get-sha256
function Get-sha256 () {
<#
    .EXAMPLE
        "lorem ipsum" | Get-sha256
#>
  [cmdletbinding()] param([parameter(ValueFromPipeline)] [string]$value)
  Process  {
      [Underscore]::Sha256( $_) 
  }
}

set-alias sha384 get-sha384
function Get-sha384 () {
<#
    .EXAMPLE
        "lorem ipsum" | Get-Sha384
#>
  [cmdletbinding()] param([parameter(ValueFromPipeline)] [string]$value)
  Process  {
      [Underscore]::Sha384( $_) 
  }
}

set-alias sha512 get-sha512
function Get-Sha512 () {
<#
    .EXAMPLE
        "lorem ipsum" | Get-sha512
#>
  [cmdletbinding()] param([parameter(ValueFromPipeline)] [string]$value)
  Process  {
      [Underscore]::Sha512( $_) 
  }
}

function ConvertTo-ByteArray () {
<#
    .EXAMPLE
        "hello" | ConvertTo-ByteArray
#>
  [cmdletbinding()] param([parameter(ValueFromPipeline)] [string]$value)
  Process  {
      [Underscore]::ToByteArrayUTF8( $_) 
  }
}

function get-markdown () {
<#
    .EXAMPLE
        "https://gist.githubusercontent.com/guneysus/895728a91810b9712d21f7c16486f1e1/raw/markdown.md" | HttpGet | get-markdown
#>
  [cmdletbinding()] param([parameter(ValueFromPipeline)] [string]$content)
  Process  {
      [Underscore]::ParseMarkdown( $_)
  }
}

function Get-RSS () {
<#
    .EXAMPLE
        "https://feedforall.com/sample.xml" | HttpGet | Get-RSS
#>
  [cmdletbinding()] param([parameter(ValueFromPipeline)] [string]$content)
  Process  {
      [Underscore]::ParseRSS( $_)
  }
}

function Split-Words () {
<#
    .EXAMPLE
        "lorem ipsum di amet" | split-words
#>
  [cmdletbinding()] param([parameter(ValueFromPipeline)] [string]$content)
  Process  {
      [Underscore]::Words( $_)
  }
}

Function Get-Tmpfilename () {
<#
    .EXAMPLE
       Get-Tmpfilename
#>
    [Underscore]::GetTempFileName() 
}


function deburr () {
<#
    .EXAMPLE
        "ahmed þeref güneysu" | deburr
#>
  [cmdletbinding()] param([parameter(ValueFromPipeline)] [string]$value)
  Process  {
      [Underscore]::Deburr( $_)
  }
}

function chunk () {
<#
    .EXAMPLE
        generate-key 8 | chunk -size 2
#>
    [cmdletbinding()] param(
        [parameter(ValueFromPipeline)] [string]$value,
        
        [Parameter(Position=0, Mandatory=$true)] 
        [Alias("s")]
        [int] $size
    )
  Process  {
      [System.Linq.Enumerable]::Range(0, $value.Length/$size) | % { $value.SubString($_ * $size, $size) }
  }
}

function ReplaceString () {
<#
    .EXAMPLE
        echo Lorem | Replace-String "m" "n"
#>
    [cmdletbinding()] param(
        [parameter(Position=0, ValueFromPipeline)] [string]$value,
        
        [Parameter(Position=1, Mandatory=$true)] 
        [Alias("f")]
        [string] $from,

        [Parameter(Position=2 )] 
        [Alias("t")]
        [string] $to
    )

  Process  {
      Write-Debug "Value: $value | From: $from | To: $to "

      [Underscore]::Replace( $value, $from, $to)
  }
}

function StripString () {
<#
    .EXAMPLE
        (New-Guid).Guid | upper | strip-string "-"
        Returns: 38468939B82B49FFAE8C5873E2A312A2
#>
    [cmdletbinding()] param(
        [parameter(ValueFromPipeline)] [string]$value,
        
        [Parameter(Position=0, Mandatory=$true)] 
        [Alias("s")]
        [string] $strip
    )
  Process  {
      [Underscore]::Strip( $value, $strip)
  }
}


function Get-FileType () {
    # TODO
    # Get-Content -Parameter ReadCount
}