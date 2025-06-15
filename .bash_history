cloudshell workspace ~
sudo python3 -m pip install google-adk==1.2.1
gcloud storage cp gs://qwiklabs-gcp-03-c71e0aa9ce30-bucket/adk_multiagent_systems.zip .
unzip adk_multiagent_systems.zip
sudo python3 -m pip install -r adk_multiagent_systems/requirements.txt
cd ~/adk_multiagent_systems
cat << EOF > parent_and_subagents/.env
GOOGLE_GENAI_USE_VERTEXAI=TRUE
GOOGLE_CLOUD_PROJECT=qwiklabs-gcp-03-c71e0aa9ce30
GOOGLE_CLOUD_LOCATION=us-central1
MODEL=gemini-2.0-flash-001
EOF

cp parent_and_subagents/.env workflow_agents/.env
cd ~/adk_multiagent_systems
adk run parent_and_subagents
adk web
cd ~/adk_multiagent_systems
adk web
