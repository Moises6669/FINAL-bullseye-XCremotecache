set -uo pipefail

#  JIRA_TOKEN=TVDir9i2Vq2kRl3dasXN47B6

# if [[ -f "../output/scan/report.junit" ]]; then
#     echo "Uploading report.junit file to XRay"
#     project_key="TST13"
#     token=$(curl -H "Content-Type: application/json" -X POST --data '{"client_id":"CD075895727E4E5DAFD5FCC1FE7A78BF","client_secret":"65344aaa49d1a15ff9f0d1c2353e1b80f6bba5b410c18f263e655ad8daf5ac23"}' https://xray.cloud.getxray.app/api/v2/authenticate | tr -d '"')
#     curl -H "Content-Type: text/xml" -X POST -H "Authorization: Bearer $token" --data @"../output/scan/report.junit" https://xray.cloud.getxray.app/api/v2/import/execution/junit?projectKey="TST13"
# else
#     echo "File report.junit not found"
# fi
NOW=$(date +"%D")
summary="Test Execution result for en_us: ${NOW}  "
description="tests passed"
execution_data="$(jq --arg s "$summary" --arg d "$description" '.update .summary[] .set = $s | .fields.description = $d' ./issue_template.json)"

# echo -n moises@all-win.software:TVDir9i2Vq2kRl3dasXN47B6 | base64

# $GITHUB_SERVER_URL/GITHUB_REPOSITORY/runs/$GITHUB_RUN_ID
# execution_key=$(jq '.key' response.txt | tr -d '"')

curl -H "Authorization: Basic bW9pc2VzQGFsbC13aW4uc29mdHdhcmU6VFZEaXI5aTJWcTJrUmwzZGFzWE40N0I2" \
    -X PUT --data "${execution_data}" \
    -H "Content-Type: application/json" \
    https://moisesa.atlassian.net/rest/api/2/issue/TST13-178
