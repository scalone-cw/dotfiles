git log --pretty=oneline --abbrev-commit

db.audits.find().sort({"_id": -1}).limit(1)
db.logs.find().sort({"_id": -1}).limit(1)

curl -i -k -X POST -d @spec/fixtures/valids/request_dls_subscription_issues.json https://api-dls.dev.abrildigital.com.br/woodwing/vejaipad

git branch --no-color 2> /dev/null | sed -e "/^[^*]/d" -e "s/* \(.*\)/\1/"

git log --pretty=format:"%s" --author=thiago.scalone --since="7 days ago" --encoding=utf-8

git log --pretty=format:"%cd - %s" --author=thiago.scalone --encoding=utf-8

ls -1 | xargs -I{} sh -c "open '{}'"

Antigos
--
echo '16i[q]sa[ln0=aln100%Pln100/snlbx]sbA0D4D465452snlbxq' | dc

#numero de arquivos em uma pasta
ls | wc -l

SQL -> show index from eventos;

smbpasswd -a aluno

usermod -G grupo usuario

smbclient //OFFICE/geral$ -U BRAUTOSEG%123qwerubyrails -W=BREUSEW -c 'ls'

mount.cifs //BRGRUSUP/backup$ /mnt/sew/ --verbose  -o user=BRAUTOSEG,pass=123qwerubyrails,dom=BREUSEW

ls -lhtr | grep May | cut -d"K" -f2 | cut -d" " -f6 | xargs -i -n 1 cp {} pendentes/

if ps ax | grep -v grep | grep carrega_estados.rb > /dev/null
  then

#parametros paro kernel
init=/bin/bash


oracle
SELECT * FROM SESSION_PRIVS;

while true; do xpto; done
--

dd if=/dev/disk1s0 of=file.iso
dd if=/path/to/iso of=/dev/<USB Drive>

--

# Tcpdump de todas as request na porta 80 na rede
# http://serverfault.com/questions/84750/monitoring-http-traffic-using-tcpdump
tcpdump -i en1 'tcp port 80 and (((ip[2:2] - ((ip[0]&0xf)<<2)) - ((tcp[12]&0xf0)>>2)) != 0)'

--

SSH Tunnel with tinyproxy
--
ssh -L 3128:localhost:8888 -N ubuntu@54.94.169.139
--

Global gitignore
--
 git config --global core.excludesfile ~/projects/dotfile/gitignore
--

Prevent .DS_Store file creation over network connections
--
defaults write com.apple.desktopservices DSDontWriteNetworkStores true
--

# Função para extrair IP da saída do ifconfig, deve funcionar sempre (pt, en, arm)
#-----------------------------------------------------------------------
# uso: IP=$(ifconfig eth0 | GetIpFromIfconfig)
function GetIpFromIfconfig(){
  sed -n '/.*inet /s/ *inet \+[A-Za-z\.: ]*\([\.0-9]*\).*/\1/p'
}
#-----------------------------------------------------------------------

# Função para extrair o IPv4 de um dispositivo
#-----------------------------------------------------------------------
# uso: IP=$(GetIPv4 eth0)
function GetIPv4(){
  local DEV=$1
  [ -z "$DEV" ] && echo "DevInvalido"
  LANG=C ifconfig $DEV | GetIpFromIfconfig
}
#-----------------------------------------------------------------------

# Função para extrair o NetMask4 de um dispositivo
#-----------------------------------------------------------------------
# uso: IP=$(GetIPv4 eth0)
function GetMask4(){
  local DEV=$1
  [ -z "$DEV" ] && echo "DevInvalido"
  LANG=C ifconfig $DEV | grep "inet addr:" | sed -n 's/.*Mask:\([0-9.]*\).*/\1/p'
}
#-----------------------------------------------------------------------

# Função para extrair o GATEWAY
#-----------------------------------------------------------------------
# uso GW=$(GetGateway)
function GetGateway(){
  route -n | grep -E "^0.0.0.0.*UG.*" | tr -s ' ' | cut -d' ' -f2 | tail -1
}
#-----------------------------------------------------------------------

# Part of the issue is that low priority I/O now seems to get throttled heavily (or so fs_usage tells me - if you run fs_usage and look for backupd, you can see it getting throttled). So if you have a ton of files, just the time it takes to do the i/o takes forever, even if the files are small (because it performs a bunch more i/o operations around xattrs/etc than it used to).
#-----------------------------------------------------------------------
sudo sysctl -w debug.lowpri_throttle_enabled=0
#-----------------------------------------------------------------------

# Create USB MACOS X setup
#-----------------------------------------------------------------------
sudo /Applications/Install\ OS\ X\ El\ Capitan.app/Contents/Resources/createinstallmedia --volume /Volumes/MyVolume --applicationpath /Applications/Install\ OS\ X\ El\ Capitan.app
#-----------------------------------------------------------------------

# Head file
#-----------------------------------------------------------------------
head -n20 ~/projects/cloudwalk/meeting.txt
#-----------------------------------------------------------------------

# Launchctl Postgres
#-----------------------------------------------------------------------
launchctl start ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist
#-----------------------------------------------------------------------

# Launchctl Redis
#-----------------------------------------------------------------------
launchctl start ~/Library/LaunchAgents/homebrew.mxcl.redis.plist
#-----------------------------------------------------------------------

# Open GPG files, it's necessary to get key password in 1Password
#-----------------------------------------------------------------------
gpg --decrypt file.zip.gpg --output file.zip
#-----------------------------------------------------------------------

# Last git commit hash (short)
#-----------------------------------------------------------------------
git rev-parse --short HEAD
#-----------------------------------------------------------------------

# Grep and sed overwrting
#-----------------------------------------------------------------------
grep -rl "Device::ParamsDat" lib/ | xargs sed -i.bak -e "s/Device::ParamsDat/DaFunk::ParamsDat/g"
#-----------------------------------------------------------------------
