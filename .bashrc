parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
dr(){
        docker start $(docker ps -a -q);
}
gor(){
 cd ~/workspace/gor/gor_refactored;
}
rs(){
        gor | /bin/bash --login | bundle exec rails s -p 3001;
}
rc(){
        gor | /bin/bash --login | bundle exec rails c;
}
wb(){
        cd ~/workspace/practice/personal_website/;
}
# Edit bash
eb(){
        vim ~/.bashrc;
}
# Source bash
sb(){
        source ~/.bashrc;
}
# Show only first character of all directories except current one
sps() {                                                                                              
    python -c "import sys; dirs = sys.argv[1].split('/'); print '/'.join(d[:1] for d in dirs[:-1]) + '/' + dirs[-1]" $PWD
}
function get_prod_dump() {
    gcloud compute ssh aditya@mongodb-1-server-1 --command "cd ~/ && rm -f dump.gz && rm -rf dump && mongodump && tar -cvzf dump.gz ~/dump/"
    gcloud compute scp aditya@mongodb-1-server-1:/home/aditya/dump.gz ~/Downloads/dump.gz --compress --recurse
}
# export PS1="\n\[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] \n\n : ) \[\033[00m\]"
function brc() {
    kubectl --namespace=prod exec -it `kubectl --namespace=prod get pods | grep -m 1 grabonrent-controller-blr | awk '{print $1;}'` -- bash -c 'export TERM=xterm-256color && cd gor_refactored && rvm-exec 2.3.3 rails c'
}
function hrc() {
    kubectl --namespace=prod exec -it `kubectl --namespace=prod get pods | grep -m 1 grabonrent-controller-hyd | awk '{print $1;}'` -- bash -c 'export TERM=xterm-256color && cd gor_refactored && rvm-exec 2.3.3 rails c'
}
function bbash() {
    kubectl --namespace=prod exec -it `kubectl --namespace=prod get pods | grep -m 1 grabonrent-controller-blr | awk '{print $1;}'` -- bash
}
function hbash() {
    kubectl --namespace=prod exec -it `kubectl --namespace=prod get pods | grep -m 1 grabonrent-controller-hyd | awk '{print $1;}'` -- bash
}
gsettings set org.gnome.desktop.peripherals.touchpad tap-to-click true
# if [ -t 1 ]; then
#         exec zsh
# fi

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/aditya/google-cloud-sdk/path.bash.inc' ]; then source '/home/aditya/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/aditya/google-cloud-sdk/completion.bash.inc' ]; then source '/home/aditya/google-cloud-sdk/completion.bash.inc'; fi
