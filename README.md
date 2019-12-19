# Gutenberg To IPFS

Scripts to download and add Project Gutenberg books and ingest them to an IPFS Cluster.

It is recommended to check the scripts and to test with a language with not too many files.

Note things here are very WIP.

## Usage

```sh
./download.sh <language>
./extract.sh
./add-to-cluster <ipfs-cluster-ctl flags> # i.e. --basic-auth a:b --host /dnsaddr/cluster
```


## Want to help?

* Help improving and streamlining these scripts
* Help pinning Gutenberg archives on IPFS by joining a IPFS Collaborative Cluster: https://collab.ipfscluster.io
* Run your own collaborative Clusters: https://cluster.ipfs.io/documentation
