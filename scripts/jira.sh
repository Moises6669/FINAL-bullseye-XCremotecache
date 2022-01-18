set -uo pipefail

 JIRA_TOKEN=TVDir9i2Vq2kRl3dasXN47B6

if [[ -f "../output/scan/report.junit" ]]; then
    echo "Uploading report.junit file to XRay"
    project_key="TST13"
    token=$(curl -H "Content-Type: application/json" -X POST --data '{"client_id":"CD075895727E4E5DAFD5FCC1FE7A78BF","client_secret":"65344aaa49d1a15ff9f0d1c2353e1b80f6bba5b410c18f263e655ad8daf5ac23"}' https://xray.cloud.getxray.app/api/v2/authenticate | tr -d '"')
    curl -H "Content-Type: text/xml" -X POST -H "Authorization: Bearer $token" --data @"../output/scan/report.junit" https://xray.cloud.getxray.app/api/v2/import/execution/junit?projectKey="TST13"
else
    echo "File report.junit not found"
fi

# firebase_matrix_link="Matrix Link: https://console.firebase.google.com/project/us-app-a5307/testlab/histories/bh.a6de7fc94e6ed31e/matrices/5636317798425813177"
# extracted_url=$(grep -A1 "More details are available at:" ../ww-mobile/build/fladle/firebase-results/MatrixResultsReport.txt)
# if [ -z "$extracted_url" ]; then
#     echo "All tests passed successfully"
# else
#     firebase_matrix_link=$extracted_url
# fi
NOW=$(date +"%D")
summary="XCX test execution for Github  executed at: ${NOW}  "
description="tests passed"
execution_data="$(jq --arg s "$summary" --arg d "$description" '.update .summary[] .set = $s | .fields.description = $d' ./issue_template.json)"

# execution_key=$(jq '.key' response.txt | tr -d '"')
curl -H "Authorization: Basic TVDir9i2Vq2kRl3dasXN47B6" \
    -X PUT --data "${execution_data}" \
    -H "Content-Type: application/json" \
    https://moisesa.atlassian.net/rest/api/2/issue/TST13-195

