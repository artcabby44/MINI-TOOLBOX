
$i = 1
Do {
Write-Host "`n`n*****Crypto Wallet Seed Phrase Encryptor Flashdrive***** `n `n This will encrypt/decryt your Crypto wallet Seed Phrase using AES encrytion and saved the ecryted string to txt file`n 1.Encrypt Seedphrase `n 2.Decrypt Seedphrase `n 3.Exit"
$user_inp = Read-Host "Select a task"

Switch ($user_inp)
{
   1 {Read-Host “Input Seed Phrase” -AsSecureString | ConvertFrom-SecureString | Out-File .\SecurePassword.txt
      }
   3 {exit}
   2 {
   Write-Host "Seedphrase Decrypted! `n `n"
   $password = Get-Content .\SecurePassword.Txt | ConvertTo-SecureString
[System.Runtime.InteropServices.Marshal]::PtrToStringAuto([System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($password))}


}

}


Until($i -eq 0)
