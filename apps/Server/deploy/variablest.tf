# Following are essential variables for each project.
# Following are included as environment variables (tfvars) provisioned by Cloud Build.
# These variables must be in ALL CAPS.

variable "PROJECT" {
    type = string
}

variable "CONTAINER_IMAGE" {
    type = string
}

variable "CLOUD_SERVICE_NAME" {
    type = string
}

variable "STATE_BUCKET" {
    type = string
}

variable "STATE_BUCKET_PREFIX" {
    type = string
}

variable "REGION" {
    type = string
}

variable "ENVS" {
    type = map
    default = {
        TESTING = "ENVS"
    }
}