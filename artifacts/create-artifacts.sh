#Generate crypto artifacts for organizations
# cryptogen generate --config=./crypto-config.yaml --output=./crypto-config/

#System channel
SYS_CHANNEL="sys-channel"

# channel name
CHANNEL_NAME="mychannel"

echo $CHANNEL_NAME

# Generate system genesis block
# configtxgen -profile OrdererGenesis -configPath . -channelID $SYS_CHANNEL -outputBlock ./genesis.block



# # Generate channel configuration block
# configtxgen -profile BasicChannel -configPath . -channelID $CHANNEL_NAME -outputCreateChannelTx ./mychannel.tx

# Generate anchor peer update of peer organizations
echo "##########      Generating anchor peers update for Pi1MSP   ##########"
configtxgen -profile BasicChannel -configPath . -outputAnchorPeersUpdate ./Pi1MSPanchors.tx -channelID $CHANNEL_NAME -asOrg Pi1MSP

echo "##########      Generating anchor peers update for Pi1MSP   ##########"
configtxgen -profile BasicChannel -configPath . -outputAnchorPeersUpdate ./Pi2MSPanchors.tx -channelID $CHANNEL_NAME -asOrg Pi2MSP
