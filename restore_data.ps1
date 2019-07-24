[void][Reflection.Assembly]::LoadWithPartialName('Microsoft.VisualBasic')



function getInput{
 echo "function activated"
 $title = 'Restore'
 $msg   = 'Gebe hier den Pfad an, wo du das Backup gespeichert hast:'

 $text = [Microsoft.VisualBasic.Interaction]::InputBox($msg, $title)
 $Result = [System.Windows.Forms.MessageBox]::Show("Ist '$text' korrekt?","Titel",3,[System.Windows.Forms.MessageBoxIcon]::Exclamation)

  copy-item $text\* $env:userprofile\AppData\Roaming\Microsoft\Signatures\
  
 return $Result
}

$Result=getInput
echo "function activated"
If ($Result -eq "Yes")
{
   #Do Backup
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