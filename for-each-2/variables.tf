variable "users" {
    type = set(string)
    default = [ "user10.txt", "user11.txt", "user12.txt", "user10.txt"]
}
variable "content" {
    default = "password: S3cr3tP@ssw0rd"
}

