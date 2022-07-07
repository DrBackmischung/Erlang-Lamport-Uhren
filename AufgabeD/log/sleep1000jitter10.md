## Sleep: 1000
## Jitter: 10
## Befehl: `test:run(1000,10).`

```
log: 1 euler {sending,{hello,58}}
log: 1 einstein {sending,{hello,60}}
log: 1 curie {sending,{hello,44}}
log: 2 turing {received,{hello,58}}
log: 2 einstein {sending,{hello,50}}
log: 3 turing {received,{hello,60}} 
log: 3 euler {received,{hello,50}}  
log: 3 einstein {sending,{hello,41}}
log: 4 turing {received,{hello,44}}
log: 4 curie {received,{hello,41}}  
log: 4 euler {sending,{hello,80}}   
log: 4 einstein {sending,{hello,24}}
log: 5 curie {received,{hello,80}}
log: 5 turing {sending,{hello,94}}  
log: 5 einstein {sending,{hello,14}}
log: 6 euler {received,{hello,94}}
log: 6 turing {received,{hello,24}}
log: 6 curie {sending,{hello,84}}
log: 7 euler {received,{hello,14}}
log: 7 einstein {received,{hello,84}}
log: 7 turing {sending,{hello,75}}
log: 8 euler {sending,{hello,92}}
log: 8 einstein {sending,{hello,83}}
log: 9 curie {received,{hello,92}}
log: 9 einstein {received,{hello,75}}
log: 10 curie {received,{hello,83}}
log: 11 curie {sending,{hello,24}}
log: 12 einstein {received,{hello,24}}
log: 12 curie {sending,{hello,67}}
log: 13 einstein {sending,{hello,15}}
log: 13 turing {received,{hello,67}}
log: 13 curie {sending,{hello,67}}
log: 14 euler {received,{hello,15}}
log: 14 turing {sending,{hello,16}}
log: 14 einstein {sending,{hello,87}}
log: 15 euler {received,{hello,16}}
log: 15 einstein {sending,{hello,99}}
log: 15 turing {sending,{hello,48}}
log: 16 euler {received,{hello,87}}
log: 16 curie {received,{hello,99}}
log: 16 einstein {sending,{hello,40}}
log: 17 euler {received,{hello,67}}
log: 17 turing {received,{hello,40}}
log: 17 einstein {sending,{hello,22}}
log: 18 euler {received,{hello,48}}
log: 18 turing {sending,{hello,92}}
log: 19 euler {sending,{hello,19}}
log: 19 turing {sending,{hello,34}}
log: 20 curie {received,{hello,19}}
log: 20 euler {sending,{hello,41}}
log: 21 curie {received,{hello,22}}
log: 21 einstein {received,{hello,41}}
log: 21 euler {sending,{hello,36}}
stop
```
