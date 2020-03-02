OAUTH="Ytq_8VepB-AAAAAAAABZ8mT4tOrYAfYXOu3XZp3dl7rPA-1FTwk1Y0xx9VPlWQid"
for i in "/Personal/My Project-8ff8416e7b40.json"
do
	curl -v -X POST https://api.dropboxapi.com/2/files/delete_v2 \
	    --header "Authorization: Bearer ${OAUTH}" \
	    --header "Content-Type: application/json" \
	    --data "{\"path\": \"$i\"}"
done
