#!/bin/bash

# copyright 2002 lmoore@tump.com under the terms of the GNU LGPL.

# whiptail has trouble being called in the foo=$(whiptail ...) fashion for
# some reason.  this is very annoying.  this means that we need to use
# temporary files to store the answers from the input and list based boxes
# and then read the answers into a REPLY variable.  that just really
# stinks, oh well, that's what you get when you have a weak link
# implementation...
#
# inputBox and passwordBox could be refactored to use a common function

test -z "$WIDTH" && WIDTH=0
test -z "$HEIGHT" && HEIGHT=0
BACKTITLE=""
DIALOG=dialog
HELP=

setApplicationTitle() {
    BACKTITLE=$*
}

setHelp() {
  HELP="$@"
}

setDimension() {
    WIDTH=$1
    HEIGHT=$2
}

booleanBox() {
    $DIALOG --backtitle "$BACKTITLE" --title "$1" \
        --yesno "$2" $HEIGHT $WIDTH
}

msgBox() {
    $DIALOG --backtitle "$BACKTITLE" --title "$1" \
        --msgbox "$2" $HEIGHT $WIDTH
}

gaugeBox() {
    $DIALOG --backtitle "$BACKTITLE" --title "$1" \
        --gauge "$2" $HEIGHT $WIDTH 0
}

inputBox() {
    local temp=$(mktemp -t) || exit 1
    trap "rm -f $temp" 0
    REPLY=
    $DIALOG --backtitle "$BACKTITLE" --title "$1" \
        --inputbox "$2" $HEIGHT $WIDTH "$3" 2> $temp
    local status=$?
    [ $status = 0 ] && REPLY=$(cat $temp)
    rm -f $temp
    return $status
}

# Xdialog and {dialog,whiptail} use different mechanism to "qoute" the
# values from a checklist.  {dialog,whiptail} uses standard double quoting
# while Xdialog uses a "/" as the separator.  the slash is arguably better,
# but the double quoting is more standard.  anyway, this function can be
# overridden to allow a derived implementation to change it's quoting
# mechanism to the standard double-quoting one.  it receives two
# arguements, the file that has the data and the box type.
_listReplyHook() {
    cat $1
}

# this is the base implementation of all the list based boxes, it works
# out nicely that way.  the real function just passes it's arguments to
# this function with an extra argument specifying the actual box that
# needs to be rendered.
_genericListBox() {
    local box=$1
    shift 1
    local title=$1
    local text=$2
    shift 2
    local temp=$(mktemp -t) || exit 1
    trap "rm -f $temp" 0
    REPLY=
    $DIALOG $HELP --backtitle "$BACKTITLE" --title "$title" \
        $box "$text" $HEIGHT $WIDTH 10 \
	"$@" 2> $temp
    local status=$?
    [ $status = 0 ] && REPLY=$(_listReplyHook $temp $box)
    rm -f $temp
    return $status
}

menuBox() {
    _genericListBox --menu "$@"
}

menuBoxHelp() {
	HELP="--item-help"
	_genericListBox --menu "$@"
	status=$?
	HELP=
	return $status
}

menuBoxHelpFile() {
	HELP="--help-button"
	_genericListBox --menu "$@"
	status=$?
	HELP=
	return $status
}


checkBox() {
    _genericListBox --checklist "$@"
}

radioBox() {
    _genericListBox --radiolist "$@"
}

textBox() {
    $DIALOG --backtitle "$BACKTITLE" --title "$1" --textbox "$2" $HEIGHT $WIDTH
}

passwordBox() {
    local temp=$(mktemp -t) || exit 1
    trap "rm -f $temp" 0
    REPLY=
    $DIALOG --backtitle "$BACKTITLE" --title "$1" \
        --passwordbox "$2" $HEIGHT $WIDTH 2> $temp
    local status=$?
    [ $status = 0 ] && REPLY=$(cat $temp)
    rm -f $temp
    return $status
}

_form_gap=2
startForm() {
   _form_title=$1
   _form_items=0
   _form_labels=
   _form_text=
}

formItem() {
   _form_labels[$_form_items]=$1
   _form_text[$_form_items]=$2
   let "_form_items += 1"
}
    
displayForm() {
   local temp=$(mktemp -t) || exit 1
   
   max_length=0
   for ((i=0; i < ${#_form_labels[@]} ; i++)); do
      label=${_form_labels[$i]}
      length=`expr length $label`
      if [ $length -gt $max_length ]; then
         max_length=$length
      fi
   done
   let "max_length += 2"
    
   local form=
   local xpos=1
   (
      echo -n -e "--form '$_form_title' 0 0 20"
      for ((i=0; i < $_form_items ; i++)); do
        label=${_form_labels[$i]}
        text=${_form_text[$i]}
        if [ "$text" == "" ]; then
           text='_empty_'
        fi
        echo -n -e "$form $label $xpos 1 '$text' $xpos $max_length 30 30"
        let "xpos += _form_gap"
      done
   ) | xargs $DIALOG 2> $temp
   local status=$?
   [ $status = 0 ] && REPLY=`cat $temp`
   rm -f $temp
   return $status
}
