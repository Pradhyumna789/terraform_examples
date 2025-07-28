# variable "policy_arn" {
#     default = ["arn:aws:iam::772565387877:policy/EC2-List-Read-First-Half", "arn:aws:iam::772565387877:policy/EC2-List-Read-Second-Half"]
# }

# variable "users" {
#     default = ["buzz", "jack"]
# }

variable "users" {
    default = tomap({
        users = {
            jack = {
                policy_arn_half_1 = "arn:aws:iam::772565387877:policy/EC2-List-Read-First-Half"
                policy_arn_half_2 = "arn:aws:iam::772565387877:policy/EC2-List-Read-Second-Half"
            }

            buzz = {
                policy_arn_half_1 = "arn:aws:iam::772565387877:policy/EC2-List-Read-First-Half"
                policy_arn_half_2 = "arn:aws:iam::772565387877:policy/EC2-List-Read-Second-Half"
            }
        }
    })
}

