#!/bin/bash

# 监控本机的GPU使用情况,当存在使用率小于20%的GPU时,使用该GPUS执行预定的脚本
echo -e "Lock and load!\n"

# Time interval for checking the GPUs status
timeInterval=1

# Under what percentage should the GPU be taken as availabel
usagePercent=15


# 存储统计出的本机GPU的使用量
GPUs=(False False False False)


monitorGPU(){
  usage=$(nvidia-smi | grep '\([0-9]\{1,5\}MiB./..[0-9]\{,5\}MiB\)' \
           | awk '{print $9 / $11 * 100 "%"}')

  echo 'The usage of each GPU is:'
  echo -e "$usage \n"
  echo -e "Now search for available GPU..."

  declare -i i=-1
  # 处理GPU状态
  for line in $usage
  do
    i+=1;
   # echo $line $usage
    flag=$(echo $line $usagePercent $i | awk '{if($1<$2){print "true"} else{print "false"}}')
#    echo $i:$flag
    if [[ $flag = "true" ]];then
      GPUs[$i]=$flag
    fi
   done
}


gpu_stat="false"
num=${#GPUs[@]}

while [[ $gpu_stat == "false" ]];do

  monitorGPU
  declare -i c=-1

  for ((j=0;j<num;j++))
  do
    c+=1
    #echo "This" ${GPUs[j]}

    if [[ ${GPUs[j]} = "true" ]];then
      #read
      echo "GPU $c now Affirmative! Fire in the hole! "
      gpu_stat=true
      exec sh ./test.sh $c    
    else
       echo "Negative! GPU $c is not available! Keep on monitoring..."
    fi

  done

  if [[ $gpu_stat != "true" ]];then
    echo -e "\n"
    echo "Check again after $timeInterval seconds..."
    sleep $timeInterval
  fi

done

echo "Complete!"
