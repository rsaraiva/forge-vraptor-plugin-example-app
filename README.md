Forge VRaptor Pluging Example Application
=========================================

An example of a simple application created by VRaptor Forge Plugin (https://github.com/rsaraiva/forge-vraptor-plugin).

How to build
============

1. Clone the source

`git clone https://github.com/rsaraiva/forge-vraptor-plugin-example-app.git`

2. Compile and package

`mvn clean package`

3. Deploy on JBoss AS (tested on JBoss 6)

`cp target/forge-vraptor-plugin-example-app.war [YOUR_AS_HOME]/server/default/deploy/`

4. Start the AS server and go to url

`http://localhost:8080/forge-vraptor-plugin-example-app/`

Contribute
==========
This project is open source and is waiting for your contributions :)
