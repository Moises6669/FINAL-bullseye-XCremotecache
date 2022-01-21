set -uo pipefail
if [[ -f "./output/scan/report.junit" ]]; then
    echo "Uploading report.junit file to XRay"
    project_key="TST34"
    token=$(curl -H "Content-Type: application/json" -X POST --data '{"client_id":"CD075895727E4E5DAFD5FCC1FE7A78BF","client_secret":"65344aaa49d1a15ff9f0d1c2353e1b80f6bba5b410c18f263e655ad8daf5ac23"}' https://xray.cloud.getxray.app/api/v2/authenticate | tr -d '"')
    curl -H "Content-Type: text/xml" -X POST -H "Authorization: Bearer $token" --data @"../output/scan/report.junit" https://xray.cloud.getxray.app/api/v2/import/execution/junit?projectKey=${project_key} >response.txt
else
    echo "File report.junit not found"
fi
JIRA_TOKEN=$(echo -n moises@all-win.software:0XHWCRUZtM5h2CaI8yyA7CAD | base64)
execution_key=$(jq '.key' response.txt | tr -d '"')
NOW=$(date +"%D")
summary="Test Execution result for en_us: ${NOW}  "
description="executed in:More details are available at: /output/scan/"
execution_data="$(jq --arg s "$summary" --arg d "$description" '.update .summary[] .set = $s | .fields.description = $d' ./scripts/issue_template.json)"

curl -H "Authorization: Basic ${JIRA_TOKEN}" \
    -X PUT --data "${execution_data}" \
    -H "Content-Type: application/json" \
    https://moisesa.atlassian.net/rest/api/2/issue/$execution_key
