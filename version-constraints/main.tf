terraform {
    required_providers {
        local = {
            source = "hashicorp/local"
            version = "1.4.0"
            // version = "!= 2.0.0" => terraform will make sure to not download this version
            // version = "< 1.2.0" => terraform will always make sure to download version that's less than 1.2.0 or version = "> 1.2.0"
            // we can even create a custom range => version = "> 1.2.0, < 2.0.0, != 1.4.0"
            // version = "~> 1.2" => terraform will download this version or incremental versions of 1.2 eg - 1.2, 1.3, 1.5, ... 1.9 all the way upto 1.9
            // version = "~> 1.2.0" => will download 1.2.0 or all the way up till 1.2.9
        }
    }
}

resource "local_file" "file" {
    filename = "${path.module}/dummy-file.txt"
    content = "I am so dummm!!!"
}
