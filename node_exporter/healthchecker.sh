#!/bin/bash

### functions
# send_email $title $message
source /home/khlee/.env

### target_servers
# server_name:CPU_CRITERIA=10,MEM_CRITERIA=20,HDD_CRITERIA=30"
source /home/khlee/.envsetup.ubuntu/node_exporter/target_servers.include

for TARGET_SERVER in "${TARGET_SERVERS[@]}"; do
    IFS=":" read -r CRITERIA server_name <<<"$TARGET_SERVER"
    IFS="," read -r -a CRITERIA_ARRAY <<<"$CRITERIA"

    for item in "${CRITERIA_ARRAY[@]}"; do
        IFS="=" read -r -a CRITERION <<<"$item"
        key=${CRITERION[0]}
        value=${CRITERION[1]}
        declare "$key=$value"
    done

    ### Node Exporter의 출력을 저장, 실패시 메일 발송
    node_exporter_output=`curl -s "$server_name":9100/metrics`
    result=$?

    if [[ $result -ne 0 ]]; then
        echo "$server_name 서버로의 접속에 실패하였습니다. (에러코드: $result)"
        title="[오류] E:$result for $server_name"
        message="$server_name 서버로의 접속에 실패하였습니다."
        message="$message\n  • 접속URL: http://$server_name:9100/metrics"
        message="$message\n  • CLI명령: curl $server_name:9100/metrics"
        message="$message\n  • 에러코드: $result"
        send_email "$title" "$message"
        continue
    fi

    ### Node Exporter의 출력에서 CPU 부하량 확인
    #node_cpu_seconds_total{cpu="7",mode="system"} 684.61
    cpu_count=`echo "$node_exporter_output" | grep "^node_cpu_seconds_total" | grep "system" | wc -l`
    #node_load1 0
    cpu_load1=`echo "$node_exporter_output" | grep "^node_load1 " | awk '{print $2}'`
    cpu_usage_percentage=$(echo "scale=0; 100 * $cpu_load1 / $cpu_count" | bc -l)
    cpu_message=(
        "CPU $cpu_usage_percentage% for $server_name"
        "\n  • 현재 CPU: $cpu_usage_percentage% (초과기준: $CPU_CRITERIA%)"
    )
    cpu_lines=""
    for line in "${cpu_message[@]}"; do
        cpu_lines+="$line"
    done

    ### Node Exporter의 출력에서 사용 가능한 MEM 용량 확인
    #node_memory_MemTotal_bytes 1.013133312e+09
    mem_total_bytes_e=`echo "$node_exporter_output" | grep "^node_memory_MemTotal_bytes" | awk '{print $2}'`
    mem_total_bytes=`printf "%0.0f" $mem_total_bytes_e`
    mem_total_gb=$(echo "scale=2; $mem_total_bytes / 1024 / 1024 / 1024" | bc -l)
    #node_memory_MemFree_bytes 7.7283328e+07
    mem_avail_bytes_e=`echo "$node_exporter_output" | grep "^node_memory_MemAvailable_bytes" | awk '{print $2}'`
    mem_avail_bytes=`printf "%0.0f" $mem_avail_bytes_e`
    mem_avail_gb=$(echo "scale=2; $mem_avail_bytes / 1024 / 1024 / 1024" | bc -l)
    ### 사용률 계산 (소수 두자리까지 출력)
    mem_used_gb=$(echo "scale=2; $mem_total_gb - $mem_avail_gb" | bc -l)
    mem_usage_percentage=$(echo "scale=0; ($mem_used_gb / $mem_total_gb) * 100" | bc -l)
    mem_message=(
        "MEM $mem_usage_percentage% for $server_name"
        "\n  • 현재 MEM: $mem_usage_percentage% (초과기준: $MEM_CRITERIA%)"
        "\n  • 현재 MEM / 전체 MEM: $(printf "%.1f" "${mem_used_gb}")GB / $(printf "%.1f" "${mem_total_gb}")GB"
    )
    mem_lines=""
    for line in "${mem_message[@]}"; do
        mem_lines+="$line"
    done

    ### Node Exporter의 출력에서 "/"의 사용 가능한 HDD 용량 확인
    #node_filesystem_size_bytes{device="/dev/root",fstype="ext4",mountpoint="/"} 1.6455237632e+10
    hdd_total_bytes_e=`echo "$node_exporter_output" | grep "^node_filesystem_size_bytes" | grep "mountpoint=\"/\"" | awk '{print $2}'`
    hdd_total_bytes=`printf "%.0f" $hdd_total_bytes_e`
    hdd_total_gb=$(echo "scale=2; $hdd_total_bytes / 1024 / 1024 / 1024" | bc -l)
    #node_filesystem_free_bytes{device="/dev/root",fstype="ext4",mountpoint="/"} 1.1300491264e+10
    hdd_free_bytes_e=`echo "$node_exporter_output" | grep "^node_filesystem_free_bytes" | grep "mountpoint=\"/\"" | awk '{print $2}'`
    hdd_free_bytes=`printf "%.0f" $hdd_free_bytes_e`
    hdd_free_gb=$(echo "scale=2; $hdd_free_bytes / 1024 / 1024 / 1024" | bc -l)
    ### 사용량 계산 (소수 두자리까지 출력)
    hdd_used_gb=$(echo "scale=2; $hdd_total_gb - $hdd_free_gb" | bc -l)
    hdd_usage_percentage=$(echo "scale=0; ($hdd_used_gb / $hdd_total_gb) * 100" | bc -l)
    hdd_message=(
        "HDD $hdd_usage_percentage% for $server_name"
        "\n  • 현재 HDD: $hdd_usage_percentage% (초과기준:$HDD_CRITERIA%)"
        "\n  • 현재 HDD / 전체 HDD: $(printf "%.1f" "${hdd_used_gb}")GB / $(printf "%.1f" "${hdd_total_gb}")GB"
    )
    hdd_lines=""
    for line in "${hdd_message[@]}"; do
        hdd_lines+="$line"
    done

    #############################################################################################
    console_message=""
    email_message=""

    cpu_comparison=$(echo "$cpu_usage_percentage >= $CPU_CRITERIA" | bc)
    if (( cpu_comparison == 1 )); then
        console_message="$console_message\n\e[31m[C초과]\e[0m  $cpu_lines"
        email_message="$email_message\n[C초과] ===========> $cpu_lines"
    else
        console_message="$console_message\n\e[32m[C정상]\e[0m  $cpu_lines"
        email_message="$email_message\n[C정상] $cpu_lines"
    fi

    mem_comparison=$(echo "$mem_usage_percentage >= $MEM_CRITERIA" | bc)
    if (( mem_comparison == 1 )); then
        console_message="$console_message\n\e[31m[M초과]\e[0m  $mem_lines"
        email_message="$email_message\n[M초과] ===========> $mem_lines"
    else
        console_message="$console_message\n\e[32m[M정상]\e[0m  $mem_lines"
        email_message="$email_message\n[M정상] $mem_lines"
    fi

    hdd_comparison=$(echo "$hdd_usage_percentage >= $HDD_CRITERIA" | bc)
    if (( hdd_comparison == 1 )); then
        console_message="$console_message\n\e[31m[H초과]\e[0m  $hdd_lines"
        email_message="$email_message\n[H초과] ===========> $hdd_lines"
        email_message="$email_message\n  • 조치사항1: sudo apt autoremove --purge -y; sudo apt clean; df -h"
    else
        console_message="$console_message\n\e[32m[H정상]\e[0m  $hdd_lines"
        email_message="$email_message\n[H정상] $hdd_lines"
    fi

    #############################################################################################
    echo -e "$console_message"
    if ((hdd_comparison == 1)) || ((mem_comparison == 1)) || ((cpu_comparison == 1)); then
        title="[경고] $cpu_usage_percentage/$mem_usage_percentage/$hdd_usage_percentage for $server_name"
        send_email "$title" "$email_message"
    fi
done
echo
