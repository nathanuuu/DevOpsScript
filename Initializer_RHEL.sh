# Yum
yum -y update
yum makecache fast

# Install Java
yum -y install java-1.8.0-openjdk.x86_64 java-1.8.0-openjdk-devel.x86_64
echo "export JAVA_HOME=/usr/lib/jvm/jre-1.8.0" >> /etc/bashrc

# Install Maven
curl -O  http://apache.cs.utah.edu/maven/maven-3/3.5.0/binaries/apache-maven-3.5.0-bin.tar.gz && tar xvf apache-maven-3.5.0-bin.tar.gz
mv apache-maven-3.5.0 /usr/local/apache-maven-3.5.0 && rm -f apache-maven-*
echo "export M2_HOME=/usr/local/apache-maven-3.5.0 M2=$M2_HOME/bin PATH=$M2:$PATH" >> /etc/bashrc

# Install Git, Wget
yum -y install git wget

# Pip
curl -O https://bootstrap.pypa.io/get-pip.py && python get-pip.py && rm -f get-pip.py

# Python packages
pip install boto3

# Ruby
yum -y install ruby
gem install rake bundler rspec cucumber

# Scala and SBT
curl -O http://downloads.lightbend.com/scala/2.10.4/scala-2.10.4.rpm && yum -y install scala-2.10.4.rpm && rm -f scala-2.10.4.rpm
wget http://dl.bintray.com/sbt/rpm/sbt-0.13.15.rpm && yum -y install sbt-0.13.15.rpm && rm -f sbt-0.13.15.rpm

# Docker
yum -y install yum-utils device-mapper-persistent-data lvm2
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
yum-config-manager --enable docker-ce-edge
yum -y install docker-ce-17.03.1.ce-1.el7.centos
systemctl start docker.service
usermod -aG docker ec2-user
service docker restart

# Golang
curl -O https://storage.googleapis.com/golang/go1.8.3.linux-amd64.tar.gz && tar -C /usr/local -xvf go1.8.3.linux-amd64.tar.gz && rm -f go1.8.3.linux-amd64.tar.gz
echo "export PATH=$PATH:/usr/local/go/bin" >> /etc/bashrc
