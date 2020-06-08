function upper () {
<#
    .EXAMPLE
        "lorem ipsum" | upper
#>
  [cmdletbinding()] param([parameter(ValueFromPipeline)] [string]$value)
  Process  {
     $_.ToUpperInvariant()
  }    
}

function lower () {
<#
    .SYNOPSIS
        Really long comment blocks are tedious to keep commented in single-line mode.
    .DESCRIPTION
        Particularly when the comment must be frequently edited,
        as with the help and documentation for a function or script.
    .EXAMPLE
        "LOREM IPSUM" | lower
#>
  [cmdletbinding()] param([parameter(ValueFromPipeline)] [string]$value)
  Process  {
     $_.ToLowerInvariant()
  }    
}


function html-decode () {
<#
    .EXAMPLE
        "&lt;div&gt;lorem ipsum di amet&lt;div&gt;" | html-decode
#>
  [cmdletbinding()] param([parameter(ValueFromPipeline)] [string]$value)
  Process  {
     [_]::DecodeHtml( $_)
  }  
}

function html-encode () {
<#
    .EXAMPLE
        "<div>lorem ipsum di amet<div>" | html-encode
#>
  [cmdletbinding()] param([parameter(ValueFromPipeline)] [string]$value)
  Process  {
      [_]::Escape( $_) 
  }  
}

function base64-decode () {
<#
    .EXAMPLE
        "bG9yZW0=" | base64-decode
#>
  [cmdletbinding()] param([parameter(ValueFromPipeline)] [string]$value)
  Process  {
      [_]::FromBase64String( $_)
  }  
}

function base64-encode () {
<#
    .EXAMPLE
        "lorem" | base64-encode
#>
  [cmdletbinding()] param([parameter(ValueFromPipeline)] [string]$value)
  Process  {
      [_]::ToBase64String( $_)
  }
}

function unixts-decode () {
<#
    .EXAMPLE
        1591650935 | unixts-decode
#>
  [cmdletbinding()] param([parameter(ValueFromPipeline)] [string]$value)
  Process  {
      [_]::FromUnixTimestamp( $_ )
  }
}

function unixts-encode () {
<#
    .EXAMPLE
        get-date | unixts-encode
#>
  [cmdletbinding()] param([parameter(ValueFromPipeline)] [DateTime]$value)
  Process  {
      [_]::ConvertToUnixTimestamp( $_ )
  }
}



function http-get () {
<#
    .EXAMPLE
        "https://example.com" | http-get
#>
  [cmdletbinding()] param([parameter(ValueFromPipeline)] [string]$uri)
  Process  {
      [_]::HttpGetStringAsync( $_).Result
  }
}

function get-daynames () {
<#
    .EXAMPLE
        "tr-TR" | get-daynames
#>
  [cmdletbinding()] param([parameter(ValueFromPipeline)] [string]$culture)
  Process  {
      [_]::GetDayNames( [cultureinfo]::new($_), 1) 
  }
}

function get-monthnames () {
<#
    .EXAMPLE
        "tr-TR" | get-monthnames
#>
  [cmdletbinding()] param([parameter(ValueFromPipeline)] [string]$culture)
  Process  {
      [_]::GetMonthNames( [cultureinfo]::new($_)) 
  }
}

function month-lastday () {
<#
    .EXAMPLE
        get-date | month-lastday
#>
  [cmdletbinding()] param([parameter(ValueFromPipeline)] [datetime]$date)
  Process  {
      [_]::LastDayOfMonth( $_)
  }
}

function month-firstday () {
<#
    .EXAMPLE
        get-date | month-firstday
#>
  [cmdletbinding()] param([parameter(ValueFromPipeline)] [datetime]$date)
  Process  {
      [_]::FirstDayOfMoth( $_)
  }
}

function md5 () {
<#
    .EXAMPLE
        "lorem ipsum" | md5
#>
  [cmdletbinding()] param([parameter(ValueFromPipeline)] [string]$value)
  Process  {
      [_]::Md5Hash( $_) 
  }
}

function sha1 () {
<#
    .EXAMPLE
        "lorem ipsum" | sha1
#>
  [cmdletbinding()] param([parameter(ValueFromPipeline)] [string]$value)
  Process  {
      [_]::Sha1Hash( $_) 
  }
}

function sha256 () {
<#
    .EXAMPLE
        "lorem ipsum" | sha256
#>
  [cmdletbinding()] param([parameter(ValueFromPipeline)] [string]$value)
  Process  {
      [_]::Sha256Hash( $_) 
  }
}

function sha384 () {
<#
    .EXAMPLE
        "lorem ipsum" | sha384
#>
  [cmdletbinding()] param([parameter(ValueFromPipeline)] [string]$value)
  Process  {
      [_]::Sha384Hash( $_) 
  }
}

function sha512 () {
<#
    .EXAMPLE
        "lorem ipsum" | sha512
#>
  [cmdletbinding()] param([parameter(ValueFromPipeline)] [string]$value)
  Process  {
      [_]::Sha512Hash( $_) 
  }
}

function format-bytearray () {
<#
    .EXAMPLE
        "hello" | format-bytearray
#>
  [cmdletbinding()] param([parameter(ValueFromPipeline)] [string]$value)
  Process  {
      [_]::ToByteArrayUTF8( $_) 
  }
}

function markdown () {
<#
    .EXAMPLE
        "https://gist.githubusercontent.com/guneysus/895728a91810b9712d21f7c16486f1e1/raw/markdown.md" | http-get | markdown
#>
  [cmdletbinding()] param([parameter(ValueFromPipeline)] [string]$content)
  Process  {
      [_]::ParseMarkdown( $_)
  }
}

function rss () {
<#
    .EXAMPLE
        "https://feedforall.com/sample.xml" | http-get | rss
#>
  [cmdletbinding()] param([parameter(ValueFromPipeline)] [string]$content)
  Process  {
      [_]::ParseRSS( $_)
  }
}

function split-words () {
<#
    .EXAMPLE
        "lorem ipsum di amet" | split-words
#>
  [cmdletbinding()] param([parameter(ValueFromPipeline)] [string]$content)
  Process  {
      [_]::Words( $_)
  }
}

Function Get-Tmpfilename () {
<#
    .EXAMPLE
       Get-Tmpfilename
#>
    [_]::GetTempFileName( ) 
}


function deburr () {
<#
    .EXAMPLE
        "ahmed þeref güneysu" | deburr
#>
  [cmdletbinding()] param([parameter(ValueFromPipeline)] [string]$value)
  Process  {
      [_]::Deburr( $_)
  }
}

function chunk () {
<#
    .EXAMPLE
        generate-key 8 | chunk -size 2
#>
    [cmdletbinding()] param(
        [parameter(ValueFromPipeline)] [string]$value,
        [Parameter(Position=0, Mandatory=$true)] [int] $size
    )
  Process  {
      [System.Linq.Enumerable]::Range(0, $value.Length/$size) | % { $value.SubString($_ * $size, $size) }
  }
}