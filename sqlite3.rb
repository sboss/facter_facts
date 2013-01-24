require 'facter'

# count is used to determine if we have sqlite3 or not.
count=0
# 
# checking the path for sqlite3
for p in ENV[ 'PATH' ].split(':')
  p = p + "/sqlite3"
  if File.exists?(p) then
    Facter.add(:sqlite3) { setcode { p } }
    count=count+1
    break
  else
    # not found.
  end
  
end

# determining if we have git or not.
if count > 0 then
  Facter.add(:has_sqlite3) { setcode { "TRUE" } }
  Facter.add(:sqlite3_version) { setcode { `sqlite3 --version`.split(" ").shift } }  
else
  Facter.add(:has_sqlite3) { setcode { "FALSE" } }  
end
