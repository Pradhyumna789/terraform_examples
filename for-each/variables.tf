variable "pets" {
    type = map(string)
    default = {
        "cats.txt" = "I am cat" 
        "dogs.txt" = "I am dog"
        "pigs.txt" = "I am pig"
    }
}
