require 'facter'

# count is used to determine if we have perl or not.
count=0
# 
# checking the path for perl
for p in ENV[ 'PATH' ].split(':')
  p = p + "/perl"
  if File.exists?(p) then
    Facter.add(:perl) { setcode { p } }
    count=count+1
    break
  else
    # not found.
  end
  
end

# determining if we have perl or not.
if count > 0 then
  Facter.add(:has_perl) { setcode { "TRUE" } }
else
  Facter.add(:has_perl) { setcode { "FALSE" } }  
end