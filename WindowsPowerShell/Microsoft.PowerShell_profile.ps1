
# Function to correctly close, remove and exit when PSSessions have been opened.
function quit {
    Get-PSSession | Remove-PSSession
    Remove-Module tmp_*
    exit
}

function prompt            
{            
   # The at sign creates an array in case only one history item exists.  
   $history = @(get-history)  
   if($history.Count -gt 0)  
   {  
      $lastItem = $history[$history.Count - 1]  
      $lastId = $lastItem.Id  
      #$lastMod = $lastItem.
   }  

    #$color = Get-Random -Min 1 -Max 32
    $color = 3
    $colorr = 8
    $nextCommand = $lastId + 1  
    $nextTime = $(Get-Date)
    $mbo = get-location
    $nextCommandColor = Write-Host "[0$($nextCommand)] " -NoNewLine -ForegroundColor $Color
    $nextTimeColor = Write-Host "[$($nextTime)] " -NoNewLine -ForegroundColor $Colorr
    
    #Write-Host "$($nextCommand)" -NoNewLine -ForegroundColor $Color + " [$(Get-Date)] " + $(get-location) + "> " 
    #"$($nextCommandColor)" + " [$(Get-Date)] " + $(get-location) + "$($IDx)" + "> "            
    "$($nextCommandColor)" + "$($nextTimeColor)" + "$($mbo)" + "> "            
    #Return " "
}

#oh-my-posh init pwsh | Invoke-Expression

Import-Module posh-git
# Import-Module oh-my-posh
Set-PoshPrompt -Theme Paradox
Import-Module -Name Terminal-Icons
Import-Module PSReadLine
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadLineOption -EditMode Windows