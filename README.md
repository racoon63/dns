# coreDNS

## Configuration

### Corefile

The `Corefile` is the configuration file for the coreDNS service. For more information about configuration possibilities, see [here](https://coredns.io/manual/configuration/).

### Zone file

**IMPORTANT:** The serial number can not be longer than 10 characters! Otherwise the following issue will occur and coredns does not start: `plugin/file: file "/root/example.db" has no SOA record for origin example.com.`

## Deployment

To deploy the combination of pihole and coreDNS clone this repository and switch in the repository directory:

```bash
git clone https://github.com/racoon63/coredns.git
cd coredns
```

Edit the `example.com.db` file or make a copy of the `example.com.db` and edit the `Corefile` according to the `*.db` file you copied or edited. When you are finished you can start a new docker container by running:

```bash
docker run -d --name coredns -p 53:53/udp -v $PWD/Corefile:/root/Corefile -v $PWD/example.db:/root/example.db coredns/coredns -conf /root/Corefile
```

If you just want to deploy the container combination, you can execute the docker-compose file with:

```bash
docker-compose up -d
```

If you want to deploy the combination on another host, we use an ansible playbook. Create a `host` file e.g.:

```bash
all:
  hosts:
    raspberry:
      ansible_port: 22
        ansible_host: 192.168.4.20
        ansible_user: pi
        ansible_ask_pass: yes
        ansible_python_interpreter: /usr/bin/python3.7
```

and change the `Corefile.j2` and `example.db.j2` files according to your environment. To execute the playbook run (Change the values of the `-e` parameter according to your environment and target host.):

```bash
cd deployment/
ansible-playbook -i hosts \
                 -e HOST=YOUR_HOST \
                 -e USER=USERNAME \
                 -e GROUP=USERGROUP \
                 -e DOMAIN=YOUR_DOMAIN \
                 deployment.yml
```
