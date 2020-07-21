#!/bin/bash
###安装docker-ce

PATH=$HOME/bin:$HOME/.local/bin:$PATH
export PATH

config_dir="/etc/docker"

yum remove docker docker-client docker-client-latest docker-common docker-latest docker-latest-logrotate docker-logrotate docker-selinux docker-engine-selinux docker-engine
yum install -y yum-utils device-mapper-persistent-data lvm2
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
yum makecache
yum list docker-ce --showduplicates | sort -r

echo "Start installing..."
yum install -y docker-ce
sleep 5

if test ! -d $config_dir ; then
  mkdir -p $config_dir
  tee /etc/docker/daemon.json <<-'EOF'
  {
    "registry-mirrors": ["https://jkje2ckb.mirror.aliyuncs.com"]
  }
EOF

else
  tee /etc/docker/daemon.json <<-'EOF'
  {
    "registry-mirrors": ["https://jkje2ckb.mirror.aliyuncs.com"]
  }
EOF

fi

systemctl daemon-reload
systemctl start docker.service
systemctl enable docker
