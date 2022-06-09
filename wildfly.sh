

 yum update -y

 yum install java-11-openjdk-devel -y

 groupadd -r wildfly

useradd -r -g wildfly -d /opt/wildfly -s /sbin/nologin wildfly

wget https://download.jboss.org/wildfly/19.0.0.Final/wildfly-19.0.0.Final.tar.gz -y -P /tmp

tar xf /tmp/wildfly-19.0.0.Final.tar.gz -C /opt/

ln -s /opt/wildfly-19.0.0.Final /opt/wildfly

chown -RH wildfly: /opt/wildfly

mkdir -p /etc/wildfly

cp /opt/wildfly/docs/contrib/scripts/systemd/wildfly.conf /etc/wildfly/

cp /opt/wildfly/docs/contrib/scripts/systemd/launch.sh /opt/wildfly/bin/

cp /opt/wildfly/docs/contrib/scripts/systemd/wildfly.service /etc/systemd/system

systemctl daemon-reload

systemctl start wildfly

systemctl enable wildfly

firewall-cmd --zone=public --permanent --add-port=8080/tcp

firewall-cmd --zone=public --permanent --add-port=9990/tcp

firewall-cmd --reload

sudo /opt/wildfly/bin/add-user.sh
