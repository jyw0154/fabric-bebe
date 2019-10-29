#chaincode install
docker exec cli peer chaincode install -n bebecc -v 1.0 -p github.com/bebecc

#chaincode instatiate
docker exec cli peer chaincode instantiate -o orderer.example.com:7050 -n bebecc -v 1.0 -C bebechannel -c '{"Args":["a","100"]}' -P 'OR ("Org1MSP.member", "Org2MSP.member","Org3MSP.member")'
sleep 5

#chaincode query a
docker exec cli peer chaincode query -n bebecc -C bebechannel -c '{"Args":["get","a"]}'
sleep 5

#chaincode invoke b
docker exec cli peer chaincode invoke -n bebecc -C bebechannel -c '{"Args":["set","b","300"]}'
sleep 5

#chaincode query b
docker exec cli peer chaincode query -n bebecc -C bebechannel -c '{"Args":["get","b"]}'
sleep 5

echo '-------------------------------------END-----------------------------------------'