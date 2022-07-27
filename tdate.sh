#!/bin/sh
#
vardate=$(date +'%Y-%m-%d %H:%M (W%U)'  )

cat << EOFMENU
<openbox_pipe_menu>
  <item label="$vardate" />
</openbox_pipe_menu>
EOFMENU
