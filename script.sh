udisk=$(df -m| awk '{sum+=$3} END{printf("%d/"), sum/1000;}')
tdisk=$(df -m| awk '{sum+=$4} END{printf("%dGB"), sum/1000;}')
pd=$(df -m | awk '{s1+=$3} {s2+=$4} END{printf("%.2f%%"), s1/s2 * 100}')
wall "
	#Architecure: $(uname -a)
	#CPU physical: $(lscpu | grep "CPU(s):" | head -1  | tr -d 'CPU(s): ')
	#vCPU: $(cat /proc/cpuinfo | grep processor | wc -l)
	#Memory Usage: $(free | grep Mem | awk '{printf("%d/%dMB %.2f%%"), $3, $2, $3/$2 * 100}')
	#Disk usage: $udisk$tdisk $pd
	#CPU load: $(top -bn1 | grep "%Cpu" | awk '{printf("%d%%"),$2}')
	#Last reboot: $(who -b| tail -1 | awk '{printf("%s %s"),$3,$4}')
	#LVM use: $(lsblk | grep "lvm" | wc -l | awk '{if ($1) printf("yes"); else printf("no");}')
	#Connections TCP : $(netstat | grep tcp | wc -l) ESTABLISHED
	#User log: $(who |wc -l)
	#Network: IP $(hostname -I) ($(ip address | grep "link/ether" | awk '{print $2}'))
	#Sudo : $(journalctl _COMM=sudo | grep "sudo" | wc -l)

	"