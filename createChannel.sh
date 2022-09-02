export CORE_PEER_TLS_ENABLED=true
export ORDERER_CA=${PWD}/artifacts/crypto-config/ordererOrganizations/cura.com/orderers/orderer.cura.com/msp/tlscacerts/tlsca.cura.com-cert.pem
export PEER0_ORG1_CA=${PWD}/artifacts/crypto-config/peerOrganizations/org1.cura.com/peers/peer0.org1.cura.com/tls/ca.crt
export PEER0_ORG2_CA=${PWD}/artifacts/crypto-config/peerOrganizations/org2.cura.com/peers/peer0.org2.cura.com/tls/ca.crt
export FABRIC_CFG_PATH=${PWD}/artifacts/config/

export CHANNEL_NAME=mychannel

setGlobalsForOrderer(){
    export CORE_PEER_LOCALMSPID="OrdererMSP"
    export CORE_PEER_TLS_ROOTCERT_FILE=${PWD}/artifacts/crypto-config/ordererOrganizations/cura.com/orderers/orderer.cura.com/msp/tlscacerts/tlsca.cura.com-cert.pem
    export CORE_PEER_MSPCONFIGPATH=${PWD}/artifacts/crypto-config/ordererOrganizations/cura.com/users/Admin@cura.com/msp
    
}

setGlobalsForPeer0Org1(){
    export CORE_PEER_LOCALMSPID="Org1MSP"
    export CORE_PEER_TLS_ROOTCERT_FILE=$PEER0_ORG1_CA
    export CORE_PEER_MSPCONFIGPATH=${PWD}/artifacts/crypto-config/peerOrganizations/org1.cura.com/users/Admin@org1.cura.com/msp
    export CORE_PEER_ADDRESS=localhost:7051
}

setGlobalsForPeer1Org1(){
    export CORE_PEER_LOCALMSPID="Org1MSP"
    export CORE_PEER_TLS_ROOTCERT_FILE=$PEER0_ORG1_CA
    export CORE_PEER_MSPCONFIGPATH=${PWD}/artifacts/crypto-config/peerOrganizations/org1.cura.com/users/Admin@org1.cura.com/msp
    export CORE_PEER_ADDRESS=localhost:8051
    
}

setGlobalsForPeer0Org2(){
    export CORE_PEER_LOCALMSPID="Org2MSP"
    export CORE_PEER_TLS_ROOTCERT_FILE=$PEER0_ORG2_CA
    export CORE_PEER_MSPCONFIGPATH=${PWD}/artifacts/crypto-config/peerOrganizations/org2.cura.com/users/Admin@org2.cura.com/msp
    export CORE_PEER_ADDRESS=localhost:9051
    
}

setGlobalsForPeer1Org2(){
    export CORE_PEER_LOCALMSPID="Org2MSP"
    export CORE_PEER_TLS_ROOTCERT_FILE=$PEER0_ORG2_CA
    export CORE_PEER_MSPCONFIGPATH=${PWD}/artifacts/crypto-config/peerOrganizations/org2.cura.com/users/Admin@org2.cura.com/msp
    export CORE_PEER_ADDRESS=localhost:10051
    
}

createChannel(){
    # rm -rf ./channel-artifacts/*
    setGlobalsForPeer0Org1
    
    peer channel create -o localhost:7050 -c $CHANNEL_NAME \
    --ordererTLSHostnameOverride orderer.cura.com \
    -f ./artifacts/${CHANNEL_NAME}.tx --outputBlock ./channel-artifacts/${CHANNEL_NAME}.block \
    --tls $CORE_PEER_TLS_ENABLED --cafile $ORDERER_CA
}

removeOldCrypto(){
    rm -rf ./api-1.4/crypto/*
    rm -rf ./api-1.4/fabric-client-kv-org1/*
    rm -rf ./api-2.0/org1-wallet/*
    rm -rf ./api-2.0/org2-wallet/*
}


joinChannel(){
    setGlobalsForPeer0Org1
    peer channel join -b ./channel-artifacts/$CHANNEL_NAME.block
    
    setGlobalsForPeer1Org1
    peer channel join -b ./channel-artifacts/$CHANNEL_NAME.block
    
    setGlobalsForPeer0Org2
    peer channel join -b ./channel-artifacts/$CHANNEL_NAME.block
    
    setGlobalsForPeer1Org2
    peer channel join -b ./channel-artifacts/$CHANNEL_NAME.block
    
}

updateAnchorPeers(){
    setGlobalsForPeer0Org1
    peer channel update -o localhost:7050 --ordererTLSHostnameOverride orderer.cura.com -c $CHANNEL_NAME -f ./artifacts/${CORE_PEER_LOCALMSPID}anchors.tx --tls $CORE_PEER_TLS_ENABLED --cafile $ORDERER_CA
    
    setGlobalsForPeer0Org2
    peer channel update -o localhost:7050 --ordererTLSHostnameOverride orderer.cura.com -c $CHANNEL_NAME -f ./artifacts/${CORE_PEER_LOCALMSPID}anchors.tx --tls $CORE_PEER_TLS_ENABLED --cafile $ORDERER_CA
    
}

# removeOldCrypto

createChannel
joinChannel
updateAnchorPeers