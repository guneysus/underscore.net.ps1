Function get-letters () { [_]::AsciiLetters( ) }

Function get-lowers () { [_]::AsciiLowercase( ) }

Function get-puncs () { [_]::AsciiPunctuation( ) }

Function get-uppers () { [_]::AsciiUppercase( ) }

Function get-digits () { [_]::Digits( ) }

Function _.IsEmail ( [String] $str) { [_]::IsEmail( $str) }

Function _.IsNumber ( [String] $v,  [IFormatProvider] $formatProvider) { [_]::IsNumber( $v, $formatProvider) }

Function _.IsPhoneNumber ( [String] $str) { [_]::IsPhoneNumber( $str) }

Function _.NewHttpClient () { [_]::NewHttpClient( ) }

# _.Pad " ahmed " 80 '*'
Function _.Pad ( [String] $v,  [Int32] $pad,  [String] $padWith) { [_]::Pad( $v, $pad, $padWith) }

# _.Password (_.AsciiLetters) 10
# _.Password -from (_.AsciiLetters) -length 12
# _.Password -from ( (_.AsciiLetters) + "0123456789" + (_.AsciiLetters)) -length 12
Function generate-pass ( [char[]] $from,  [Int32] $length) { [_]::Password( $from, $length) }

Function replace-string ( [String] $v,  [String] $from,  [String] $to) { [_]::Replace( $v, $from, $to) }

Function strip-string ( [String] $source,  [String] $s) { [_]::Strip( $source, $s) }

Function trim-strings ( [String] $v,  [String] $trim) { [_]::Trim( $v, $trim) }

Function get-LatinextendedLetters () { [_]::TurkishAndEnglishLetters( ) }

Function get-TurkishLetters () { [_]::TurkishLetters( ) }

Function generate-bytes ( [Int32] $bytes) { [_]::TokenBytes( $bytes) }

Function generate-key ( [Int32] $bytes) { [_]::TokenHex( $bytes) }

