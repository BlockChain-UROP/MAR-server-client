# Module Agnostic Rendering (MAR) for Client Server 
Please run everything in Remix compiler

## Normal Unidirectional Test
Client --> Server
1. Deploy both `Client` and `Server`
2. On Client:
```
setAddressValue("S_addr",<server_address>)
getStringValue("S_func","increment()")
renderServerData("S_addr","S_func")
exec()
```
3. On Server:
```
getValue()
```
4. The value on Server should be larger than 0

## Failure and Life is Tragedy Bidirectional Test
Client <--> Server
1. Deploy both `Client` and `Server`
2. On Client:
```
setAddressValue("S_addr",<server_address>)
getStringValue("S_func","incrementReturn()")
renderServerData("S_addr","S_func")
exec()
```
3. On Server:
```
getValue()
```
4. The value on Server should be larger than 0
5. Check Client
```
getReceivedUint()
```
6. The miserable `received_uint` should be the same as value
7. Wish there is no more inequality, war, famine, disease, revert and out of gas in our world. Thanks be to God. QAAQ