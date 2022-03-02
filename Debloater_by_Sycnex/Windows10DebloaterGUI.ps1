Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing


# Gui
$form = New-Object System.Windows.Forms.Form
$form.Text = 'SEED PHRASE ENCRYPTOR/DECRYPTOR FLASHDRIVE'
$form.Size = New-Object System.Drawing.Size(300,200)
$form.StartPosition = 'CenterScreen'

$okButton = New-Object System.Windows.Forms.Button
$okButton.Location = New-Object System.Drawing.Point(75,120)
$okButton.Size = New-Object System.Drawing.Size(75,23)
$okButton.Text = 'Encrypt'
$okButton.DialogResult = [System.Windows.Forms.DialogResult]::OK
$form.AcceptButton = $okButton
$form.Controls.Add($okButton)

$cancelButton = New-Object System.Windows.Forms.Button
$cancelButton.Location = New-Object System.Drawing.Point(150,120)
$cancelButton.Size = New-Object System.Drawing.Size(75,23)
$cancelButton.Text = 'Decrypt'
$cancelButton.DialogResult = [System.Windows.Forms.DialogResult]::Cancel
$form.CancelButton = $cancelButton
$form.Controls.Add($cancelButton)

$label = New-Object System.Windows.Forms.Label
$label.Location = New-Object System.Drawing.Point(10,20)
$label.Size = New-Object System.Drawing.Size(280,20)
$label.Text = 'Enter Phrase or Encrrypted Phrase:'
$form.Controls.Add($label)

$textBox = New-Object System.Windows.Forms.MaskedTextBox
$textBox.PasswordChar = '*'
$textBox.Location = New-Object System.Drawing.Point(10,40)
$textBox.Size = New-Object System.Drawing.Size(260,20)
$form.Controls.Add($textBox)
$form.Topmost = $true
$form.Add_Shown({$textBox.Select()})

#$result = $form.ShowDialog()

# Form2

$form2 = New-Object System.Windows.Forms.Form
$form2.Text = 'SEED PHRASE ENCRYPTOR FLASHDRIVE'
$form2.Size = New-Object System.Drawing.Size(300,200)
$form2.StartPosition = 'CenterScreen'
$form2.AutoSize = $true


#form2label

$label2 = New-Object System.Windows.Forms.Label
$label2.Location = New-Object System.Drawing.Point(10,20)
#$label2.Size = New-Object System.Drawing.Size(280,20)
$Label2.AutoSize = $True



function encrypt {
$result = $form.ShowDialog()
$inpt = $textBox.text

if ($result -eq [System.Windows.Forms.DialogResult]::OK)
{
     
 
     [securestring]$secStringPassword = ConvertTo-SecureString $inpt -AsPlainText -Force
     $encrypted = ConvertFrom-SecureString -SecureString $secStringPassword
     $encrypted | Out-File .\Secured.txt

     $label2.Text = "Your Encrypted Seed Phrase is saved in User Directory as Secured.txt"
     $form2.Controls.Add($label2)
     $form2.ShowDialog()
     

}

else
{    
     $password = Get-Content .\Secured.Txt | ConvertTo-SecureString
     $out = [System.Runtime.InteropServices.Marshal]::PtrToStringAuto([System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($password))
     $out | Out-File .\Decrypted.txt
     $label2.Text = "Your Decrypted Seed Phrase is saved in Decrypted.txt"
     $form2.Controls.Add($label2)
     $form2.ShowDialog()
     
}

}
encrypt
