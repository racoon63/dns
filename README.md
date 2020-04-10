# coreDNS

## Configuration

### Corefile

The `Corefile` is the configuration file for the coreDNS service. For more information about configuration possibilities, see [here](https://coredns.io/manual/configuration/).

### Zone file

**IMPORTANT:** The serial number can not be longer than 10 characters! Otherwise the following issue will occur and coredns does not start: `plugin/file: file "/root/example.db" has no SOA record for origin example.com.`

## Deployment

To deploy a coreDNS container clone this repository and switch in the repository directory:

```bash
git clone https://github.com/racoon63/coredns.git
cd coredns
```

Edit the example or make a copy of the `example.db` and edit the `Corefile` according to the `*.db` file you copied or edited. When you are finished you can start a new docker container by running:

```bash
docker run -d --name coredns -p 53:53/udp -v $PWD/Corefile:/root/Corefile -v $PWD/example.db:/root/example.db coredns/coredns -conf /root/Corefile
```
