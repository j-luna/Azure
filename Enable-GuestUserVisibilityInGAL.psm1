## Show selected guest user in the GAL

function Show-JLGuestUserInGAL {
    param(
      [Parameter(Mandatory=$true)]
      [String]$guestUserEmail
    )

    $guestUser = Get-MgBetaUser -Filter "mail eq '$guestUserEmail'" | Where-Object {$_.CreationType -eq "Invitation"}

    if ($null -eq $guestUser) {
        Write-Output "User either not found or not a guest user."
    }
    else {
        Update-MgBetaUser -UserId $guestUser.Id -ShowInAddressList
        Write-Output "$($guestUser.mail) is now shown in the GAL."
    }

}