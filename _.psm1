Function get-letters () { [Underscore]::AsciiLetters( ) }

Function get-lowers () { [Underscore]::AsciiLowercase( ) }

Function get-puncs () { [Underscore]::AsciiPunctuation( ) }

Function get-uppers () { [Underscore]::AsciiUppercase( ) }

Function get-digits () { [Underscore]::Digits( ) }

Function _.IsEmail ( [String] $str) { [Underscore]::IsEmail( $str) }

Function _.IsNumber ( [String] $v,  [IFormatProvider] $formatProvider) { [Underscore]::IsNumber( $v, $formatProvider) }

Function _.IsPhoneNumber ( [String] $str) { [Underscore]::IsPhoneNumber( $str) }

Function _.NewHttpClient () { [Underscore]::NewHttpClient( ) }

# _.Pad " ahmed " 80 '*'
Function _.Pad ( [String] $v,  [Int32] $pad,  [String] $padWith) { [Underscore]::Pad( $v, $pad, $padWith) }

# _.Password (_.AsciiLetters) 10
# _.Password -from (_.AsciiLetters) -length 12
# _.Password -from ( (_.AsciiLetters) + "0123456789" + (_.AsciiLetters)) -length 12

Function Get-RandomPass ( [char[]] $from,  [Int32] $length) { [Underscore]::Password( $from, $length) }

Function Clear-Spaces ( [String] $v) { [Underscore]::Trim( $v ) }

Function Get-LatinExtendedLetters () { [Underscore]::TurkishAndEnglishLetters( ) }

Function Get-TurkishLetters () { [Underscore]::TurkishLetters( ) }

Function Get-RandomBytes ( [Int32] $bytes) { [Underscore]::TokenBytes( $bytes) }

Function Get-RandomKey ( [Int32] $bytes) { [Underscore]::TokenHex( $bytes) }

function Convert-Hex2Ascii() {
    # https://stackoverflow.com/a/41763171/1766716
    param([Parameter(Mandatory=$true, Position=0, ValueFromPipeline)] [String]$HexString)
	
	$asciiChars = $HexString -split ' ' | ForEach-Object {[char][byte]"0x$_"}
	$asciiString = $asciiChars -join ''

	write-host $asciiString
}
