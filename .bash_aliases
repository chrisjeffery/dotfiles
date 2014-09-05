# some more ls aliases
alias l='ls -l'
alias ll='ls -Al'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'


## pass options to free ## 
alias meminfo='free -m -l -t'
 
## get top process eating memory
alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'
 
## get top process eating cpu ##
alias pscpu='ps auxf | sort -nr -k 3'
alias pscpu10='ps auxf | sort -nr -k 3 | head -10'
 
## Get server cpu info ##
alias cpuinfo='lscpu'
alias projector_attach='xrandr --output HDMI1 --auto --left-of LVDS1'
alias projector_detach='xrandr --output HDMI1 --off'
 
## older system use /proc/cpuinfo ##
##alias cpuinfo='less /proc/cpuinfo' ##
 
## get GPU ram on desktop / laptop## 
alias gpumeminfo='grep -i --color memory /var/log/Xorg.0.log'

alias less='less -R'
alias ack='~/bin/ack'
alias tmux='~/bin/tmux'
alias node='/space/bin/node'
alias npm='/space/bin/npm'
alias sqlp='rlwrap /usr/lib/oracle/11.2/client64/bin/sqlplus'
alias nose='nosetests --rednose'

alias lock='i3lock -n -d -c 222830'

alias ie8alt1='rdesktop wintest-1.lohs.geneity -g 1800x1140'
alias ie10='rdesktop wintest-3.lohs.geneity -g 1800x1140'
alias ie8alt4='rdesktop wintest-4.lohs.geneity -g 1800x1140'

alias ie8='rdesktop -d GENEITY wintest-7.lohs.geneity -g 1800x1140'
alias ie9='rdesktop -d GENEITY wintest-8.lohs.geneity -g 1800x1140'
#alias ie9ps='rdesktop -d GENEITY wintest-8.lohs.geneity -g 1800x1140'
alias photoshop='rdesktop -d GENEITY wintest-9.lohs.geneity -g 1910x1180'
alias photoshopfullscreen='rdesktop -d GENEITY wintest-9.lohs.geneity -f'

alias mount='gvfs-mount -m'
alias umount='gvfs-mount -u'

alias pain='ie8'

alias watchsassbfv='cd ~/git/; sass --sourcemap --style expanded -I PROJ-BetfairVirtual/cms/apps/web/static/scss -I PROJ-BetfairVirtual/betfair_virtual/static/desktop/betfair_virtual/scss --watch PROJ-BetfairVirtual/betfair_virtual/static/desktop/betfair_virtual/scss:PROJ-BetfairVirtual/betfair_virtual/static/desktop/betfair_virtual/css'

alias watchsassgazzetta='cd ~/git/; sass --style expanded -I gazzetta/cms/apps/web/static/scss -I gazzetta/titanbet/static/desktop/gazzabet/scss --watch gazzetta/titanbet/static/desktop/gazzabet/scss:gazzetta/titanbet/static/desktop/gazzabet/css'

alias watchsassgazzettamobile='cd ~/git/; sass --style expanded -I gazzetta/cms/apps/web/static/scss -I gazzetta/titanbet/static/mobile/gazzabet/scss --watch gazzetta/titanbet/static/mobile/gazzabet/scss:gazzetta/titanbet/static/mobile/gazzabet/css'


alias tmux='tmux -2'
alias intellij='~/intellij/bin/idea.sh'






