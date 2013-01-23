require 'facter'

# count is used to determine if we have ruby or not.
count=0
rvmcount=0
# 
# checking the path for ruby
for p in ENV[ 'PATH' ].split(':')
  p = p + "/ruby"
  if File.exists?(p) then
    Facter.add(:ruby) { setcode { p } }
    count=count+1
    break
  else
    # not found.
  end
  
end

# determining if we have ruby or not.
if count > 0 then
  Facter.add(:has_ruby) { setcode { "TRUE" } }
else
  Facter.add(:has_ruby) { setcode { "FALSE" } }  
end

# determine if we have RVM or not.
if count > 0 then
  for p in ENV[ 'PATH' ].split(':')
    p = p + "/rvm"
    if File.exists?(p) then
      Facter.add(:rvm) { setcode { p } }
      rvmcount=rvmcount+1
      break
    else
      # not found.
    end
  
  end

  # determining if we have RVM or not.
  if rvmcount > 0 then
    Facter.add(:has_rvm) { setcode { "TRUE" } }
  else
    Facter.add(:has_rvm) { setcode { "FALSE" } }  
  end
  
end
