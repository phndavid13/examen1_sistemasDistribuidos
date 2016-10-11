bash 'install_node' do
	user "root"
	code <<-EOH
	wget http://nodejs.org/dist/v0.10.30/node-v0.10.30.tar.gz
	tar xzvf node-v* && cd node-v*
	sudo yum install gcc gcc-c++
	./configure
	make
	sudo make install
	EOH
end
bash 'create_app_folder' do
	user "root"
	code <<-EOH
	mkdir /home/vagrant/webapps
	EOH
end
bash "open port" do
	user "root"
	code <<-EOH
	iptables -I INPUT 5 -p tcp -m state --state NEW -m tcp --dport 8090 -j ACCEPT
	service iptables save
	EOH
end
remote_directory '/home/vagrant/webapps' do
	source 'mirave'
	owner 'root'
	group 'root'
	mode 0644
end
bash 'latest_node' do
	user "root"
	code <<-EOH
	npm cache clean -f
	npm install -g n
	n stable
	ln -sf /usr/local/n/versions/node/v6.6.0/bin/node /usr/bin/node 
	EOH
end  
bash 'start_app' do
	user "root"
	code <<-EOH
	sudo chmod 777 /home/vagrant/webapps
	cd /home/vagrant/webapps
	npm install express
	npm install pg
	nohup node server.js > /dev/null 2>&1 &
	EOH
end  

