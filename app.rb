# Installation steps MacOS
# Install RabbitMQ:
# brew install rabbitmq
# Start RabbitMQ in the foreground:
# rabbitmq-server
# Create dev user:
# rabbitmqctl add_user cc-dev taxi123
# Create vhost:
# rabbitmqctl add_vhost cc-dev-vhost
# Configure dev user for vhost:
# rabbitmqctl set_permissions -p cc-dev-vhost cc-dev ".*" ".*" ".*"
# Add admin user
# rabbitmqctl add_user cc-admin taxi123
# Configure admin user for vhost:
# rabbitmqctl set_permissions -p cc-dev-vhost cc-admin ".*" ".*" ".*"

RABBITMQ_URI = "amqp://cc-dev:taxi123@localhost/cc-dev-vhost"

# Require client library
require 'bunny'

begin
  connection = Bunny.new RABBITMQ_URI
  connection.start

  sleep 10
rescue Bunny::TCPConnectionFailed => e
  puts "Connection to server failed"
end
