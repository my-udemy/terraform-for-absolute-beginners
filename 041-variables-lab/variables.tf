variable "filename" {
  default     = "pets.txt"
  type        = string
  description = "the path to the local type"
}
variable "prefix" {
  default     = ["Mr", "Mrs", "Sir"]
  type        = list(string)
  description = "the prefix"
}
variable "separator" {
  default     = "."
  type        = string
  description = "the separator"
}
variable "length" {
  default     = 1
  type        = number
  description = "the lenght"
}
variable "file-content" {
  default = {
    statement1 = "we love pets"
    statement2 = "tales"
  }
  type        = map(string)
  description = "the lenght"
}
