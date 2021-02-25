# Deployment

## Security folder

All [security files](../../INSTALL.md#bezpečnostné-súbory) must be placed in `/data/upvs/security` 
folder in shared storage cluster and mounted at `/app/security`.



## Jelastic deploy scripts

Download jelastic cli and login: https://docs.jelastic.com/cli/

Set Jelastic installation path

example:
```
export JELASTIC_HOME=~/jelastic
```

deploy application
```
./dev-scripts/jelastic/deploy.sh
```
