

PROJECT_ID=YOUR_PROJECT
SERVICE_ACCOUNT_EMAIL=YOUR_SERVICE_ACCOUNT_EMAIL

gcloud projects add-iam-policy-binding $PROJECT_ID \
  --member="serviceAccount:${SERVICE_ACCOUNT_EMAIL}" \
  --role="roles/storage.viewer"

gcloud services enable storage.googleapis.com \
  --project  $PROJECT_ID

gcloud projects add-iam-policy-binding $PROJECT_ID \
  --member="serviceAccount:${SERVICE_ACCOUNT_EMAIL}" \
  --role="roles/aiplatform.user"

gcloud projects add-iam-policy-binding $PROJECT_ID \
  --member="serviceAccount:${SERVICE_ACCOUNT_EMAIL}" \
  --role="roles/mcp.toolUser

gcloud run deploy cloud-storage-agent \
  --source . \
  --region us-central1 \
  --allow-unauthenticated \
  --service-account $SERVICE_ACCOUNT_EMAIL \
   --set-env-vars GOOGLE_GENAI_USE_VERTEXAI=true,GOOGLE_CLOUD_PROJECT=$PROJECT_ID,GOOGLE_CLOUD_LOCATION=us-central1,AGENT_MODEL=gemini-2.5-flash
