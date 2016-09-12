# Reverse Proxy with SSH Tunnel

The goal is setting up a revserse proxy to expose your `localhost` application to the internet via a public server. The same goal as `[ngrok](https://ngrok.com)` or `[PageKite](https://pagekite.net)` offering.

What you need is:
- A server that can be access from the internet (get one at DigitalOcean, Linode or AWS EC2)
- A server application running on your local machine (Rails or Node app) 

## On Remote Server

On server side, you need to have SSH running, and add this config to your `/etc/ssh/sshd_config`:

```
GatewayPorts yes
```

Then restart the SSH server:

```
service ssh restart
```

## On Local Server (Your machine)

Run the following command to create SSH tunnel exposing your server application running at `localhost:3000` to `remote-server:9000`:

```
ssh -N -R 9000:localhost:3000 user@remote-server
```

The parameters: 
- `-N`: to make sure you don't connect to SSH server as login mode
- `-R`: create a tunnel from your machine to remote server
- `9000`: port on remote server you want to listenning 
- `localhost:3000`: address and port of your local machine server application
- `user@remote-server`: your SSH credential

From now on, everybody can access your local application from `http://remote-server:9000`
