function ConvertTo-Hex () {
<#
    TODO powershell 7 has a function: format-hex
    .EXAMPLE

    100 | ConvertTo-Hex
#>
  [cmdletbinding()] param([parameter(ValueFromPipeline)] [int]$value)
  Process  {
     '{0:X2}' -f $_
  }    
}

function decimal () {
<#
    .EXAMPLE
        0xff | decimal
#>
  [cmdletbinding()] param([parameter(ValueFromPipeline)] [int]$value)
  Process  {
     [int64]$_
  }    
}

function ConvertTo-Bin () {
<#
    .EXAMPLE
        0xff | ConvertTo-Bin
#>
  [cmdletbinding()] param([parameter(ValueFromPipeline)] [int]$value)
  Process  {
     [_]::Bin( $_)
  }   
}