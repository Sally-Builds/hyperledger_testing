# Hyperledger fabric(test_cura)
A basic hyperledger network


## Steps in creating the network
*   ### **create artifacts folder**
    *   create a crypto-config.yaml file for bootstrapping the organizations identities
    *   create a shell script(create-artifacts.sh) which outputs the result in in a folder called crypto-config
    *   create a configtx.yaml file for the channel artifacts to perform the following
        *  genesis block - contains organizations certificates
        *  channel configuration info
        *  configures anchor peer for each organization
