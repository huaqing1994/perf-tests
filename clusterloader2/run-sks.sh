#!/bin/bash

# ssh访问参数
export KUBE_SSH_KEY_PATH=/root/.ssh/id_rsa
# master节点信息
MASTER_NAME=huaqing-sks-test-3-3-controlplane-x8fg4
MASTER_IP=10.255.64.55
MASTER_INTERNAL_IP=10.255.64.55
KUBE_CONFIG='/root/code/work/internal/kubesmart/tmp/huaqing-sks-test-3-3.kubeconfig'
# 测试配置文件
# TEST_CONFIG='/root/code/other/huaqing/perf-tests/clusterloader2/testing/density/config.yaml'
TEST_CONFIG='/root/code/other/huaqing/perf-tests/clusterloader2/testing/load/config.yaml'
# 测试报告目录位置
REPORT_DIR='./reports'
# 测试日志打印文件
LOG_FILE='test.log'


# --enable-prometheus-server = true \

./clusterloader --kubeconfig=$KUBE_CONFIG \
    --mastername=$MASTER_NAME \
    --masterip=$MASTER_IP \
    --master-internal-ip=$MASTER_INTERNAL_IP \
    --testconfig=$TEST_CONFIG \
    --report-dir=$REPORT_DIR \
    --provider=local \
    --nodes=3 \
    --v=2 \
    --enable-prometheus-server=true \
    --alsologtostderr 2>&1 | tee $LOG_FILE