# This script adds sequentially named users (i.e. "user1", "user2") to a group.

# Define Variables:
$group = "Users";                     # Define group to add new users to. Adds users to "Users" group by default.
$baseusername = "user";               # Set the base username. Actual username will be "user[x]", where x = count in the loop. 
$accountsToModify = 8;                # Set the number of accounts to modify

# Begin loop to create accounts
$count = 1; 
while ($count -le $accountsToModify) { 
  $username = "$baseusername$count"; 
  Add-LocalGroupMember -Group $group $username; 
  $count = $count + 1;
}
