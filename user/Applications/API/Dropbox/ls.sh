OAUTH="Ytq_8VepB-AAAAAAAABZ8mT4tOrYAfYXOu3XZp3dl7rPA-1FTwk1Y0xx9VPlWQid"
curl -X POST https://api.dropboxapi.com/2/files/list_folder \
    --header "Authorization: Bearer ${OAUTH}" \
    --header "Content-Type: application/json" \
    --data "{\"path\": \"/tmp\",\"recursive\": false,\"include_media_info\": false,\"include_deleted\": false,\"include_has_explicit_shared_members\": false,\"include_mounted_folders\": true,\"include_non_downloadable_files\": true}"
