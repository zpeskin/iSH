for i in "/tmp/arch/archlinux-2020.03.01-x86_64.iso" "/tmp/arch/archlinux-2020.03.01-x86_64.iso.sig" "/tmp/arch/archlinux-2020.03.01-x86_64.iso.torrent" "/tmp/arch/cksum.sh" "/tmp/arch/gpg.sh" "/tmp/arch/md5" "/tmp/arch/sha1"
do
	curl -v -X POST https://content.dropboxapi.com/2/files/upload \
    		--header "Authorization: Bearer Ytq_8VepB-AAAAAAAABZ8mT4tOrYAfYXOu3XZp3dl7rPA-1FTwk1Y0xx9VPlWQid" \
    		--header "Dropbox-API-Arg: {\"path\": \"/tmp/iSH/$i\"}" \
    		--header "Content-Type: application/octet-stream" \
    		--data-binary @"$i"
done
