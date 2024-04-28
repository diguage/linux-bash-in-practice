#!/usr/bin/env bash
#
# @author diguage
#
#opay-deploy-to-spark.sh
#order-deploy-to-spark.sh
#product-order-item-deploy-to-spark.sh
#puser-deploy-to-spark.sh
#user-location-deploy-to-spark.sh

source /home/lijun01/.bashrc

declare -a appNames=(WriteOpayRealTime WriteOrderTime WriteProductOrderItemRealTime WriteUserRealTime WriteUserLocationRealTime WriteKafkaToRedisRealTime)
declare -a appBashNames=(opay-deploy-to-spark.sh order-deploy-to-spark.sh product-order-item-deploy-to-spark.sh puser-deploy-to-spark.sh user-location-deploy-to-spark.sh ktr-deploy-to-spark.sh)

length=${#appNames[@]}

for (( i=0; i<${length}; i++  ));
do
  appId=`yarn application -list -appStates RUNNING | grep bigdata-personas | grep ${appNames[$i]} | awk '{print $1}'`
  # echo "AppId: " $appId >> /home/lijun01/cron.log
  #echo ${appNames[$i]}
  #echo ${appBashNames[$i]}
  # if appId is empty then redeploy the app
  if [[ -z ${appId} ]]; then
    /home/lijun01/${appBashNames[$i]}
    echo `date '+%Y-%m-%d %H:%M:%S'` "redepley ${appNames[$i]}" >> /home/lijun01/cron.log
  fi
  appId=''
done


# Order
/opt/hadoop_new/jzspark/bin/spark-submit --class com.ofo.crm.service.WriteOrderTime --name WriteOrderTime@bigdata-personas --master yarn --deploy-mode cluster  --executor-memory 2g --conf "spark.app.id=WriteOrderTime@bigdata-personas" --queue userGrowth  --executor-cores 4 --num-executors 20 bd-crm-spark-jar-with-dependencies.jar yarn  &
