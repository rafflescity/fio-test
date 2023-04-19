# FIO Test
This tool runs `fio` in POD to test `PV` performance per `StorageClass`

## To run a test against a StorageClass

``` Console
SC=<StorageClass Name> make test
```

### Cleanup

``` Console
SC=<StorageClass Name> make untest
```
