
#!/bin/sh
#Check Health of all Services
#Example Usage ./check_swarm_service_health.sh
#Output show  list of Service start with 0/ replicas
result=$(docker service ls --format "{{.Name}} {{.Replicas}}" | grep 0/)
health=$(echo $result | wc -l)

if [ $health -le 0 ]
then
    echo "OK - ALL Services healthy "
    exit 0
elif [ $health -ge 1 ]
then
    echo "CRITICAL - Service Broken - $result"
    exit 2
else
    echo "UNKNOWN - Service Status not clear - $result"
    exit 3
fi




