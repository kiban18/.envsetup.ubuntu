#!/bin/bash

FILTER=$1

### functions
# send_email $title $message
source /home/khlee/.env

### target_servers
# server_name:CPU_CRITERIA=10,MEM_CRITERIA=20,HDD_CRITERIA=30"
source /home/khlee/.envsetup.ubuntu/node_exporter/target_servers.include

for TARGET_SERVER in "${TARGET_SERVERS[@]}"; do
    IFS=":" read -r CRITERIA server_name <<<"$TARGET_SERVER"
    IFS="," read -r -a CRITERIA_ARRAY <<<"$CRITERIA"

    # FILTER가 있을 경우 FILTER와 일치하면 실행
    if [[ -n "$FILTER" && "$server_name" != *"$FILTER"* ]]; then
        continue
    fi

    for item in "${CRITERIA_ARRAY[@]}"; do
        IFS="=" read -r -a CRITERION <<<"$item"
        key=${CRITERION[0]}
        value=${CRITERION[1]}
        #declare $key=$(expr "$value" + 0) # "01"을 "1"과 같은 형태로 변환
        declare $key=$value
    done

    ### Node Exporter의 출력을 저장, 실패시 메일 발송
    node_exporter_output=`curl -s "$server_name":9100/metrics`
    result=$?

    if [[ $result -ne 0 ]]; then
        echo "$server_name 서버로의 접속에 실패하였습니다. (에러코드: $result)"
        email_title="[접속오류] E:$result for $server_name"
        email_message="$server_name 서버로의 접속에 실패하였습니다."
        email_message="$email_message\n  • 접속URL: http://$server_name:9100/metrics"
        email_message="$email_message\n  • CLI명령: curl $server_name:9100/metrics"
        email_message="$email_message\n  • 에러코드: $result"
        email_message="<font color=red>\n$email_message\n</font>"
        email_message=$(echo "$email_message" | sed 's/\\n/<br>/g' | sed 's/  /\&nbsp;\&nbsp;/g')
        send_email "$email_title" "$email_message"
        continue
    fi

    ### Node Exporter의 출력에서 CPU 부하량 확인
    #node_cpu_seconds_total{cpu="7",mode="system"} 684.61
    cpu_count=`echo "$node_exporter_output" | grep "^node_cpu_seconds_total" | grep "system" | wc -l`
    #node_load5 0
    cpu_load5=`echo "$node_exporter_output" | grep "^node_load5 " | awk '{print $2}'`
    cpu_usage_percentage_temp=$(echo "scale=2; 100 * $cpu_load5 / $cpu_count" | bc -l)
    cpu_usage_percentage=$(printf "%.0f" "$cpu_usage_percentage_temp")
    cpu_message=(
        "$server_name 의 CPU 지표"
        "\n  • CPU $cpu_usage_percentage% of $CPU_CRITERIA%(초과기준)"
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
    mem_usage_percentage_temp=$(echo "scale=2; ($mem_used_gb / $mem_total_gb) * 100" | bc -l)
    mem_usage_percentage=$(printf "%.0f" "$mem_usage_percentage_temp")
    mem_message=(
        "$server_name 의 메모리 지표"
        "\n  • MEM $mem_usage_percentage% of $MEM_CRITERIA%(초과기준)"
        "\n  • 현재/전체: $(printf "%.1f" "${mem_used_gb}")GB / $(printf "%.1f" "${mem_total_gb}")GB"
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
    hdd_usage_percentage_temp=$(echo "scale=2; ($hdd_used_gb / $hdd_total_gb) * 100" | bc -l)
    hdd_usage_percentage=$(printf "%.0f" "$hdd_usage_percentage_temp")
    hdd_message=(
        "$server_name 의 저장공간 지표"
        "\n  • HDD $hdd_usage_percentage% of $HDD_CRITERIA%(초과기준)"
        "\n  • 현재/전체: $(printf "%.1f" "${hdd_used_gb}")GB / $(printf "%.1f" "${hdd_total_gb}")GB"
    )
    hdd_lines=""
    for line in "${hdd_message[@]}"; do
        hdd_lines+="$line"
    done

    #############################################################################################
    console_message=""
    email_message=""
    email_prefix=""

    cpu_comparison=$(echo "$cpu_usage_percentage >= $CPU_CRITERIA" | bc)
    if (( cpu_comparison == 1 )); then
        console_message="$console_message\n\e[31m[C-경고]\e[0m $cpu_lines"
        html_lines=$cpu_lines
        html_lines="[C-경고] $html_lines"
        html_lines="$html_lines\n    •• 조치사항 제안1: top -o %CPU"
        html_lines="<font color=red>\n$html_lines\n</font>"
        email_message="$email_message\n$html_lines"
        email_prefix="[CPU-경고] $email_prefix"
    else
        console_message="$console_message\n\e[32m[C-정상]\e[0m $cpu_lines"
        email_message="$email_message\n[C-정상] $cpu_lines"
    fi

    mem_comparison=$(echo "$mem_usage_percentage >= $MEM_CRITERIA" | bc)
    if (( mem_comparison == 1 )); then
        console_message="$console_message\n\e[31m[M-경고]\e[0m $mem_lines"
        html_lines=$mem_lines
        html_lines="[M-경고] $html_lines"
        html_lines="$html_lines\n    •• 조치사항 제안1: top -o %MEM"
        html_lines="<font color=red>\n$html_lines\n</font>"
        email_message="$email_message\n$html_lines"
        email_prefix="[메모리-경고] $email_prefix"
    else
        console_message="$console_message\n\e[32m[M-정상]\e[0m $mem_lines"
        email_message="$email_message\n[M-정상] $mem_lines"
    fi

    hdd_comparison=$(echo "$hdd_usage_percentage >= $HDD_CRITERIA" | bc)
    if (( hdd_comparison == 1 )); then
        console_message="$console_message\n\e[31m[H-경고]\e[0m $hdd_lines"
        html_lines=$hdd_lines
        html_lines="[H-경고] $html_lines"
        html_lines="$html_lines\n    •• 조치사항 제안1: sudo apt autoremove --purge -y; sudo apt clean; df -h"
        html_lines="$html_lines\n    •• 조치사항 제안2: sudo journalctl --vacuum-time=7d"
        html_lines="$html_lines\n    •• 조치사항 제안3: sudo tmpreaper . --showdeleted --test -a 7d"
        html_lines="$html_lines\n    •• 조치사항 제안4: sudo du . -ch --max-depth=1 | sort -h"
        html_lines="$html_lines\n    •• 조치사항 제안4-1: sudo du / -ch --max-depth=1 | sort -h"
        html_lines="$html_lines\n    •• 조치사항 제안4-2: sudo du /var -ch --max-depth=1 | sort -h"
        html_lines="$html_lines\n    •• 조치사항 제안4-3: sudo du /usr -ch --max-depth=1 | sort -h"
        html_lines="$html_lines\n    •• 조치사항 참조1: https://crazyup.monday.com/boards/2598569650/pulses/4468217373"
        html_lines="$html_lines\n    •• 조치사항 참조2: https://docs.google.com/document/d/1y1KzKRkCl41b7cHTADjO1A0p1ocipNayQoNUmbuD1AA"
        html_lines="<font color=red>\n$html_lines\n</font>"
        email_message="$email_message\n$html_lines"
        email_prefix="[저장공간-경고] $email_prefix"
    else
        console_message="$console_message\n\e[32m[H-정상]\e[0m $hdd_lines"
        email_message="$email_message\n[H-정상] $hdd_lines"
    fi

    email_message=$(echo "$email_message" | sed 's/\\n/<br>/g' | sed 's/  /\&nbsp;\&nbsp;/g')
    email_title="$email_prefix $cpu_usage_percentage/$mem_usage_percentage/$hdd_usage_percentage for $server_name"
    #############################################################################################
    echo -e "$console_message"
#    echo "$email_message"
    if ((hdd_comparison == 1)) || ((mem_comparison == 1)) || ((cpu_comparison == 1)); then
        send_email "$email_title" "$email_message"
    fi
done
echo
