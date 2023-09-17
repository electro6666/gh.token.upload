# add your GitHub username, repository name, and access token
GITHUB_USERNAME=""
REPO_NAME=""
GITHUB_TOKEN=""

# Create a release
RELEASE_RESPONSE=$(curl -X POST "https://api.github.com/repos/$GITHUB_USERNAME/$REPO_NAME/releases" \
  -H "Authorization: token $GITHUB_TOKEN" \
  -d '{"tag_name": "v1.0", "name": "Release v1.0", "body": "Release Description", "draft": false, "prerelease": false}')

# Extract the release ID from the response
RELEASE_ID=$(echo "$RELEASE_RESPONSE" | jq -r '.id')

# Upload a file to the release
curl -X POST "https://uploads.github.com/repos/$GITHUB_USERNAME/$REPO_NAME/releases/$RELEASE_ID/assets?name=#Replace-with-your-file-name" \
  -H "Authorization: token $GITHUB_TOKEN" \
  --header "Content-Type: application/zip" \
  --data-binary @"#Replace-with-your-file-name"
