#!/usr/bin/env bash

# AWS autoscaling functions

function autoscaling_describe() {
  local ASG_NAME="$1"

  aws autoscaling describe-auto-scaling-groups \
    --auto-scaling-group-names "$ASG_NAME"
}
export -f autoscaling_describe

function autoscaling_describe_instance() {
  local ASG_NAME="$1"
  local INSTANCE_ID="$2"

  aws autoscaling describe-auto-scaling-instances \
    --instance-ids "$INSTANCE_ID" \
    --query "AutoScalingInstances[?contains(AutoScalingGroupName, '$ASG_NAME')]"
}
export -f autoscaling_describe_instance

function autoscaling_describe_instances() {
  local ASG_NAME="$1"

  aws autoscaling describe-auto-scaling-instances \
    --query "AutoScalingInstances[?contains(AutoScalingGroupName, '$ASG_NAME')].InstanceId"
}
export -f autoscaling_describe_instances

function autoscaling_describe_healthy_instances() {
  local ASG_NAME="$1"

  aws autoscaling describe-auto-scaling-instances \
    --query "AutoScalingInstances[?(AutoScalingGroupName=='$ASG_NAME' && HealthStatus=='HEALTHY')].InstanceId"
}
export -f autoscaling_describe_healthy_instances

function autoscaling_describe_lifecycle_hooks() {
  local ASG_NAME="$1"

  aws autoscaling describe-lifecycle-hooks \
    --auto-scaling-group-name "$ASG_NAME" \
    --query "LifecycleHooks[*].LifecycleHookName"
}
export -f autoscaling_describe_lifecycle_hooks

function autoscaling_attach_instances() {
  local ASG_NAME="$1"
  local INSTANCE_ID="$2"

  aws autoscaling attach-instances \
    --instance-ids "$INSTANCE_ID" \
    --auto-scaling-group-name "$ASG_NAME"
}
export -f autoscaling_attach_instances

function autoscaling_delete() {
  local ASG_NAME="$1"

  aws autoscaling delete-auto-scaling-group \
    --auto-scaling-group-name "$ASG_NAME" \
    --force-delete
}
export -f autoscaling_delete

function autoscaling_delete_lifecycle_hook() {
  local ASG_NAME="$1"
  local HOOK_NAME="$2"

  aws autoscaling delete-lifecycle-hook \
    --auto-scaling-group-name "$ASG_NAME" \
    --lifecycle-hook-name "$HOOK_NAME"
}
export -f autoscaling_delete_lifecycle_hook

function autoscaling_detach_instances() {
  local ASG_NAME="$1"
  local INSTANCE_ID="$2"

  aws autoscaling detach-instances \
    --instance-ids "$INSTANCE_ID" \
    --auto-scaling-group-name "$ASG_NAME" \
    --should-decrement-desired-capacity
}
export -f autoscaling_detach_instances

function autoscaling_resume_processes() {
  local ASG_NAME="$1"

  aws autoscaling resume-processes \
    --auto-scaling-group-name "$ASG_NAME"
}
export -f autoscaling_resume_processes

function autoscaling_set_instance_health() {
  local ID="$1"
  local STATUS="${2:-"Healthy"}"

  aws autoscaling set-instance-health \
    --instance-id "$ID" \
    --health-status "$STATUS"
}
export -f autoscaling_set_instance_health

function autoscaling_suspend_processes() {
  local ASG_NAME="$1"

  aws autoscaling suspend-processes \
    --auto-scaling-group-name "$ASG_NAME"
}
export -f autoscaling_suspend_processes

function autoscaling_set_desired_size() {
  local ASG_NAME="$1"
  local SIZE="$2"

  aws autoscaling update-auto-scaling-group \
    --auto-scaling-group-name "$ASG_NAME" \
    --desired-capacity "$SIZE"
}
export -f autoscaling_set_desired_size

function autoscaling_set_max_size() {
  local ASG_NAME="$1"
  local SIZE="$2"

  aws autoscaling update-auto-scaling-group \
    --auto-scaling-group-name "$ASG_NAME" \
    --max-size "$SIZE"
}
export -f autoscaling_set_max_size

function autoscaling_set_min_size() {
  local ASG_NAME="$1"
  local SIZE="$2"

  aws autoscaling update-auto-scaling-group \
    --auto-scaling-group-name "$ASG_NAME" \
    --min-size "$SIZE"
}
export -f autoscaling_set_min_size

function autoscaling_set_size() {
  local ASG_NAME="$1"
  local SIZE="$2"

  aws autoscaling update-auto-scaling-group \
    --auto-scaling-group-name "$ASG_NAME" \
    --desired-capacity "$SIZE" \
    --max-size "$SIZE" \
    --min-size "$SIZE"
}
export -f autoscaling_set_size

function autoscaling_wait_detached() {
  local ASG_NAME="$1"
  local INSTANCE_ID="$2"

  DONE=0
  while [ "$DONE" = "0" ];do
    sleep 15
    STATUS=$(autoscaling_describe_instance "$ASG_NAME" "$INSTANCE_ID")
    if [ "$STATUS" = "[]" ]; then
      DONE=1
    else
      printf "."
      # echo $STATUS
    fi
  done
}
export -f autoscaling_wait_detached
