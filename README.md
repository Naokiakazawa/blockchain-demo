# Blockchain demonstration

Python implementation Mining and Transfer, Recieve processes.

## how to use

Run following command to run some docker containers named miner and peer_node_1 etc.
```bash
docker-compose up -d
```

Attach miner container.
```bash
docker exec -it miner bash
```

Run mining process with following command in miner container.
```bash
bash cmds/mining.sh
```
