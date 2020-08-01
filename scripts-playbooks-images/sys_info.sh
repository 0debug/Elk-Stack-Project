#!/bin/bash
date
echo "Machine Type Info:"
echo $MACHTYPE
echo -e "Uname info: $(uname -a) \n"
echo -e "IP Info: $(ip addr | head -9 | tail -1) \n"
echo "Hostname: $(hostname -s) "
echo "DNS Servers: "
cat /etc/resolv.conf
echo "Memory Info:"
free
#Display CPU usage
echo "\nCPU Info:"
lscpu | grep CPU
#Display Disk usage
echo "\nDisk Usage:"
df -H | head -2
#Display who is logged in
echo "\nWho is logged in: \n $(who -a) \n"
files=('/etc/passwd' '/etc/shadow' '/etc/hosts')
for file in ${files[@]}
do
ls -l $file >> $output
done;
echo -e "\nThe permissions for sensitive /etc files: \n" >> $output
for file in ${files[@]};
do
  ls -l $file >> $output
done;
for user in $(ls /home);
do
  sudo -lU $user
done;
commands=(
'date'
'uname -a'
'hostname -s'
)
for x in {0..2};
do
results=$(${commands[$x]})
echo 'Results of "${commands[$x]}" command:' >> $output
echo $results >> $output
echo "" >> $output
done;

~                                                                                                                                                                                                           
~                                   