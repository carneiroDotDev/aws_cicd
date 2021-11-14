#!/bin/sh

echo "Pre-Build Steps:"
echo "authenticating with AWS ECR..."
aws ecr get-login-password --region eu-central-1 | docker login --username AWS --password-stdin 919123374228.dkr.ecr.eu-central-1.amazonaws.com

echo "Build Steps:"
echo "building image..."
docker build -t 919123374228.dkr.ecr.eu-central-1.amazonaws.com/awscicd:latest .

echo "Post-Build Steps:"
echo "pushing image to AWS ECR..."
docker push 919123374228.dkr.ecr.eu-central-1.amazonaws.com/awscicd:latest

echo "updating AWS ECS service..."
aws ecs update-service --cluster awscicd-cluster --service react-sv --force-new-deployment --no-cli-pager

echo "Done!"