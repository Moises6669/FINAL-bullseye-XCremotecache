set -uo pipefail

echo "Uploading report.junit file to XRay"
project_key="FNDMA"
token=$(curl -H "Content-Type: application/json" -X POST --data '{"client_id":"CD075895727E4E5DAFD5FCC1FE7A78BF","client_secret":"65344aaa49d1a15ff9f0d1c2353e1b80f6bba5b410c18f263e655ad8daf5ac23"}' https://xray.cloud.getxray.app/api/v2/authenticate | tr -d '"')
curl -H "Content-Type: text/xml" -X POST -H "Authorization: Bearer $token" --data @"../output/scan/report.junit" https://xray.cloud.getxray.app/api/v2/import/execution/junit?projectKey="$project_key" >"../xray_response.json"
