alias 'ls=ls --color'
alias 'la=ls -a'
alias 'll=la -lh'
alias 'du=du -hl'
alias 'rm=rm -rfv'
alias 'mv=mv -v'
alias 'cp=cp -Rv'
alias 'rmdir=rmdir -v'
alias 'mkdir=mkdir -pv'
dbpost() {
OAUTH_2_KEY="Ytq_8VepB-AAAAAAAABZ8mT4tOrYAfYXOu3XZp3dl7rPA-1FTwk1Y0xx9VPlWQid"
curl -X POST https://content.dropboxapi.com/2/files/upload \
    --header "Authorization: Bearer ${OAUTH_2_KEY}" \
    --header "Dropbox-API-Arg: {\"path\": \"$2/$1\"}" \
    --header "Content-Type: application/octet-stream" \
    --data-binary @"$1"
}
export dbpost
