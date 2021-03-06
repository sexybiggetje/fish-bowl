# fish-bowl, http://source.theimpossibleastronaut.com/fish-bowl/

# Definitions required here
set FISHBOWLVERSION 0.1
set FISHBOWLUSER (whoami)
set FISHBOWLPLATFORM (uname -s)

# Extend path
for p in /usr/bin /usr/local/bin /opt/local/bin ~/bin ~/.config/fish/bin
    if test -d $p
        set PATH $p $PATH
    end
end

# Dependencies (internal)
source $FBPATH/src/githelper.fish
source $FBPATH/src/functions.fish

# Load plugins. Loader will see if they need to be activated.
for pluginName in $FBPATH/plugins/*
    loadFishBowlPlugin (basename $pluginName)
end

# Restore theme if one exists
if test -f $FBPATH/themes/.activethemes
    setActivePrompt (cat $FBPATH/themes/.activetheme | sed -e 's/^ *//g' -e 's/ *$//g')
end

# Restore prompt if one exists
if test -f $FBPATH/prompts/.activeprompt
    setActivePrompt (cat $FBPATH/prompts/.activeprompt | sed -e 's/^ *//g' -e 's/ *$//g')
end