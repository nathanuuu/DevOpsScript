yum -y update

# Install Java
yum -y install java-1.8.0-openjdk.x86_64 java-1.8.0-openjdk-devel.x86_64
export JAVA_HOME=/usr/lib/jvm/jre-1.8.0

# Install Maven
curl -O  http://apache.cs.utah.edu/maven/maven-3/3.5.0/binaries/apache-maven-3.5.0-bin.tar.gz && tar xvf apache-maven-3.5.0-bin.tar.gz
mv apache-maven-3.5.0 /usr/local/apache-maven-3.5.0 && rm -f apache-maven-*
export M2_HOME=/usr/local/apache-maven-3.5.0 M2=$M2_HOME/bin PATH=$M2:$PATH

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
