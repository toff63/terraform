variable "aws_key" {} // Env variable TF_VAR_aws_key
variable "aws_secret" {} // Env variable TF_VAR_aws_secret

provider "aws" {
    access_key = "${aws_key}"
    secret_key = "${aws_secret}"
    region = "us-east-1"
}
