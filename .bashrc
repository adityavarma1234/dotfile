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
        gor | rails s -p 3001;
}
rc(){
        gor | rails c;
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
export PS1="\n\[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] \n\n$ \[\033[00m\]"
