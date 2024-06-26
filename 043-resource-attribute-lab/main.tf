resource "local_file" "pet" {
  filename = var.filename
  content  = var.filecontent
}

resource "random_pet" "my-pet" {
  prefix    = "Mr ${local_file.pet.content}"
  separator = "."
  length    = 1
}
