uname -a
sudo dnf update -y
sudo dnf -y install wget tar nano
#!/usr/bin/env bash
URL="$1"
DST_FILE="$2"

[ -z "$DST_FILE" ] && {
    echo "Syntax: `basename $0` <url> <dst_file>" >&2
    echo "Example: `basename $0` https://cloud.mail.ru/public/BeAr/3s8QfYgLj /path/to/my/file.rar" >&2
    echo "Test: `basename $0` https://cloud.mail.ru/public/Y5C8/KRwhz4JHW/linux-5.12.7.tar.xz linux-5.12.7.tar.xz" >&2
    exit 1
}

function getPageInformation() {
	local pageUrl="$1"

	wget --quiet -O - "$pageUrl" | sed -n "/window.cloudSettings/,/};<\/script>/p"
}

function ensureFileExists() {
	local pageInformation="$1"

	echo "$pageInformation" |  grep -q '"not_exists"' && {
		echo "Error: file does not exist" >&2
		exit 1
	}
}

function extractDownloadUrl() {
	local pageUrl="$1" pageInformation="$2" storageUrl filePath

	storageUrl=$(echo "$pageInformation" | sed -n "/weblink_get/,/]/p" | fgrep -m 1 "url" | cut -d "\"" -f 4)
    	filePath=$(echo "$pageUrl" | awk -F '/public/' '{print $2}')

	[ -z "$storageUrl" ] || [ -z "$filePath" ] && {
		echo "Error: failed to extract storage's url or file path" >&2
		exit 1
	}

	echo "$storageUrl/$filePath"
}

pageInformation=$(getPageInformation "$URL")
ensureFileExists "$pageInformation"
downloadUrl=$(extractDownloadUrl "$URL" "$pageInformation")

wget --continue --no-check-certificate --referer="$URL" "$downloadUrl" -O "$DST_FILE"
exit
