#!/bin/bash
# ------------------------------------------------------------------
# [Author]          Sumit Kumar
# [Description]     rclone cloud sync script
#-------------------------------------------------------------------
#
#
# copy:             Copy the files from the local computer to the remote storage, 
#                   skipping over files that are already present on the remote storage.
# update:           Skip any files that are on the remote storage that have a modified time that is newer than the file on the local computer.
# verbose:          Gives information about every file that is transferred.
# transfers 30:     This sets the number of files to copy in parallel.
# checkers 8:       How many “checkers” to run in parallel. Checkers monitor the transfers that are in progress.,
# contimeout 60s:   The connection timeout. It sets the time that rclone will try to make a connection to the remote storage.
# timeout 300s:     If a transfer becomes idle for this amount of time, it is considered broken and is disconnected.
# retries 3:        If there are this many errors, the entire copy action will be restarted.
# low-level-retries 10: A low-level retry tries to repeat one failing operation, such as a single HTTP request. This value sets the limit for the number of retries.
# bwlimit 200k :    Bandwidht limit at 200 KB/s 
# stats 1s:         rclone can provide statistics on the transferred files. This sets the frequency of update of the statistics to one second.
# “/home/sk/Downloads/cloud”: The local directory to we’re going to copy to the remote storage.
# “gdrive:backup”:  The destination directory in the remote storage. Note the use of “google-drive”,
#                   which is the name we gave to this remote connection during the the rclone config sequence. 
#                   Also note the colon “:” that is used as a separator between the remote storage name and the directory name.
#                   Subdirectories are separated by the usual “/” forward slash. If the destination directory does not exist, it will be created.
#
#
#
# ------------------------------------------------------------------

/usr/bin/rclone copy --update --verbose --transfers 30 --checkers 8 --contimeout 60s --timeout 300s --retries 3 --low-level-retries 10 --bwlimit 200k --stats 1s "/home/mukesh/Downloads/cloud" "gdrive:backup"

# notify-send uses icon from the /usr/share/icons/gnome/32x32 (& also /usr/share/notify-osd/icons/...)
 if [ $? -ne 0 ]
  then
        notify-send -u critical -i "network-wireless.png" 'Cloud Sync Update' 'Failure'
        exit 1
 else
        notify-send -u critical -i "network-wireless.png" 'Cloud Sync Update' 'Success'
 fi

