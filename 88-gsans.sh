#!/sbin/sh
#
# ADDOND_VERSION=2
#
# /system/addon.d/88-gsans.sh
# During a LineageOS upgrade, this script backs up gsans,
# /system is formatted and reinstalled, then the files are restored.
#

. /tmp/backuptool.functions

list_files() {
cat <<EOF
etc/font_fallback.xml
etc/fonts.xml
fonts/GoogleSansFlex-Regular.ttf
fonts/GoogleSans-Italic.ttf
fonts/GoogleSans-Regular.ttf
EOF
}

case "$1" in
  backup)
    list_files | while read FILE DUMMY; do
      backup_file $S/"$FILE"
    done
  ;;
  restore)
    list_files | while read FILE REPLACEMENT; do
      R=""
      [ -n "$REPLACEMENT" ] && R="$S/$REPLACEMENT"
      [ -f "$C/$S/$FILE" ] && restore_file $S/"$FILE" "$R"
    done
  ;;
  pre-backup)
    # Stub
  ;;
  post-backup)
    # Stub
  ;;
  pre-restore)
    # Stub
  ;;
  post-restore)
    # Stub
  ;;
esac
