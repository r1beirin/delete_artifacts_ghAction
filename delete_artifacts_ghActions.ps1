# https://docs.github.com/pt/rest/actions/artifacts?apiVersion=2022-11-28
$token = "token" # Token with actions: read and write
$owner = "r1beirin"
$repo = "X"
$githubApiVersion = "2022-11-28"

$headers = @{
    "Accept" = "application/vnd.github+json"
    "Authorization" = "Bearer $token"
    "X-GitHub-Api-Version" = $github_api_version
}

$response = Invoke-RestMethod -Uri "https://api.github.com/repos/$owner/$repo/actions/artifacts" -Headers $headers
$ids = $response.artifacts.id

foreach ($id in $ids) {
	$artifactResponse = Invoke-RestMethod "https://api.github.com/repos/$owner/$repo/actions/artifacts/$id" -Headers $headers -Method Delete
    Write-Output "Removing ID: $id"
}
