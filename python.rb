require 'facter'

# count is used to determine if we have python or not.
count=0
# 
# checking the path for python
for p in ENV[ 'PATH' ].split(':')
  p = p + "/python"
  if File.exists?(p) then
    Facter.add(:python) { setcode { p } }
    count=count+1
    break
  else
    # not found.
  end
  
end

# determining if we have python or not.
if count > 0 then
  Facter.add(:has_python) { setcode { "TRUE" } }
  Facter.add(:python_version) { setcode { `python --version 2>&1`.gsub("Python ","").split(" ").shift } }    
else
  Facter.add(:has_python) { setcode { "FALSE" } }  
end