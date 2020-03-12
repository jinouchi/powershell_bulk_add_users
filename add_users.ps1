# This script creates similarly named, sequential user accounts (ie. user1, user2, etc.).

# Define Variables:
$accountsToCreate = 8;          # Set number of accounts to create:
$baseusername = "user";         # Set the base username. Actual username will be "user[x]", where x = count in the loop. 
$password=ConvertTo-SecureString "password" -AsPlainText -Force;    # Define password
$group = "Users";               # Define group to add new users to. Adds users to "Users" group by default.

# Begin loop to create accounts
$count = 1; 
while ($count -le $accountsToCreate) { 
  $username = "$baseusername$count"; 
  New-LocalUser -Name $username -Password $password; 
  Add-LocalGroupMember -Group $group $username;         # Duplicate this line for each group to add new members to; replace "$group" with the group name in quotes.
  $count = $count + 1; 
}
