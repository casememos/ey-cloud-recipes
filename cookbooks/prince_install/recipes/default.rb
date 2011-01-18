#
# Cookbook Name:: prince_install
# Recipe:: default
#
if ['solo', 'app', 'app_master'].include?(node[:instance_role])

cookbook_file "/tmp/prince-7.1-linux.tar.gz" do
  source "prince-7.1-linux.tar.gz"
  mode 0755
  owner "root"
  group "root"
end

bash "untar_prince" do
  cwd "/tmp"
  user "root"
  code <<-EOH
    tar xf prince-7.1-linux.tar.gz
  EOH

end

cookbook_file "/tmp/prince-7.1-linux/install_prince.sh" do
  source "install_prince.sh"
  mode 0755
  owner "root"
  group "root"
end

bash "install_prince" do
  cwd "/tmp/prince-7.1-linux"
  user "root"
  code <<-EOH
   ./install_prince.sh
  EOH
end


end

