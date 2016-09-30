bash "tarea" do
user "root"
code <<-EOH
yum clean all -y 
yum update -y
EOH
end
