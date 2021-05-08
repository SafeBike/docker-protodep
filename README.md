# docker-protodep

Containerize potodep https://github.com/stormcat24/protodep

## Install

From Docker Hub

```sh
docker pull safebike/protodep
```

Or with the makefile

```sh
make build IMAGE=image TAG=tag
```

## Usage

```sh
docker run --rm -v $HOME/.ssh:/root/.ssh -v $PWD:/tmp -w /tmp safebike/protodep up -f -i id_rsa
```

## Example

```sh
make
```
This will get the proto dependencies defined in `protodep.toml`

