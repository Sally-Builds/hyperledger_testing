<div align="center">
   <h1>Hyperledger Fabric (test_cura) - Basic Hyperledger Network </h1>
</div>

**Project Overview:**
The test_cura project is a minimal CLI-based application built using Hyperledger Fabric to set up and benchmark a private blockchain network. The project focuses on creating organizations, configuring channels, and testing data throughput for reading and writing operations. It includes the process of setting up the network, deploying smart contracts, and managing peer communication in a blockchain environment.

**Year Developed:** 2023

**Key Features:**

Network Setup and Configuration:

Creation of artifacts folder for storing network configuration files.
crypto-config.yaml file is used for bootstrapping organizations’ identities, including generating certificates for each organization.
configtx.yaml configures the genesis block, channel configuration, and anchor peers for the organizations.
Channel Creation and Management:

Scripts to create channel artifacts and deploy them.
Channel creation and joining organizations to the channel for collaborative transactions.
Updating anchor peers for each organization.
Smart Contract Deployment:

Deploy script that brings up the network and installs dependencies for the smart contract.
Chaincode packaging outputs the chaincode in .tar.gz format.
Installation of chaincode on endorsing peers and approval by organizations.
Chaincode Commit and Invocation:

Use checkCommitReadiness to ensure all organizations are in favor of committing the chaincode definition.
Commit the chaincode definition to the peers for deployment.
Invoke chaincode init method to start the contract and allow interactions.
Benchmarking Data Throughput:

The project is designed to test the read and write throughput of the blockchain network and smart contracts.
It benchmarks the performance of data transactions across different organizations within the network.
Use Case:
The test_cura project serves as an example of setting up a Hyperledger Fabric-based private blockchain network. It is used for testing, validating, and benchmarking various blockchain operations such as transaction speed, throughput, and scalability in a controlled environment. It provides a foundation for building more complex, real-world applications that require secure, permissioned networks with multiple organizations.

**Technologies Used:**

**Blockchain Framework:** ![Hyperledger](https://img.shields.io/badge/hyperledger-2F3134?style=for-the-badge&logo=hyperledger&logoColor=white)

**Scripting:** ![Bash Script](https://img.shields.io/badge/bash_script-%23121011.svg?style=for-the-badge&logo=gnu-bash&logoColor=white)

**Chaincode:** ![NodeJS](https://img.shields.io/badge/node.js-6DA55F?style=for-the-badge&logo=node.js&logoColor=white)

**Queue:** ![Apache Kafka](https://img.shields.io/badge/Apache%20Kafka-000?style=for-the-badge&logo=apachekafka)

**GitHub Link:** [![GitHub](https://img.shields.io/badge/github-%23121011.svg?style=for-the-badge&logo=github&logoColor=white)](https://github.com/Sally-Builds/hyperledger_testing)


## Steps in creating the network
*   ### **create artifacts folder**
    *   create a crypto-config.yaml file for bootstrapping the organizations identities
    *   create a shell script(create-artifacts.sh) which outputs the result in in a folder called   crypto-config
    *   create a configtx.yaml file for the channel artifacts to perform the following
        *  genesis block - contains organizations certificates
        *  channel configuration info
        *  configures anchor peer for each organization
*   ### **Add script to create channel configurations**
    *   create channel.
    *   Join organizations to the channel.
    *   updata anchor peers.
*   ### **Add a deploy script to bring up our network**
    *   set global enviromental variables
    *   create funcitons to set enviromental variables for each peer for an organization
    *   add presetup function - to install dependencies for our smart contract
    *   package chaincode - outputs our chaincode in chaincodeName.tar.gz format
    *   install packaged chaincode on our endorsing peers
    *   approve chaincode for organization. ***we first query the chaincode to get the package id***.
    *   checkCommitRedyness to show if the organizations are all in favour of the chaincode
    *   commit chaincode definition to the peers.
    *   invoke chaincode init method
