require 'facter'

# count is used to determine if we have git or not.
count=0
# 
# checking the path for git
for p in ENV[ 'PATH' ].split(':')
  p = p + "/git"
  if File.exists?(p) then
    Facter.add(:git) { setcode { p } }
    count=count+1
    break
  else
    # not found.
  end
  
end

# determining if we have git or not.
if count > 0 then
  Facter.add(:has_git) { setcode { "TRUE" } }
  Facter.add(:git_version) { setcode { `git --version`.gsub("git version ","").split(" ").shift } }  
else
  Facter.add(:has_git) { setcode { "FALSE" } }  
end
