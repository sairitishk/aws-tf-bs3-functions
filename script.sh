for I in {1..11};
do
echo $I
sudo useradd -m testuser$I --shell /bin/bash
sleep 2
done

cat /etc/passwd | grep -i testuser