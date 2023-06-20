# Instalacja modułu AD --- Install-WindowsFeature RSAT-AD-PowerShell
# Import modułu AD --- Import-Module ActiveDirectory


$uzytkownik = JanNowak
$haslo = ConvertTo-SecureString -String MojeHaslo123! -AsPlainText -Force
$sciezka =OU=USERS,OU=CORP,DC=corp,DC=contoso,DC=com
$login = $uzytkownik@mojadomena.com
$imie = Jan
$nazwisko = Nowak
$wyswietlanaNazwa = $imie $nazwisko

# Utworzenie nowego użytkownika
New-ADUser `
-SamAccountName $uzytkownik `
-UserPrincipalName $login `
-GivenName $imie `
-Surname $nazwisko `
-Name $imie $nazwisko `
-DisplayName $wyswietlanaNazwa `
-Enabled $true `
-AccountPassword $haslo `
-ChangePasswordAtLogon $true `
-Path $sciezka

# Dodanie użytkownika do grupy TechSUpport
Add-ADGroupMember -Identity TechSUpport -Members $uzytkownik