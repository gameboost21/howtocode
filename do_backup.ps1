[void][Reflection.Assembly]::LoadWithPartialName('Microsoft.VisualBasic')



function getInput{
 echo "function activated"
 $title = 'Backup'
 $msg   = 'Enter Backup path:'

 $text = [Microsoft.VisualBasic.Interaction]::InputBox($msg, $title)
 $Result = [System.Windows.Forms.MessageBox]::Show("Ist '$text' korrekt?","Titel",3,[System.Windows.Forms.MessageBoxIcon]::Exclamation)

  copy-item $env:userprofile\AppData\Roaming\Microsoft\Signatures\* $text
  
 return $Result
}

$Result=getInput
echo "function activated"
If ($Result -eq "Yes")
{
	#Do backup
}
elseif ($Result -eq "No")
{
 #redo input
 $Result=getInput
}
else
{
   echo "Error 123: Lass mal lieber"
}