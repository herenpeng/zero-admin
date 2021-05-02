# 服务名称
SERVICE_NAME=zero-admin
# 项目路径
SERVICE_DIR=/usr/web-project/zero-admin
# 日志文件
LOG_FILE=${SERVICE_DIR}/log.log
# jar名称
JAR_NAME=zero-web-1\.0-SNAPSHOT\.jar
# 进程文件名称
PID_FILE=${SERVICE_NAME}\.pid

help(){
  echo "=== spring-boot shell help start ==="
  echo "start 启动服务"
  echo "stop 停止服务"
  echo "restart 重启服务"
  echo "===  spring-boot shell help end  ==="
}

start(){
  if [ ! -x ${JAR_NAME} ]
  then
    echo "=== ${JAR_NAME}新增可执行权限 ==="
    chmod +x ${JAR_NAME}
  fi
  nohup java -Dfile.encoding=UTF-8 -jar ${JAR_NAME} --spring.profiles.active=prod >${LOG_FILE} 2>&1 &
  echo $! > ${SERVICE_DIR}/${PID_FILE}
	echo "=== 服务${SERVICE_NAME}已启动 ==="
}

stop(){
	P_ID=$(cat ${SERVICE_DIR}/${PID_FILE})
	if [ "${P_ID}" == "" ]
	then
    echo "=== 服务${SERVICE_NAME}不存在或者已停止 ==="
  else
    kill "${P_ID}"
    rm -rf ${SERVICE_DIR}/${PID_FILE}
    echo "=== 服务${SERVICE_NAME}已停止 ==="
  fi
}

restart(){
	stop
  sleep 2
  start
	echo "=== 服务${SERVICE_NAME}已重启 ==="
}

cd ${SERVICE_DIR}

case ${1} in
    "")
      echo "=== 参数错误 ==="
        ;;
    help)
      help
        ;;
    start)
      start
        ;;
    stop)
     	stop
        ;;
    restart)
      restart
        ;;
    *)
      help
        ;;
esac

exit 0
