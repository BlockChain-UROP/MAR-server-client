# Module Agnostic Rendering (MAR) for Client Server 
Please run everything in Remix compiler

## Normal Unidirectional Test
Client --> Server
1. Deploy both `Client` and `Server`
2. On Client:
```
setAddressValue("S_addr",<server_address>)
setStringValue("S_func","increment()")
renderServerData("S_addr","S_func")
exec()
```
The variable `success` should be true if `exec()` runs properly. 
3. On Server:
```
getValue()
```
4. The value on Server should be incremented by 1

## Bidirectional Test
Client <--> Server
1. Deploy both `Client` and `Server`
2. On Client:
```
setAddressValue("S_addr",<server_address>)
setStringValue("S_func","incrementReturn()")
renderServerData("S_addr","S_func")
exec()
```
The variable `success` should be true if `exec()` runs properly. 
3. On Server:
```
getValue()
```
4. The value on Server should be larger than 0
5. Check Client
```
getReceivedUint()
```
6. The `received_uint` should be the same as value
7. Wish there is no more inequality, war, famine, disease, revert and out of gas in our world. Thanks be to God. QAAQ
